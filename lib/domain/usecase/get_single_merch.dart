import 'package:project_redpoint/data/repositories/merch_repository.dart';
import 'package:project_redpoint/domain/entities/merch.dart';
import 'package:project_redpoint/domain/usecase/get_single_merch_param.dart';
import 'package:project_redpoint/domain/usecase/usecase.dart';

class GetSingleMerch implements Usecase<Merch, GetSingleMerchParam> {
  final MerchRepository merchRepository;

  GetSingleMerch({required this.merchRepository});

  @override
  Future<Merch> call(GetSingleMerchParam params) async {
    final merch = await merchRepository.getSingleMerch(params.id);

    return merch;
  }
}
