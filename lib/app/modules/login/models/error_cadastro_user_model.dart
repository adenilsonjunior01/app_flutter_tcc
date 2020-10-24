class ErrorCadastroUserModel {
  int status;
  String message;
  int timeStamp;

  ErrorCadastroUserModel({this.status, this.message, this.timeStamp});

  ErrorCadastroUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    timeStamp = json['timeStamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['timeStamp'] = this.timeStamp;
    return data;
  }
}
