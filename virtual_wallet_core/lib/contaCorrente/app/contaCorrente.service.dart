import '../domain/contaCorrente.dart';
import '../domain/contaCorrente.repository.dart';
import '../domain/credito.dart';
import 'cmd/depositar.cmd.dart';
import 'cmd/fecharContaCorrente.cmd.dart';
import 'cmd/registrarNovaConta.cmd.dart';
import 'cmd/sacar.cmd.dart';

class ContaCorrenteService {
  final ContaCorrenteRepository repository;

  ContaCorrenteService(this.repository);

  ContaCorrente registrar(RegistrarNovaConta cmd) {
    return repository.save(ContaCorrente.nova());
  }

  void depositar(Depositar cmd) {
    ContaCorrente contaCorrente = repository.getById(cmd.contaCorrente);
    contaCorrente.depositar(Credito.of(cmd.valor.toMoney(), cmd.descricao));

    repository.save(contaCorrente);
  }

  void sacar(Sacar cmd) {
    ContaCorrente contaCorrente = repository.getById(cmd.contaCorrente);
    contaCorrente.sacar(Debito.of(cmd.valor.toMoney()));

    repository.save(contaCorrente);
  }

  void fechar(FecharConta cmd) {
    ContaCorrente contaCorrente = repository.getById(cmd.contaCorrente);
    contaCorrente.fechar();

    repository.save(contaCorrente);
  }
}
