import 'package:project_redpoint/domain/usecase/change_password.dart';
import 'package:project_redpoint/presentation/providers/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'changepassword_provider.g.dart';

@riverpod
ChangePassword changePassword(ChangePasswordRef ref) =>
    ChangePassword(userRepository: ref.read(userRepositoryProvider));
