import '../../../cliente/domain/cliente.dart';
import '../../../infra/money/positiveMoney.dart';
import '../../domain/contaCorrente.id.dart';

class Depositar {
  ContaCorrenteId contaCorrente;
  PositiveMoney valor;
  String descricao;
}
