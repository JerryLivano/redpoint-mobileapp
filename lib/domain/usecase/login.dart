import 'package:project_redpoint/data/repositories/user_repository.dart';
import 'package:project_redpoint/domain/entities/user.dart';
import 'package:project_redpoint/domain/usecase/login_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class Login implements Usecase<User?, LoginParam> {
  final UserRepository userRepository;

  Login({required this.userRepository});

  @override
  Future<User?> call(LoginParam params) async {
    final user = await userRepository.getUser(params.email, params.password);
    
    return user;
  }
}
