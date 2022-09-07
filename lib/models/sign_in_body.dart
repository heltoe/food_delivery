class SignInBody {
  String email;
  String phone;
  String password;

  SignInBody({
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["phone"] = phone;
    data["password"] = password;
    return data;
  }
}
