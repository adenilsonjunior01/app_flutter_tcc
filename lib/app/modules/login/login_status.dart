enum LoginStatus { loading, success, error, none }

extension LoginStatusExt on LoginStatus {
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}
