// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterUser {
  int? accountType = 0;
  String? name;
  String? email;
  String? password;
  DateTime? birthday;
  int? genderOrWork;
  RegisterUser({
    this.accountType,
    this.name,
    this.email,
    this.password,
    this.birthday,
    this.genderOrWork,
  });
}
