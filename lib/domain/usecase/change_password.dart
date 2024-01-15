import 'package:project_redpoint/data/repositories/user_repository.dart';
import 'package:project_redpoint/domain/entities/user.dart';
import 'package:project_redpoint/domain/usecase/change_password_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class ChangePassword implements Usecase<User?, ChangePasswordParam> {
  final UserRepository userRepository;

  ChangePassword({required this.userRepository});

  @override
  Future<User?> call(ChangePasswordParam params) async {
    final user = await userRepository.updatePassword(params.password, params.userId);

    return user;
  }
}
