import 'package:project_redpoint/data/repositories/user_repository.dart';
import 'package:project_redpoint/domain/entities/supabase.dart';
import 'package:project_redpoint/domain/entities/user.dart';
import 'package:supabase/supabase.dart' as data;

class SupabaseUserRepository implements UserRepository {
  final supabase = data.SupabaseClient(
      'https://sxmjkgztaxwjayznvmol.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InN4bWprZ3p0YXh3amF5em52bW9sIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA1MzUwODMsImV4cCI6MjAxNjExMTA4M30.30SOljq8yS2dWZEp4yBJe6tRFwsFFYFd-QMJZgi00BM');

  @override
  Future<User?> getUser(String email, String password) async {
    final response = await Supabase()
        .getSupabase()
        .from('user')
        .select('*')
        .eq('email', email);

    if (response.isNotEmpty) {
      final userPassword = response[0]['password'] as String;

      if (userPassword == password) {
        return User(
          id: response[0]['id'] as int,
          name: response[0]['name'] as String,
          email: response[0]['email'] as String,
          password: response[0]['password'] as String,
          phone: response[0]['phone'],
          address: response[0]['address'],
          blood_type: response[0]['blood_type'],
          point: response[0]['point'] as int,
          donated: response[0]['donated'].toDouble(),
          role: response[0]['role'] as String,
        );
      }
      return null;
    }
    return null;
  }

  @override
  Future<void> signUpUser(String name, String email, String password) async {
    await Supabase()
        .getSupabase()
        .from('user')
        .insert({'name': name, 'email': email, 'password': password});

    return;
  }

  @override
  Future<User?> updatePassword(String password, int userId) async {
    await Supabase()
        .getSupabase()
        .from('user')
        .update({'password': password}).eq('id', userId);

    final response = await Supabase()
        .getSupabase()
        .from('user')
        .select('*')
        .eq('id', userId);

    if (response.isNotEmpty) {
      return User(
        id: response[0]['id'] as int,
        name: response[0]['name'].toString(),
        email: response[0]['email'].toString(),
        password: response[0]['password'].toString(),
        phone: response[0]['phone'],
        address: response[0]['address'],
        blood_type: response[0]['blood_type'],
        point: response[0]['point'] as int,
        donated: response[0]['donated'].toDouble(),
        role: response[0]['role'].toString(),
      );
    }

    return null;
  }

  @override
  Future<User?> updateUser(String name, String phone, String address,
      String blood_type, int userId) async {
    await Supabase().getSupabase().from('user').update({
      'name': name,
      'phone': phone,
      'address': address,
      'blood_type': blood_type
    }).eq('id', userId);

    final response = await Supabase()
        .getSupabase()
        .from('user')
        .select('*')
        .eq('id', userId);

    if (response.isNotEmpty) {
      return User(
        id: response[0]['id'] as int,
        name: response[0]['name'].toString(),
        email: response[0]['email'].toString(),
        password: response[0]['password'].toString(),
        phone: response[0]['phone'],
        address: response[0]['address'],
        blood_type: response[0]['blood_type'],
        point: response[0]['point'] as int,
        donated: response[0]['donated'].toDouble(),
        role: response[0]['role'].toString(),
      );
    }

    return null;
  }
}
