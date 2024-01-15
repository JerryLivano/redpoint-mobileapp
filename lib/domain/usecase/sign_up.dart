import 'package:project_redpoint/data/repositories/user_repository.dart';
import 'package:project_redpoint/domain/entities/user.dart';
import 'package:project_redpoint/domain/usecase/sign_up_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class SignUp implements Usecase<User?, SignUpParam> {
  final UserRepository userRepository;

  SignUp({required this.userRepository});

  @override
  Future<User?> call(SignUpParam params) async {
    final user = await userRepository.getUser(params.email, params.password);

    if (user == null) {
      await userRepository.signUpUser(
          params.name, params.email, params.password);
    }

    return user;
  }
}
