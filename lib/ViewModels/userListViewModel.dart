import 'package:flutter/material.dart';
import 'package:new_app_sample/ViewModels/userViewModel.dart';
import 'package:new_app_sample/models/User.dart';
import 'package:new_app_sample/services/web_service.dart';

enum LoadingStatus { completed, searching, empty }

class UserListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;

  List<UserViewModel> users = [];

  void fetchUsers() async {
    List<User> users = await WebService().getUsers();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    print(users.length);

    this.users = users.map((item) => UserViewModel(user: item)).toList();

    if (this.users.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
