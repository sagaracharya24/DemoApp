class User {
  final String clubName;
  final String position;
  final String firstName;
  final String lastName;
  final String mobile;
  final String email;
  final String userPhoto;
  final String bithDate;
  final String weddingDate;
  final String bloodGroup;
  final String addrr11;
  bool showDetails = false;

  User(
      {this.clubName,
      this.position,
      this.firstName,
      this.lastName,
      this.mobile,
      this.email,
      this.userPhoto,
      this.bithDate,
      this.weddingDate,
      this.bloodGroup,
      this.addrr11
      
      });

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        clubName: json["ClubName"],
        position: json["PositionName"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        mobile: json["Mobile"],
        email: json["Email"],
        userPhoto: json["User_Photo"],
        bithDate: json["BirthDate"],
        weddingDate: json["WeddingDate"],
        bloodGroup: json["BloodGroup"],
        addrr11: json["Addr11"]);
  }
}
