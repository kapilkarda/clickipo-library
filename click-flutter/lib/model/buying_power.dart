class BuyingPowerModel {
  int error;
  String message;
  BuyingPoData data;

  BuyingPowerModel({this.error, this.message, this.data});

  BuyingPowerModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data =
        json['data'] != null ? new BuyingPoData.fromJson(json['data']) : null;
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

class BuyingPoData {
  String accountId;
  String accountName;
  String accountType;
  String brokerDealerName;
  String mpid;
  double buyingPower;

  BuyingPoData(
      {this.accountId,
      this.accountName,
      this.accountType,
      this.brokerDealerName,
      this.mpid,
      this.buyingPower});

  BuyingPoData.fromJson(Map<String, dynamic> json) {
    accountId = json['account_id'];
    accountName = json['account_name'];
    accountType = json['account_type'];
    brokerDealerName = json['broker_dealer_name'];
    mpid = json['mpid'];
    buyingPower = json['buying_power'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_id'] = this.accountId;
    data['account_name'] = this.accountName;
    data['account_type'] = this.accountType;
    data['broker_dealer_name'] = this.brokerDealerName;
    data['mpid'] = this.mpid;
    data['buying_power'] = this.buyingPower;
    return data;
  }
}
