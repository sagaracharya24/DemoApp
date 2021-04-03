import 'package:url_launcher/url_launcher.dart';


// this was an api issue for the where . was in the userphoto string in the api
String eleminateDot(String urlString) {
    if (urlString.contains(".//")) {
      return urlString.replaceFirst(RegExp('.//'), '//');
    } else if (urlString.contains("./")) {
      return urlString.replaceFirst(RegExp('./'), '//');
    } else {
      return urlString;
    }
  }


  launchCaller(String number) async {
    var url = "tel:$number";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  messageCaller(String number) async {
    // Android
    var uri = 'sms:$number?body=hello%20there';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      // iOS
      var uri = 'sms:$number?body=hello%20there';
      if (await canLaunch(uri)) {
        await launch(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }

  mailCaller(String email) async {
    // Android and iOS
    var uri = 'mailto:$email';
    if (await canLaunch(uri)) {
      await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }