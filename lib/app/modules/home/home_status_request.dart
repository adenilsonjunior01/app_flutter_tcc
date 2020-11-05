enum HomeStatusRequest { loading, success, error, none }

extension StatusExt on HomeStatusRequest {
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}
