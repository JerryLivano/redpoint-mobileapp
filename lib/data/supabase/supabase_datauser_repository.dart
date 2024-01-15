import 'package:project_redpoint/data/repositories/datauser_repository.dart';
import 'package:project_redpoint/domain/entities/data_user.dart';
import 'package:project_redpoint/domain/entities/supabase.dart';

class SUpabaseDataUserRepository implements DataUserRepository {
  @override
  Future<List<DataUser>> getDataUser() async {
    final response = await Supabase()
        .getSupabase()
        .from('user')
        .select('donated, blood_type');

    List<DataUser> data = [];

    if (response.isNotEmpty) {
      double total_O = 0;
      double total_A = 0;
      double total_B = 0;
      double total_AB = 0;

      int len_O = 0;
      int len_A = 0;
      int len_B = 0;
      int len_AB = 0;

      for (var each in response) {
        if (each['blood_type'] == 'O') {
          total_O += each['donated'].toDouble();
          len_O++;
        } else if (each['blood_type'] == 'A') {
          total_A += each['donated'].toDouble();
          len_A++;
        } else if (each['blood_type'] == 'B'){
          total_B += each['donated'].toDouble();
          len_B++;
        } else if (each['blood_type'] == 'AB') {
          total_AB += each['donated'].toDouble();
          len_AB++;
        }
      }
      data.add(DataUser(userCount: len_O, bloodDonated: total_O));
      data.add(DataUser(userCount: len_A, bloodDonated: total_A));
      data.add(DataUser(userCount: len_B, bloodDonated: total_B));
      data.add(DataUser(userCount: len_AB, bloodDonated: total_AB));
    }
    return data;
  }
}
