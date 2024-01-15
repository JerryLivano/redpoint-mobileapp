class User {
  final int id;
  final String name;
  final String email;
  final String password;
  final String? phone;
  final String? address;
  // ignore: non_constant_identifier_names
  final String? blood_type;
  final int point;
  final double donated;
  final String role;

  // ignore: non_constant_identifier_names
  User({required this.id, required this.name, required this.email, required this.password, this.phone, this.address, this.blood_type, required this.point, required this.donated, required this.role});
}
