import 'package:project_redpoint/domain/usecase/get_data_user.dart';
import 'package:project_redpoint/presentation/providers/datauser_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_datauser_provider.g.dart';

@riverpod
GetDataUser getDataUser(GetDataUserRef ref) =>
    GetDataUser(dataUserRepository: ref.read(dataUserRepositoryProvider));
