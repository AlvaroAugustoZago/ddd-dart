import 'package:meta/meta.dart';

import '../../cliente/domain/cliente.dart';
import 'contaCorrente.id.dart';
import 'contaCorrenteStatus.dart';
import 'credito.dart';
import 'exception/fecharConta.exception.dart';
import 'exception/saque.exception.dart';
import 'transacao.dart';
import '../../infra/money/money.dart';
import '../../infra/money/positiveMoney.dart';

@immutable
class ContaCorrente {
  final ContaCorrenteId id;
  final DateTime dataAbertura;
  final Cliente cliente;
  final List<Transacao> extrato;
  Status status;

  ContaCorrente(
      this.id, this.dataAbertura, this.cliente, this.extrato, this.status);

  void depositar(Credito credito) {
    this.extrato.add(credito);
  }

  void sacar(Debito debito) {
    if (saldo().substract(debito.quantia).menorQue(PositiveMoney(0)))
      throw new SaqueDeveSerMaiorQueSaldo();

    this.extrato.add(debito);
  }

  void fechar() {
    if (saldo().equals(Money(0))) {
      this.status = Status.Fechada;
    }
    throw new ContaFechadaComSaldo();
  }

  Money saldo() {
    return this
        .extrato
        .map((transacao) => transacao.quantia)
        .reduce((value, quantia) => quantia.add(value).toMoney());
  }

  static ContaCorrente from(
      DateTime dataAbertura, Cliente cliente, List<Transacao> extrato) {
    return new ContaCorrente(
        ContaCorrenteId.novo(), dataAbertura, cliente, extrato, Status.Aberto);
  }

  static ContaCorrente of(Cliente cliente) {
    return new ContaCorrente(ContaCorrenteId.novo(), DateTime.now(), cliente,
        List.empty(), Status.Aberto);
  }
}
