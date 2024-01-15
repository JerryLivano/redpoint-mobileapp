import 'package:project_redpoint/data/repositories/merch_repository.dart';
import 'package:project_redpoint/domain/usecase/no_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

import '../entities/merch.dart';

class ShowMerch implements Usecase <List<Merch>, NoParam> {
  final MerchRepository merchRepository;

  ShowMerch({required this.merchRepository});

  @override
  Future<List<Merch>> call(NoParam param) async {
    final merchs = await merchRepository.getMerch();

    return merchs;
  }
}