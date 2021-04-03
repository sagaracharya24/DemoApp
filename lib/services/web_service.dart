import 'package:http/http.dart' as http;
import 'package:new_app_sample/models/User.dart';
import 'dart:convert';

import 'package:new_app_sample/utils/constants.dart';

class WebService {
  Future<List<User>> getUsers() async {
    final uri =
        "${ApiBase.baseUrl}member-login/android/iOSClubOfficer.php";
    var map = new Map<String, dynamic>();
    map['positionName'] = 'President';

    http.Response response = await http.post(
      Uri.parse(uri),
      body: map,
    );


    if (response.statusCode == 200) {
      print(response.body);

      var items = json.decode(response.body);

      return items.map<User>((item) => User.fromJSON(item)).toList();
    } else {
      throw Exception("Failed to get data");
    }
  }
}


