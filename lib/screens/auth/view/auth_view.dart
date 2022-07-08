import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:sizer/sizer.dart';

import '../../../constants/enums.dart';
import '../../../resources/resources.dart';
import '../../../resources/sized_box.dart';
import '../../../services/datePickerService.dart';
import '../../../utils/app_utils.dart';
import '../../../utils/validator.dart';
import '../../../widgets/heading.dart';
import '../../../widgets/loader.dart';
import '../../../widgets/my_button.dart';
import '../controller/auth_controller.dart';
import '../model/user_data.dart';

class AuthView extends StatefulWidget {
  final String? userTYpe;
  const AuthView({Key? key, this.userTYpe}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool visibility = true;
  bool visibility2 = true;
  TextEditingController dobCon = TextEditingController();
  TextEditingController numberTC = TextEditingController();
  TextEditingController nameTC = TextEditingController();
  TextEditingController emailTC = TextEditingController();

  TextEditingController confirmPassTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController signInEmailTC = TextEditingController();
  TextEditingController signInPassTC = TextEditingController();
  String selectedGender = '';
  List<String> genderList = [
    "Male",
    "Female",
  ];
  String selectedRole = '';
  List<String> userRoles = [
    "Patient",
    "Doctor",
  ];
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final PageController _controller = PageController();
  int currentPage = 0;

  get child => null;
  @override
  void dispose() {
    // TODO: implement dispose
    numberTC.clear();
    nameTC.clear();
    emailTC.clear();
    confirmPassTC.clear();
    passwordTC.clear();
    signInEmailTC.clear();
    signInPassTC.clear();

    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // selectedRole = widget.userTYpe ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Scaffold(
        backgroundColor: R.colors.theme,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: R.colors.theme,
          elevation: 0,
          title: Text(
            "Pikipedia",
            style: GoogleFonts.lobster(
              textStyle: const TextStyle(
                  color: Colors.black, letterSpacing: .5, fontSize: 40),
            ),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: controller.isLoading,
          progressIndicator: MyLoader(),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: BoxDecoration(
                color: R.colors.lite,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              onPageChanged: (page) {
                currentPage = page;
                setState(() {});
              },
              children: [
                Form(
                  key: signInFormKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h5,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 4.w,
                          right: 4.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Login",
                              style: R.textStyle.boldPoppins().copyWith(
                                  fontSize: 46.sp, color: Colors.black),
                            ),
                            h1,
                            Text(
                              "Sign in with your data that you entered during your registration.",
                              style: R.textStyle.regularPoppins().copyWith(
                                  fontSize: 13.sp, color: Colors.grey),
                            ),
                            h2,
                            const Heading(
                              title: 'Email',
                            ),
                            TextFormField(
                              decoration: R.decorations.appFieldDecoration(
                                  null, "Email", 'Johngreen@gmail.com'),
                              controller: signInEmailTC,
                              validator: (value) =>
                                  FieldValidator.validateEmail(
                                      signInEmailTC.text),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: R.textStyle.mediumPoppins(),
                            ),
                            h2,
                            const Heading(
                              title: 'Password',
                            ),
                            TextFormField(
                              decoration: R.decorations.appFieldDecoration(
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          visibility = !visibility;
                                        });
                                      },
                                      child: Icon(visibility
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  "Password",
                                  'min 8 characters'),
                              obscureText: visibility,
                              controller: signInPassTC,
                              validator: (value) =>
                                  FieldValidator.validatePassword(
                                      signInPassTC.text),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              style: R.textStyle.mediumPoppins(),
                            ),
                            h2,
                            MyButton(
                              onTap: () {
                                if (signInFormKey.currentState!.validate()) {
                                  controller.signInNow(
                                      signInEmailTC.text.trim(),
                                      signInPassTC.text.trim());
                                }
                              },
                              buttonText: "Login",
                            ),
                            h2,
                            InkWell(
                              onTap: () {
                                _controller.jumpToPage(1);
                                if (kDebugMode) {
                                  print(currentPage);
                                }
                              },
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Don’t have an account? ",
                                    style: R.textStyle
                                        .regularPoppins()
                                        .copyWith(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "Sign up",
                                    style: R.textStyle
                                        .semiBoldPoppins()
                                        .copyWith(color: R.colors.theme),
                                  )
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: ListView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      h2,
                      Padding(
                        padding: EdgeInsets.only(
                          left: 5.w,
                          right: 5.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sign up",
                              style: R.textStyle
                                  .semiBoldPoppins()
                                  .copyWith(fontSize: 46.sp),
                            ),
                            InkWell(
                              onTap: () {
                                _controller.jumpToPage(0);
                                print(currentPage);
                              },
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "Already have an account? ",
                                    style: R.textStyle
                                        .regularPoppins()
                                        .copyWith(color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: "Sign in",
                                    style: R.textStyle
                                        .semiBoldPoppins()
                                        .copyWith(color: R.colors.theme),
                                  )
                                ]),
                              ),
                            ),
                            const Heading(
                              title: 'Full name',
                            ),
                            TextFormField(
                              decoration: R.decorations.appFieldDecoration(
                                  null, "Full name", 'John green'),
                              controller: nameTC,
                              validator: (value) =>
                                  FieldValidator.validateName(nameTC.text),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                              style: R.textStyle.mediumPoppins(),
                            ),
                            const Heading(
                              title: 'Email',
                            ),
                            TextFormField(
                              decoration: R.decorations.appFieldDecoration(
                                  null, "Email", 'Johngreen@gmail.com'),
                              controller: emailTC,
                              validator: (value) =>
                                  FieldValidator.validateEmail(emailTC.text),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              style: R.textStyle.mediumPoppins(),
                            ),
                            const Heading(
                              title: 'Phone Number',
                            ),
                            TextFormField(
                              decoration: R.decorations.appFieldDecoration(
                                  null, "Full name", '(966) 555-0113'),
                              controller: numberTC,
                              validator: (value) =>
                                  FieldValidator.validatePhoneNumber(
                                      numberTC.text),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              style: R.textStyle.mediumPoppins(),
                            ),
                            const Heading(
                              title: 'Gender',
                            ),
                            DropdownButtonFormField<String>(
                                icon: const Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child:
                                      Icon(Icons.keyboard_arrow_down_rounded),
                                ),
                                value: selectedGender.isEmpty
                                    ? null
                                    : selectedGender,
                                validator: (value) =>
                                    FieldValidator.validateGender(
                                        selectedGender),
                                decoration: R.decorations.appFieldDecoration(
                                    null, "Gender", 'Select Gender'),
                                selectedItemBuilder: (context) {
                                  return genderList.map((g) {
                                    return DropdownMenuItem(
                                      value: g,
                                      child: Text(g,
                                          style: R.textStyle
                                              .regularPoppins()
                                              .copyWith(
                                                  color: R.colors.blackColor,
                                                  fontSize: 11.5.sp)),
                                    );
                                  }).toList();
                                },
                                items: genderList.map((gender) {
                                  return DropdownMenuItem(
                                    value: gender,
                                    child: Text(gender,
                                        style: R.textStyle
                                            .regularPoppins()
                                            .copyWith(
                                                color: Colors.blueGrey,
                                                fontSize: 11.5.sp)),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  selectedGender = newValue!;
                                }),
                            const Heading(
                              title: 'Date Of Birth',
                            ),
                            TextFormField(
                              textInputAction: TextInputAction.next,
                              readOnly: true,
                              onTap: () {
                                setState(() {
                                  DateTimePickerServices
                                      .selectBirthDayDateFunction(
                                          DateTimePickerServices
                                              .selectedBirthDate,
                                          DateTime(1959),
                                          DateTime(2050),
                                          context,
                                          dobCon);
                                });
                              },
                              onFieldSubmitted: (value) {
                                setState(() {});
                              },
                              cursorColor: R.colors.darkBlue,
                              validator: (value) =>
                                  FieldValidator.validateDateOfBirth(value!),
                              controller: dobCon,
                              style: R.textStyle.regularPoppins().copyWith(
                                  color: R.colors.blackColor,
                                  fontSize: 11.5.sp),
                              decoration: R.decorations.appFieldDecoration(
                                  null, "Date Of Birth", 'Date of Birth'),
                            ),
                            const Heading(
                              title: 'Password',
                            ),
                            TextFormField(
                              obscureText: visibility,
                              decoration: R.decorations.appFieldDecoration(
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          visibility = !visibility;
                                        });
                                      },
                                      child: Icon(visibility
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  "Password",
                                  'min 8 characters'),
                              controller: passwordTC,
                              validator: (value) =>
                                  FieldValidator.validatePassword(
                                      passwordTC.text),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              style: R.textStyle.mediumPoppins(),
                            ),
                            const Heading(
                              title: 'Confirm Password',
                            ),
                            TextFormField(
                              obscureText: visibility2,
                              decoration: R.decorations.appFieldDecoration(
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          visibility2 = !visibility2;
                                        });
                                      },
                                      child: Icon(visibility2
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
                                  "Confirm Password",
                                  ''),
                              controller: confirmPassTC,
                              validator: (value) =>
                                  FieldValidator.validatePasswordMatch(
                                      passwordTC.text, confirmPassTC.text),
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              style: R.textStyle.mediumPoppins(),
                            ),
                            h2,
                            MyButton(
                              onTap: () async {
                                if (formKey.currentState!.validate()) {
                                  if (kDebugMode) {
                                    print(currentPage);
                                  }
                                  UserData userData = UserData(
                                    fcmId: AppUtils.myFcmToken,
                                    image: selectedGender == 'Female'
                                        ? R.images.imageUrl
                                        : R.images.imageUrl2,
                                    fullName: nameTC.text,
                                    gender: selectedGender,
                                    createdAt: Timestamp.now(),
                                    phoneNo: numberTC.text,
                                    dob: Timestamp.fromDate(
                                        DateTimePickerServices
                                            .selectedBirthDate),
                                    email: emailTC.text.trim(),
                                    role: selectedRole,
                                    status: UserStatus.active.index,
                                  );
                                  await controller.registerUser(
                                      userData, passwordTC.text);
                                }
                              },
                              buttonText: "Create account",
                            ),
                            h2,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
