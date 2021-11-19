import '../../infra/money/money.dart';

abstract class Transacao {
  final Money quantia;
  final DateTime data;
  final String descricao;

  Transacao(this.quantia, this.data, this.descricao);
}
