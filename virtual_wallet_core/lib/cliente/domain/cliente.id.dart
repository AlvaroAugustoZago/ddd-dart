import 'package:uuid/uuid.dart';

class ClienteId {
  String _id;

  String id() => _id;

  ClienteId(String uuid) {
    this._id = uuid;
  }

  static ClienteId novo() {
    return new ClienteId(Uuid().v4());
  }
}
