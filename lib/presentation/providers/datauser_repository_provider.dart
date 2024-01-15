import 'package:project_redpoint/data/repositories/datauser_repository.dart';
import 'package:project_redpoint/data/supabase/supabase_datauser_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'datauser_repository_provider.g.dart';

@riverpod
DataUserRepository dataUserRepository(DataUserRepositoryRef ref) =>
    SUpabaseDataUserRepository();
