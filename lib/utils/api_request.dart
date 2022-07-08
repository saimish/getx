import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pikipedia/utils/show_message.dart';
import 'package:sizer/sizer.dart';

import '../widgets/app_dialog.dart';
import 'api_urls.dart';

class ApiRequests {
  Future fetchResults(
    String id,
  ) async {
    try {
      var response = await http.get(
        Uri.parse(Apis.apiUrl + 'api/Alert/Register' + '?id=$id'),
      );
      if (kDebugMode) {
        print('response:${response.statusCode}\n');
      }
      if (kDebugMode) {
        print((response.body));
      }
      var jsonResponse = json.decode(response.body);
      switch (response.statusCode) {
        case 200:
          return jsonResponse;
        case 400:
          return Get.dialog(SizedBox(
            height: 50.h,
            width: 90.w,
            child: AppDialog(
              onConfirm: () {
                Get.back();
              },
              title: "Error",
              text:
                  "An error occurred, please try again or contact your system administrator.",
              color: Colors.red,
            ),
          ));
        case 401:
          Get.dialog(SizedBox(
            height: 50.h,
            width: 90.w,
            child: AppDialog(
              onConfirm: () {},
              title: "Error",
              text:
                  "An error occurred, please try again or contact your system administrator.",
              color: Colors.red,
            ),
          ));
          return false;
        //
        case 503:
          Get.dialog(SizedBox(
            height: 50.h,
            width: 90.w,
            child: AppDialog(
              onConfirm: () {
                Get.back();
              },
              title: "Error",
              text:
                  "An error occurred, please try again or contact your system administrator.",
              color: Colors.red,
            ),
          ));
          return false;
        default:
          Get.dialog(SizedBox(
            height: 50.h,
            width: 90.w,
            child: AppDialog(
              onConfirm: () {
                // preferences.removeUser();
                // preferences.removeCheckIn();
                // Get.offAllNamed(AuthView.route);
              },
              title: "Error",
              text:
                  "An error occurred, please try again or contact your system administrator.",
              color: Colors.red,
            ),
          ));
          return false;
      }
    } on SocketException {
      Get.dialog(SizedBox(
        height: 50.h,
        width: 90.w,
        child: AppDialog(
          onConfirm: () {
            Get.back();
          },
          title: "No Internet",
          text: "Please connect to the internet to continue.",
          color: Colors.red,
        ),
      ));
      return false;
    } on HttpException catch (error) {
      if (kDebugMode) {
        print(error);
      }
      Get.dialog(SizedBox(
        height: 50.h,
        width: 90.w,
        child: AppDialog(
          onConfirm: () {
            Get.back();
          },
          title: "Error",
          text: "Could not find the result",
          color: Colors.red,
        ),
      ));
      return false;
    } on FormatException catch (error) {
      if (kDebugMode) {
        print("error:$error");
      }
      Get.dialog(SizedBox(
        height: 50.h,
        width: 90.w,
        child: AppDialog(
          onConfirm: () {
            Get.back();
          },
          title: "Format Exception",
          text: "Bad Response Format",
          color: Colors.red,
        ),
      ));
      return false;
    } catch (value) {
      if (kDebugMode) {
        print(value);
      }
    }
    return false;
  }

  Future updateProfileImage({String? image}) async {
    try {
      Uri uri = Uri.parse(
        'https://osm9m59fy3.execute-api.us-east-1.amazonaws.com/dev',

        // Apis.apiUrl,
      );
      http.MultipartRequest request = http.MultipartRequest(
        "POST",
        uri,
      );
      // request.headers.addAll(
      //   MyHeaders.header(),
      // );

      request.files.add(await http.MultipartFile.fromPath("", image!));
      print('body ==========>\n ${request.fields}');
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      final responseBody = await response.stream.bytesToString();
      Map jsonResponse = jsonDecode(responseBody);
      print("response:=====> $jsonResponse");

      if (response.statusCode == 200) {
        if (jsonResponse['Code'] == 200) {
          return jsonResponse;
        } else {
          ShowMessage.ofJsonInDialog(jsonResponse, true);
          return false;
        }
      } else {
        ShowMessage.inDialog('status code: ${response.statusCode} ', true);
        return false;
      }
    } on SocketException {
      ShowMessage.inDialog('No Internet Connection', true);

      print('No Internet connection');
      return false;
    } on HttpException catch (error) {
      print(error);
      ShowMessage.inDialog('Couldn\'t find the results', true);
      print("Couldn't find the post");
      return false;
    } on FormatException catch (error) {
      print(error);
      ShowMessage.inDialog('Bad response format from server', true);
      print("Bad response format");
      return false;
    } catch (value) {
      print(value);
    }
    return false;
  }
  Future updateImage({String? image}) async {
    try {
      Uri uri = Uri.parse(
        'https://osm9m59fy3.execute-api.us-east-1.amazonaws.com/dev/',
      );
      print(uri);

      http.MultipartRequest request = http.MultipartRequest(
        "POST",
        uri,
      );
      // request.headers.addAll(
      //   MyHeaders.header(),
      // );

      request.files.add(await http.MultipartFile.fromPath("", image!));

      print('body ==========>\n ${request.fields}');
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      final responseBody = await response.stream.bytesToString();
      Map jsonResponse = jsonDecode(responseBody);
      print("response:=====> $jsonResponse");

      if (response.statusCode == 200) {
        if (jsonResponse['Code'] == 200) {
          return jsonResponse;
        } else {
          ShowMessage.ofJsonInDialog(jsonResponse, true);
          return false;
        }
      } else {
        ShowMessage.inDialog('status code: ${response.statusCode} ', true);
        return false;
      }
    } on SocketException {
      ShowMessage.inDialog('No Internet Connection', true);

      print('No Internet connection');
      return false;
    } on HttpException catch (error) {
      print(error);
      ShowMessage.inDialog('Couldn\'t find the results', true);
      print("Couldn't find the post");
      return false;
    } on FormatException catch (error) {
      print(error);
      ShowMessage.inDialog('Bad response format from server', true);
      print("Bad response format");
      return false;
    } catch (value) {
      print(value);
    }
    return false;
  }




  addImage(String filepath) async {

    var file = await http.MultipartFile.fromPath('', filepath);
    Uri uri = Uri.parse(
      'https://osm9m59fy3.execute-api.us-east-1.amazonaws.com/dev/',
    );
    print(uri);
    http.MultipartRequest request = http.MultipartRequest(
      "POST",
      uri,
    );
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Content-type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer $token'
    };
    request.files.add(file);

  /*  var request = http.MultipartRequest('POST', addimageUrl)
      ..fields.addAll(body)
      ..headers.addAll(headers)
      ..files.add(file);*/
    var streamedResponse = await request.send();

    print(streamedResponse.toString());
    // var response = await http.Response.fromStream(streamedResponse);
    final responseBody = await streamedResponse.stream.bytesToString();
    Map jsonResponse = jsonDecode(responseBody);
    print(streamedResponse.stream.length);

    // Map jsonResponse = jsonDecode(response.body);
    print("response:=====> $jsonResponse");
  }

}
