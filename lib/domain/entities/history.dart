import 'package:project_redpoint/domain/entities/merch.dart';
import 'package:project_redpoint/domain/entities/user.dart';

class History {
  final User? user;
  final List<Merch> merchs;

  History({this.user, required this.merchs});
}
