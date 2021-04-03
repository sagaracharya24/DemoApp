import 'package:flutter/material.dart';
import 'package:new_app_sample/ViewModels/userViewModel.dart';
import 'package:new_app_sample/screens/user_details.dart';
import 'package:new_app_sample/utils/utils.dart';
import 'package:new_app_sample/widgets/circle_image.dart';

class UserGrid extends StatefulWidget {
  List<UserViewModel> users = [];

  UserGrid({this.users});

  @override
  _UserGridState createState() => _UserGridState();
}

class _UserGridState extends State<UserGrid> {
  void _showUserDetails(context, user) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetails(
            user: user,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.users.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        UserViewModel user = widget.users[index];
        return GestureDetector(
          onTap: () {
            _showUserDetails(context, user);
          },
          child: Container(
            margin: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width * 0.95,
            child: Card(
              elevation: 5,
              color: !user.showDetails ? Colors.white : Colors.orangeAccent,
              child: !user.showDetails
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            user.userPhoto == null
                                ? Container(
                                    width: 90,
                                    height: 90,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset("Assets/user.png")),
                                  )
                                : Container(
                                    width: 90,
                                    height: 90,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 20),
                                    child: CircleImage(
                                      imageUrl: eleminateDot(user.userPhoto),
                                      radius: 50,
                                      isBorderAvailable: false,
                                    ),
                                  ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              '${user.firstName} ${user.lastName}'),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(user.position),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(user.clubName),
                                        )
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            setState(() {
                                              user.detailsValue =
                                                  !user.showDetails;
                                            });
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Container(
                      width: 130,
                      height: 130,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    // this is when you tap on the contact
                                    launchCaller(user.mobile);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(Icons.call),
                                      Text(user.mobile)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(""),
                              ),
                              IconButton(
                                  icon: Icon(Icons.message),
                                  onPressed: () {
                                    messageCaller(user.mobile);
                                  }),
                              Container(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    setState(() {
                                      user.detailsValue = !user.showDetails;
                                    });
                                  })
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                mailCaller(user.email);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.mail),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(user.email)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
