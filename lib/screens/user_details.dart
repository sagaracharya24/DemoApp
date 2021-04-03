import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app_sample/ViewModels/userViewModel.dart';
import 'package:new_app_sample/utils/utils.dart';
import 'package:new_app_sample/widgets/circle_image.dart';
import 'dart:io' show Platform;

class UserDetails extends StatefulWidget {
  final UserViewModel user;
  UserDetails({this.user});
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Image.asset("Assets/background.jpg"),
                    Center(
                      child: widget.user.userPhoto == null
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.25,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 20),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child:
                                      Image.asset("Assets/default_user.png")),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width * 0.45,
                              height: MediaQuery.of(context).size.height * 0.25,
                              child: CircleImage(
                                imageUrl: eleminateDot(widget.user.userPhoto),
                                radius:
                                    MediaQuery.of(context).size.height * 0.50,
                                isBorderAvailable: true,
                              ),
                            ),
                    ),
                    Positioned(
                        child: IconButton(
                            icon: Platform.isAndroid
                                ? Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            })),
                    Positioned(
                      right: 10,
                      top: 20,
                      child: GestureDetector(
                        onTap: () {
                          // saving contacts
                        },
                        child: Text(
                          "ADD CONTACT",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 5,
                        right: 2,
                        left: 5,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.user?.addr ?? "No Address",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      "Blood Group : ${widget.user.bloodGroup}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "B : ${widget.user.birthDate}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "W : ${widget.user.weedingDate}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.greenAccent,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.user.firstName} ${widget.user.lastName}",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            widget.user.position,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15, bottom: 15),
                      child: IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.plusCircle,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Spouse  :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Birth Date  :",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container()
                    ]),
              ),
            ),
            SizedBox(
              height: 3,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.user?.addr ?? "No Address",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container())
          ],
        ),
      ),
    );
  }
}
