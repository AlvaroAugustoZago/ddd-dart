abstract class ValueObject {
  ValueObject() {}

  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    } else if (other is ValueObject) {
      ValueObject that = other;
      //return (this.prop1 == that.prop1) && (this.prop2 == that.prop2);
    } else {
      return false;
    }
  }
}
