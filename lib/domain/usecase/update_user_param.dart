class UpdateUserParam {
  final String name;
  final String phone;
  final String address;
  final String blood_type;
  final int userId;

  UpdateUserParam(
      {required this.name,
      required this.phone,
      required this.address,
      required this.blood_type,
      required this.userId});
}
