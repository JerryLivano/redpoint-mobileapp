import 'package:project_redpoint/domain/entities/user.dart';
import 'package:project_redpoint/domain/usecase/change_password.dart';
import 'package:project_redpoint/domain/usecase/change_password_param.dart';
import 'package:project_redpoint/domain/usecase/login.dart';
import 'package:project_redpoint/domain/usecase/login_param.dart';
import 'package:project_redpoint/domain/usecase/sign_up.dart';
import 'package:project_redpoint/domain/usecase/sign_up_param.dart';
import 'package:project_redpoint/domain/usecase/update_user.dart';
import 'package:project_redpoint/domain/usecase/update_user_param.dart';
import 'package:project_redpoint/presentation/providers/changepassword_provider.dart';
import 'package:project_redpoint/presentation/providers/login_provider.dart';
import 'package:project_redpoint/presentation/providers/signup_provider.dart';
import 'package:project_redpoint/presentation/providers/updateuser_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async => null;

  Future<User?> login(String email, String password) async {
    state = const AsyncLoading();
    Login login = ref.read(loginProvider);
    var user = await login(LoginParam(email: email, password: password));
    state = AsyncData(user);
    return user;
  }

  Future<void> signUp(String name, String email, String password) async {
    state = const AsyncLoading();
    SignUp signUp = ref.read(signUpProvider);
    await signUp(SignUpParam(name: name, email: email, password: password));
    state = const AsyncData(null);
  }

  Future<void> changePassword(String password, int userId) async {
    state = const AsyncLoading();
    ChangePassword changePassword = ref.read(changePasswordProvider);
    var user = await changePassword(
        ChangePasswordParam(password: password, userId: userId));
    state = AsyncData(user);
  }

  Future<void> updateUser(String name, String phone, String address,
      String blood_type, int userId) async {
    state = const AsyncLoading();
    UpdateUser updateUser = ref.read(updateUserProvider);
    var user = await updateUser(UpdateUserParam(
        name: name,
        phone: phone,
        address: address,
        blood_type: blood_type,
        userId: userId));
    state = AsyncData(user);
  }

  Future<void> logout() async {
    state = const AsyncData(null);
  }
}
