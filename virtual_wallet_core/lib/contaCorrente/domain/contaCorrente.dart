import 'contaCorrente.id.dart';
import 'contaCorrenteStatus.dart';
import 'credito.dart';
import 'exception/fecharConta.exception.dart';
import 'exception/saque.exception.dart';
import 'transacao.dart';
import '../../infra/money/money.dart';
import '../../infra/money/positiveMoney.dart';

class ContaCorrente {
  final ContaCorrenteId id;
  final DateTime dataAbertura;
  final List<Transacao> extrato;
  Status status;

  ContaCorrente(this.id, this.dataAbertura, this.extrato, this.status);

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
      return;
    }
    throw new ContaFechadaComSaldo();
  }

  Money saldo() {
    return this
        .extrato
        .map((transacao) => transacao.quantia)
        .reduce((value, quantia) => quantia.add(value).toMoney());
  }

  static ContaCorrente nova() {
    return from(DateTime.now(), List.empty());
  }

  static ContaCorrente from(DateTime dataAbertura, List<Transacao> extrato) {
    return new ContaCorrente(
        ContaCorrenteId.novo(), dataAbertura, extrato, Status.Aberto);
  }
}
