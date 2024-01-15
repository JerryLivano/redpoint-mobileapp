import 'package:project_redpoint/domain/usecase/update_user.dart';
import 'package:project_redpoint/presentation/providers/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'updateuser_provider.g.dart';

@riverpod
UpdateUser updateUser(UpdateUserRef ref) =>
    UpdateUser(userRepository: ref.read(userRepositoryProvider));
