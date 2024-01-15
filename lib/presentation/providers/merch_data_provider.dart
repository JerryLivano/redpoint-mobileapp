import 'package:project_redpoint/domain/entities/merch.dart';
import 'package:project_redpoint/domain/usecase/get_single_merch.dart';
import 'package:project_redpoint/domain/usecase/get_single_merch_param.dart';
import 'package:project_redpoint/domain/usecase/no_param.dart';
import 'package:project_redpoint/domain/usecase/show_merch.dart';
import 'package:project_redpoint/presentation/providers/getsinglemerch_provider.dart';
import 'package:project_redpoint/presentation/providers/showmerch_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'merch_data_provider.g.dart';

@Riverpod(keepAlive: true)
class MerchData extends _$MerchData {
  @override
  Future<Merch?> build() async => null;

  Future<List<Merch>> showMerch() async {
    ShowMerch showMerch = ref.read(showMerchProvider);
    var merchs = await showMerch(NoParam());
    return merchs;
  }

  Future<Merch> getSingleMerch(int id) async {
    state = const AsyncLoading();
    GetSingleMerch getSingleMerch = ref.read(getSingleMerchProvider);
    var merch = await getSingleMerch(GetSingleMerchParam(id: id));
    state = AsyncData(merch);
    return merch;
  }
}
