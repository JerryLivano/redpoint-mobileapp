import 'package:project_redpoint/data/repositories/merch_repository.dart';
import 'package:project_redpoint/data/supabase/supabase_merch_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'merch_repository_provider.g.dart';

@riverpod
MerchRepository merchRepository(MerchRepositoryRef ref) =>
    SupabaseMerchRepository();
