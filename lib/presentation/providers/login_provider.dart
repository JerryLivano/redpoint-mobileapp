import 'package:project_redpoint/domain/usecase/login.dart';
import 'package:project_redpoint/presentation/providers/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
Login login(LoginRef ref) =>
    Login(userRepository: ref.read(userRepositoryProvider));
