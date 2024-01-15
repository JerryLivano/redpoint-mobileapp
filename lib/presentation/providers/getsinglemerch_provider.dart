import 'package:project_redpoint/domain/usecase/get_single_merch.dart';
import 'package:project_redpoint/presentation/providers/merch_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'getsinglemerch_provider.g.dart';

@riverpod
GetSingleMerch getSingleMerch(GetSingleMerchRef ref) =>
    GetSingleMerch(merchRepository: ref.read(merchRepositoryProvider));
