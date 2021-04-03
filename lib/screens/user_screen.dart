import 'package:flutter/material.dart';
import 'package:new_app_sample/ViewModels/userListViewModel.dart';
import 'package:new_app_sample/widgets/user_grid.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<UserListViewModel>(context, listen: false).fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<UserListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "President",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.height * 0.03,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: UserGrid(
                users: listViewModel.users,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
