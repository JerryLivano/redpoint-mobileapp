import 'package:project_redpoint/data/repositories/user_repository.dart';
import 'package:project_redpoint/domain/entities/user.dart';
import 'package:project_redpoint/domain/usecase/update_user_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class UpdateUser implements Usecase<User?, UpdateUserParam> {
  final UserRepository userRepository;

  UpdateUser({required this.userRepository});

  @override
  Future<User?> call(UpdateUserParam params) async {
    final user = await userRepository.updateUser(params.name, params.phone, params.address, params.blood_type, params.userId);

    return user;
  }
}
