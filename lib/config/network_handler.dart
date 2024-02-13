// ignore_for_file: unused_element, avoid_print
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:assetsmanagement/constants/app_string.dart';
import 'package:assetsmanagement/constants/local_storage.dart';
import 'package:assetsmanagement/utils/storage/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:assetsmanagement/config/api_end_point.dart';
import 'package:assetsmanagement/constants/custom_snackbar.dart';
import 'package:http/http.dart' as http;

class HttpHandler {
  static String endPointUrl = APIEndPoints.baseUrl;
  static String? token;

  // Retrieve the headers for the HTTP request
  static Future<Map<String, String>> getHeaders() async {
    token = await getDataFromLocalStorage(
        dataType: StorageKey.stringType,
        prefKey: StorageKey.token) ??
        "";
    if (token != "null" && token != "") {
      print("Token -- '$token'");
      return {
        // 'Content-type': 'application/json',
        // 'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    } else {
      return {'Accept': 'application/json'};
    }
  }

  // Perform an HTTP GET request
  static Future<Map<String, dynamic>> getHttpMethod(
      {required String? url}) async {
    var header = await getHeaders();
    print("Get URL -- '$endPointUrl$url'");
    print("Get Data -- 'null'");
    print("Get Header -- '$header'");
    http.Response response = await http.get(
      Uri.parse("$endPointUrl$url"),
      headers: header,
    );
    print("Get Response Code -- '${response.statusCode}'");
    print("Get Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("In Get '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else {
      print("In Get 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  // Perform an HTTP POST request
  static Future<Map<String, dynamic>> postHttpMethod({
    @required String? url,
    Map<String, dynamic>? data,
  }) async {
    var header = await getHeaders();
    print("Post URL -- '$endPointUrl$url'");
    print("Post Data -- '$data'");
    print("Post Header -- '$header'");
    http.Response response = await http.post(
      Uri.parse("$endPointUrl$url"),
      headers: header,
      body: data ?? {},
    );
    print("Post Response Code -- '${response.statusCode.toString()}'");
    print("Post Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
    } else if (response.statusCode == 402) {
      foodLocatorSnackBar(message: "Session expired. Please Login again.");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
    } else {
      print("In Post 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  // Perform an HTTP PATCH request
  static Future<Map<String, dynamic>> patchHttpMethod(
      {@required String? url, Map<String, dynamic>? data}) async {
    var header = await getHeaders();
    print("Patch URL -- '$endPointUrl$url'");
    print("Patch Data -- '$data'");
    print("Patch Header -- '$header'");
    http.Response response = await http.patch(
      Uri.parse("$endPointUrl$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    print("Patch Response Code -- '${response.statusCode}'");
    print("Patch Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("In Patch '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else {
      print("In Patch 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  // Perform an HTTP PUT request
  static Future<Map<String, dynamic>> putHttpMethod(
      {@required String? url, Map<String, dynamic>? data}) async {
    var header = await getHeaders();
    print("Put URL -- '$endPointUrl$url'");
    print("Put Data -- '$data'");
    print("Put Header -- '$header'");
    http.Response response = await http.put(
      Uri.parse("$endPointUrl$url"),
      headers: header,
      body: data == null ? null : jsonEncode(data),
    );
    print("PUT Response code -- '${response.statusCode}'");
    print("PUT Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("In Put '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else {
      print("In Put 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

  // Perform an HTTP DELETE request
  static Future<Map<String, dynamic>> deleteHttpMethod(
      {@required String? url}) async {
    var header = await getHeaders();
    print("Delete URL -- '$endPointUrl$url'");
    print("Delete Data -- 'null'");
    print("Delete Header -- '$header'");
    http.Response response = await http.delete(
      Uri.parse("$endPointUrl$url"),
      headers: header,
    );
    print("Delete Response Code -- '${response.statusCode}'");
    print("Delete Response -- '${response.body}'");
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("In Delete '${response.statusCode}'");
      Map<String, dynamic> data = {
        'body': response.body,
        'headers': response.headers,
        'error': null,
      };
      return data;
    } else {
      print("In Delete 'else - ${response.statusCode}'");
      return {
        'body': response.body,
        'headers': response.headers,
        'error': "${response.statusCode}",
      };
    }
  }

//Method Type = POST, GET
  static Future<Map<String, dynamic>> formHttpMethod(
      {@required String? methodType,
        @required String? url,
        Map<String, String>? data,
        File? singleFile,
        // File? singleFile2,
        String? singleFileKey,
        // String? singleFileKey2,
        List<File>? multipleFile,
        List<String>? multipleFileKeysList,
        String? multipleFileKey
      }) async {
    var header = await getHeaders();
    printData("Form URL -- '$endPointUrl$url'");
    printData("Form Header -- '$header'");
    http.MultipartRequest request = http.MultipartRequest(methodType!, Uri.parse("$endPointUrl$url"));
    request.headers.addAll(header);
    if (data != null) {
      request.fields.addAll(data);
    }
    if (singleFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
        singleFileKey!,
        singleFile.path,
      ));
    }

    if(multipleFileKey!=null){
      if(multipleFileKeysList!=null){
        if(multipleFileKeysList.isNotEmpty){
          for (var i =0; i <multipleFile!.length; i++) {
            request.files.add(await http.MultipartFile.fromPath(multipleFileKeysList[i], multipleFile[i].path));
          }
        }
      }else{
        if (multipleFile!.isNotEmpty) {
          for (File element in multipleFile) {
            request.files.add(await http.MultipartFile.fromPath(
              multipleFileKey,
              element.path,
            ));
          }
        }
      }
    }

    printData("FORM FIELDS - ${request.fields}");
    printData("FORM FILES - ${request.files.first.filename}");
    http.StreamedResponse streamedResponse = await request.send();
    if (streamedResponse.statusCode == 200 || streamedResponse.statusCode == 201) {
      http.Response response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 || response.statusCode == 201) {
        printData("In Post '${response.statusCode}'");
        printData("FORM RESPONSE -- '${response.body}'");
        // int status = json.decode(response.body)["status"];
        Map<String, dynamic> data;
        data = {
          'body': response.body,
          'headers': response.headers,
          'error': null,
        };
        return data;
      } else {
        printData("In Form 'else 3 - ${response.statusCode}'");
        return {
          'body': response.body,
          'headers': response.headers,
          'error': "${response.statusCode}",
        };
      }
    } else {
      http.Response response1 = await http.Response.fromStream(streamedResponse);
      printData("In Form 'else 1---- ${streamedResponse.statusCode}'");
      return {
        'body': response1.body,
        'headers': response1.headers,
        'error': "${response1.statusCode}",
      };
    }
  }

}
