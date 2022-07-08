import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/enums.dart';
import '../../../resources/resources.dart';
import '../../../resources/text_style.dart';
import '../../../routes/app_routes.dart';
import '../../../services/auth_service.dart';
import '../../../services/fb_storage_service.dart';
import '../../../utils/api_request.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/fb_collections.dart';
import '../../../utils/show_message.dart';
import '../model/user_data.dart';

class AuthController extends GetxController {
  ApiRequests api = ApiRequests();
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserData? appUser = UserData();
  BaseAuth? baseAuth = Auth();
  TextEditingController phoneNumberController = TextEditingController();
  FStorageServices firebaseStorage = FStorageServices();
  // PageController tabController = new PageController();
  File? pickedFile;
  ImagePicker imgPicker = ImagePicker();
  bool isLoading = false;
  bool signup = false;
  bool passMatch = false;
  bool termsCheck = false;
  int signUpIndex = 0;
  bool isObSecure = true;
  bool isObSecure2 = true;

  Future acceptTerms() async {
    termsCheck = !termsCheck;
    update();
  }

  void toggleObSecure(bool isPassword) {
    if (isPassword) {
      isObSecure = !isObSecure;
    } else {
      isObSecure2 = !isObSecure2;
    }

    update();
  }

  void startLoader() {
    isLoading = true;
    update();
  }

  void stopLoader() {
    isLoading = false;
    update();
  }

  void goToSignup() {
    signup = !signup;
    signUpIndex = 0;
    update();
  }

  void changeSignUpPageIndex(int index) {
    if (index == 0) {
      signUpIndex = 1;
    } else {
      signUpIndex = 0;
    }

    update();
  }

  Future<void> registerUser(UserData userData, String password) async {
    startLoader();
    DocumentSnapshot userDocument =
        await FBCollections.users.doc(userData.email!).get();
    stopLoader();
    if (userDocument.exists) {
      log("user exist");
      ShowMessage.inSnackBar("Error", "User already exists");
    } else {
      startLoader();
      log("user does not exist");
      baseAuth
          ?.createUserWithEmailPassword(userData.email!, password)
          .then((value) async {
        log(value);
        await FBCollections.users
            .doc(userData.email)
            .set(userData.toJson())
            .then((value) async {
          appUser = await getUserFromDB(userData.email!);
          stopLoader();
          Get.offAllNamed(Routes.registrationSuccessFull);
        });
      });
    }
  }

  Future<UserData?> getUserFromDB(String docId) async {
    startLoader();
    DocumentSnapshot doc = await FBCollections.users.doc(docId).get();
    stopLoader();
    if (!doc.exists) {
      return null;
    }
    UserData user = UserData.fromJson(doc.data() as Map<String, dynamic>);
    return user;
  }

  Future signInNow(String email, String password) async {
    startLoader();
    baseAuth?.signInWithEmailPassword(email, password).then((value) async {
      log("sign in response::::$value");

      if (value.toString() == "0") {
        stopLoader();
      } else if (value.toString() == "1") {
        stopLoader();
        ShowMessage.inSnackBar(
          "Verification Error",
          "please verify your email through link",
        );
      } else {
        await handleSignIn(email: email);
      }
    });
  }

  Future<void> handleSignIn({String? email, bool isSplash = false}) async {
    log("handle sign in");
    startLoader();
    appUser = (await getUserFromDB(email!));
    await updateFcm(email);
    stopLoader();
    log("user found = ${appUser?.toJson()}");
    if (appUser?.status == UserStatus.active.index) {
      Get.offAllNamed(Routes.dashboard);
    } else {
      if (isSplash) {
        Get.offAllNamed(
          Routes.signupScreen,
        );
      }
      ShowMessage.inSnackBar(
        "Blocked",
        "User is blocked and cannot sign in",
      );
    }
  }

  Future<void> getCurrentUser() async {
    var user = await baseAuth?.getCurrentUser();
    if (user != null) {
      var userData = await getUserFromDB(user.email!);
      if (userData != null) {
        handleSignIn(email: user.email, isSplash: true);
      } else {
        await auth.signOut();
        await Get.offAllNamed(
          Routes.signupScreen,
        );
      }
    } else {
      await auth.signOut();
      await Get.offAllNamed(
        Routes.signupScreen,
      );
    }
  }

  Future<void> updateFcm(String docID) async {
    var fcm = await FBCollections.users
        .doc(docID)
        .update({"fcm_id": AppUtils.myFcmToken});

    return fcm;
  }

  Future<void> imagePickerDialog(BuildContext context, bool isProfile) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Add a Picture",
              style: AppTextStyle()
                  .semiBoldPoppins()
                  .copyWith(color: R.colors.theme),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    onTap: () {
                      getImage(ImageSource.gallery, isProfile);
                      Navigator.pop(context);
                    },
                    child: const Text("Open Galley"),
                  ),
                  const Padding(padding: EdgeInsets.all(10.0)),
                  GestureDetector(
                    onTap: () {
                      getImage(ImageSource.camera, isProfile);
                      Navigator.pop(context);
                    },
                    child: const Text("Open Camera"),
                  ),
                ],
              ),
            ),
          );
        });
  }

  getImage(ImageSource source, bool isProfile) async {
    try {
      PickedFile? picture = (await imgPicker.getImage(source: source));

      if (picture != null) {
        startLoader();
        pickedFile = File(picture.path);
        if (isProfile) {
          await updateImage();
        } else {
          stopLoader();
        }
      }
    } catch (e) {
      stopLoader();
      print(e);
      printError();
    }
    update();
  }

  uploadImage(){
    print(pickedFile!.path);
    ApiRequests().updateProfileImage(image:    pickedFile!.path);
  }
  updateImage() async {
    if (pickedFile != null) {
      startLoader();
      appUser?.image = await firebaseStorage.uploadSingleFile(
          file: pickedFile,
          bucketName: FireStoreBuckets.profile,
          email: appUser?.email!.toLowerCase().trim());
      await FBCollections.users
          .doc(appUser?.email)
          .update({'image': appUser?.image});
      stopLoader();
      update();
    }
  }

  Future<void> fetchResults(String path) async {
    startLoader();
    await api.fetchResults(path).then((response) {
      stopLoader();
      if (response != false) {
        log("api response ${response.toString()}");
      }
    });
  }
}
