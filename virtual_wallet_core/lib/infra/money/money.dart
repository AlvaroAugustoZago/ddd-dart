import 'positiveMoney.dart';

class Money {
  final double _valor;

  Money(this._valor);

  double toDouble() => this._valor;

  bool menorQue(PositiveMoney amount) {
    return this._valor < amount.toMoney()._valor;
  }

  PositiveMoney add(Money money) {
    return new PositiveMoney(this._valor + money.toDouble());
  }

  Money substract(Money value) {
    return new Money(_valor - value.toDouble());
  }

  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    } else if (other is Money) {
      Money that = other;
      return (this._valor == that._valor);
    } else {
      return false;
    }
  }

  bool equals(Money other) {
    return this == other;
  }
}
