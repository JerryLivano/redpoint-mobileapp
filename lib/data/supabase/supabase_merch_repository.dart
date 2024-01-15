import 'package:project_redpoint/data/repositories/merch_repository.dart';
import 'package:project_redpoint/domain/entities/merch.dart';
import 'package:project_redpoint/domain/entities/supabase.dart';

class SupabaseMerchRepository implements MerchRepository {
  @override
  Future<List<Merch>> getMerch() async {
    final responses = await Supabase()
        .getSupabase()
        .from('merch')
        .select('*')
        .order('id', ascending: true);

    List<Merch> merchs = <Merch>[];

    if (responses.isNotEmpty) {
      for (final data in responses) {
        merchs.add(
          Merch(
            name: data['name'].toString(),
            price: data['price'] as int,
            stock: data['stock'] as int,
            image: data['image'],
          ),
        );
      }
    }

    return merchs;
  }

  @override
  Future<Merch> getSingleMerch(int id) async {
    final response =
        await Supabase().getSupabase().from('merch').select('*').eq('id', id);

    if (response.data != null) {
      return Merch(
        name: response.data!['name'] as String,
        price: response.data!['price'] as int,
        stock: response.data!['stock'] as int,
        image: response.data!['image'],
      );
    } else {
      throw Exception('No data found for the specified id: $id');
    }
  }
}
