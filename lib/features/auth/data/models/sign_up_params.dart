class SignUpParams {
  final String email;
  final String firstName;
  final String lastName;
  final String city;
  final String mobile;
  final String password;

  SignUpParams({
    required this.password,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.mobile,
  });
  Map<String, dynamic>toJson(){
    return {
      "first_name": password,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": mobile,
      "city": city,
    };
  }

}
