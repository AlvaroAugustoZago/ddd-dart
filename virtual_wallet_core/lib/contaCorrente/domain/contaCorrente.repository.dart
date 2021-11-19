import 'contaCorrente.dart';
import 'contaCorrente.id.dart';

abstract class ContaCorrenteRepository {
  ContaCorrente save(ContaCorrente contaCorrente);
  ContaCorrente getById(ContaCorrenteId contaCorrenteId);
}
