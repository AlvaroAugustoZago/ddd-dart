import 'package:virtual_wallet_core/contaCorrente/domain/contaCorrente.id.dart';
import 'package:virtual_wallet_core/virtual_wallet_core.dart';

class ContaCorrenteRepositoryInMemory implements ContaCorrenteRepository {
  List<ContaCorrente> contas = List.empty(growable: true);
  ContaCorrente save(ContaCorrente contaCorrente) {
    this.contas.add(contaCorrente);
    return contaCorrente;
  }

  ContaCorrente getById(ContaCorrenteId contaCorrenteId) {
    return this.contas.where((conta) => conta.id == contaCorrenteId).first;
  }
}
