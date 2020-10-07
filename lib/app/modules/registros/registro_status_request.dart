enum RegistroStatusRequest { loading, success, error, none }

extension StatusExt on RegistroStatusRequest {
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}
