import 'package:uuid/uuid.dart';

class ContaCorrenteId {
  String _id;

  String id() => _id;

  ContaCorrenteId(String uuid) {
    this._id = uuid;
  }

  static ContaCorrenteId novo() {
    return new ContaCorrenteId(Uuid().v4());
  }
}
