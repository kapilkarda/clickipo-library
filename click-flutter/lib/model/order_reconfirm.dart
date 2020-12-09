class OrderRecModel {
  int error;
  String errorConfig;
  Null data;

  OrderRecModel({this.error, this.errorConfig, this.data});

  OrderRecModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    errorConfig = json['errorConfig'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['errorConfig'] = this.errorConfig;
    data['data'] = this.data;
    return data;
  }
}
