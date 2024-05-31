class SignUpModel {
  final int otp;
  final String otpToken;
  final String name;
  final String email;
  final String password;
  final String companyName;
  final String designation;

  SignUpModel({
    required this.otp,
    required this.otpToken,
    required this.name,
    required this.email,
    required this.password,
    required this.companyName,
    required this.designation,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        otp: json["otp"],
        otpToken: json["otpToken"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        companyName: json["companyName"],
        designation: json["designation"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
        "otpToken": otpToken,
        "name": name,
        "email": email,
        "password": password,
        "companyName": companyName,
        "designation": designation,
      };
}
