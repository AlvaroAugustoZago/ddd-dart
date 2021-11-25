import 'package:virtual_wallet_core/cliente/domain/cliente.id.dart';

import '../../../infra/money/positiveMoney.dart';

class Depositar {
  final ClienteId cliente;
  final PositiveMoney valor;
  final String descricao;

  Depositar(this.cliente, this.valor, this.descricao);

  static from(ClienteId contaCorrente, PositiveMoney valor, String descricao) {
    return Depositar(contaCorrente, valor, descricao);
  }
}
