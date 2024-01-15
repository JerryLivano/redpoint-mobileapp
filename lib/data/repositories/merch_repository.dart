import 'package:project_redpoint/domain/entities/merch.dart';

abstract interface class MerchRepository {
  Future<List<Merch>> getMerch();
  Future<Merch> getSingleMerch(int id);
}
