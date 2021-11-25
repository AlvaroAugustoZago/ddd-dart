import 'cliente.dart';
import 'cliente.id.dart';

abstract class ClienteRepository {
  Cliente save(Cliente cliente);
  Cliente getById(ClienteId id);
}
