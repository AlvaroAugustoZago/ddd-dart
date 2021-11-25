import '../../../infra/money/positiveMoney.dart';
import '../../domain/contaCorrente.id.dart';

class Depositar {
  final ContaCorrenteId contaCorrente;
  final PositiveMoney valor;
  final String descricao;

  Depositar(this.contaCorrente, this.valor, this.descricao);

  static from(
      ContaCorrenteId contaCorrente, PositiveMoney valor, String descricao) {
    return Depositar(contaCorrente, valor, descricao);
  }
}
