import 'package:project_redpoint/domain/entities/data_user.dart';
import 'package:project_redpoint/domain/usecase/get_data_user.dart';
import 'package:project_redpoint/domain/usecase/no_param.dart';
import 'package:project_redpoint/presentation/providers/get_datauser_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datauser_data_provider.g.dart';

@Riverpod(keepAlive: false)
class DataUserData extends _$DataUserData {
  @override
  Future<List<DataUser>?> build() async {
    return getDataUser();
  }

  Future<List<DataUser>?> getDataUser() async {
    GetDataUser getDataUser = ref.read(getDataUserProvider);
    final data = await getDataUser(NoParam());
    return data;
  }
}
