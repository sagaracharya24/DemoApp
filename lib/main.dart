import 'package:flutter/material.dart';
import 'package:new_app_sample/ViewModels/userListViewModel.dart';
import 'package:new_app_sample/screens/user_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter New App",
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xfffefdfd),
          appBarTheme: AppBarTheme(
              color: Color(0xfffefdfd),
              elevation: 0,
              textTheme: TextTheme(headline6: TextStyle(color: Colors.black))),
          iconTheme: IconThemeData(color: Colors.black)),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserListViewModel(),
          ),
        ],
        child: UserScreen(),
      ),
    );
  }
}
