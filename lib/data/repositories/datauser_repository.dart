import 'package:project_redpoint/domain/entities/data_user.dart';

abstract interface class DataUserRepository {
  Future<List<DataUser>> getDataUser();
}