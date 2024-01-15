import 'package:project_redpoint/domain/usecase/sign_up.dart';
import 'package:project_redpoint/presentation/providers/user_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_provider.g.dart';

@riverpod
SignUp signUp(SignUpRef ref) =>
    SignUp(userRepository: ref.read(userRepositoryProvider));