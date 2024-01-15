import 'package:project_redpoint/domain/entities/user.dart';

abstract interface class UserRepository {
  Future<User?> getUser(String email, String password);
  Future<void> signUpUser(String name, String email, String password);
  Future<User?> updatePassword(String password, int userId);
  Future<User?> updateUser(String name, String phone, String address, String blood_type, int userId); 
}