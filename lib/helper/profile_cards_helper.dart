enum ProfileCardType {
  name,
  phone,
  email,
  home,
}

class ProfileCardTypeHelper {
  static String getValue(ProfileCardType type){
    switch(type){
      case ProfileCardType.name:
        return "name";
      case ProfileCardType.phone:
        return "phone";
      case ProfileCardType.email:
        return "email";
      case ProfileCardType.home:
        return "home";
      default:
        return "";
    }
  }
}