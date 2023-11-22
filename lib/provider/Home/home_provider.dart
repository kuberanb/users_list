import 'package:brain_wired/models/user_model.dart';
import 'package:brain_wired/services/home_service.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  List<UserModel?>? userModelList;

  Future<List<UserModel?>?> getUsersList(
    context,
  ) async {
    isLoading = true;
    notifyListeners();
    userModelList = await HomeService.getUsersList(context);
    isLoading = false;
    notifyListeners();

    return userModelList;
  }
}
