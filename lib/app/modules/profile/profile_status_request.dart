enum ProfileStatusRequest { loading, success, error, none }

extension StatusExt on ProfileStatusRequest {
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}
