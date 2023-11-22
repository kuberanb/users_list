import 'dart:async';
import 'dart:io';

import 'package:brain_wired/core/api_endpoints.dart';
import 'package:brain_wired/models/user_model.dart';
import 'package:brain_wired/views/Error/error_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../views/Common Widgets/snackbar.dart';

class HomeService {
  static Future<List<UserModel?>>? getUsersList(
    context,
  ) async {
    final dio = Dio();
    List<UserModel?>? userModelList;
    try {
      Response response = await dio
          .get(
            '${ApiEndPoints.kBaseUrl}${ApiEndPoints.kUsers}',
            options: Options(headers: {
              'Content-Type': 'application/json',
            }),
          )
          .timeout(
            const Duration(seconds: 30),
          );
      print('api response : ${response.data.toString()}');
      if (response.statusCode == 200) {
        print('status code 200 triggered');
        final List<dynamic> data = response.data;

        userModelList = data.map((json) => UserModel.fromJson(json)).toList();

        print('academic year list length : ${userModelList.length}');

        return userModelList;
      }
    } on SocketException {
      showSnackBar(context, 'No Internet');
      print('No Internet');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ErrorScreen()));
    } on TimeoutException {
      showSnackBar(context, 'Connection Timeout, Refresh the page');
      print('Connection Timeout, Refresh the page');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ErrorScreen()));
    } catch (e) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ErrorScreen()));
      // showSnackBar(context, 'Some Error Occured');

      print('Some Exception Occured In Api : ${e}');
    }
    return userModelList ?? [];
  }
}
