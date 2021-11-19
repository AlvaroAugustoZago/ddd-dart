import 'money.dart';
import 'moneyExceptions.dart';

class PositiveMoney {
  Money _valor;

  PositiveMoney(double valor) {
    if (valor < 0) {
      throw new MoneyShouldBePositiveException("Valor deve ser maior que 0");
    }
    this._valor = new Money(valor);
  }

  Money toMoney() => this._valor;

  PositiveMoney add(PositiveMoney positiveAmount) {
    return this._valor.add(positiveAmount._valor);
  }

  Money substract(PositiveMoney positiveAmount) {
    return this._valor.substract(positiveAmount._valor);
  }
}
