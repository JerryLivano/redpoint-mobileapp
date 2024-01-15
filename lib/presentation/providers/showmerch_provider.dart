import 'package:project_redpoint/domain/usecase/show_merch.dart';
import 'package:project_redpoint/presentation/providers/merch_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'showmerch_provider.g.dart';

@riverpod
ShowMerch showMerch(ShowMerchRef ref) =>
    ShowMerch(merchRepository: ref.read(merchRepositoryProvider));
