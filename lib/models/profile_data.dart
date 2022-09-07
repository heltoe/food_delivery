class ProfileData {
  int id;
  String name;
  String email;
  String phone;
  int orderCount;

  ProfileData({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.orderCount,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
        id: json["id"],
        name: json["f_name"],
        email: json["email"],
        phone: json["phone"],
        orderCount: json["order_count"],
    );
  }

  factory ProfileData.fromLocalJson(Map<String, dynamic> json) {
    return ProfileData(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      orderCount: json["orderCount"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["phone"] = phone;
    data["orderCount"] = orderCount;
    return data;
  }

  factory ProfileData.clearData() {
    return ProfileData(
      id: -1,
      orderCount: -1,
      email: "",
      name: "",
      phone: "",
    );
  }
}