import 'package:project_redpoint/data/repositories/datauser_repository.dart';
import 'package:project_redpoint/domain/entities/data_user.dart';
import 'package:project_redpoint/domain/usecase/no_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class GetDataUser implements Usecase<List<DataUser>?, NoParam> {
  final DataUserRepository dataUserRepository;

  GetDataUser({required this.dataUserRepository});

  @override
  Future<List<DataUser>?> call(NoParam param) async {
    final dataUser = await dataUserRepository.getDataUser();

    return dataUser;
  }
}
