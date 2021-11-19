import 'transacao.dart';
import '../../infra/money/money.dart';

class Credito extends Transacao {
  Credito(Money quantia, DateTime data, String descricao)
      : super(quantia, data, descricao);

  static Credito of(Money quantia, String descricao) {
    return new Credito(quantia, DateTime.now(), descricao);
  }
}

class Debito extends Transacao {
  Debito(Money quantia, DateTime data) : super(quantia, data, "Saque");

  static Debito of(Money quantia) {
    return new Debito(quantia, DateTime.now());
  }
}
