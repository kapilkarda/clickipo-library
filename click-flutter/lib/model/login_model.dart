class LoginModel {
  int error;
  String message;
  LoginData data;

  LoginModel({this.error, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class LoginData {
  String token;
  String roleName;
  int loginCount;
  String lastLoginTime;

  LoginData({this.token, this.roleName, this.loginCount, this.lastLoginTime});

  LoginData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    roleName = json['role_name'];
    loginCount = json['login_count'];
    lastLoginTime = json['last_login_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['role_name'] = this.roleName;
    data['login_count'] = this.loginCount;
    data['last_login_time'] = this.lastLoginTime;
    return data;
  }
}
