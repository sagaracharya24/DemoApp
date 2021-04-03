import 'package:new_app_sample/models/User.dart';

class UserViewModel {
  User _user;
  UserViewModel({User user}) : _user = user;

  String get clubName {
    return _user.clubName;
  }

  String get firstName {
    return _user.firstName;
  }

  String get lastName {
    return _user.lastName;
  }

  String get mobile {
    return _user.mobile;
  }

  String get email {
    return _user.email;
  }

  String get userPhoto {
    return _user.userPhoto;
  }

  String get birthDate {
    return _user.bithDate;
  }

  String get weedingDate {
    return _user.weddingDate;
  }

  String get bloodGroup {
    return _user.bloodGroup;
  }

  String get addr {
    return _user.addrr11;
  }

  String get position {
    return _user.position;
  }

  bool get showDetails {
    return _user.showDetails;
  }

  set detailsValue(bool value) {
    _user.showDetails = value;
  }
}
