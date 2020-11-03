enum QrCodeStatusRequest { loading, success, error, none }

extension StatusExt on QrCodeStatusRequest {
  static var _value;
  get value => _value;
  set value(value) => _value = value;
}
