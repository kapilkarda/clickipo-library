class UserModel {
  int error;
  String message;
  UserData data;

  UserModel({this.error, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data = json['data'] != null ? new UserData.fromJson(json['data']) : null;
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

class UserData {
  String firstName;
  String lastName;
  String email;
  Null marketingBrokerage;
  String createdAt;
  String updatedAt;
  int restricted;
  double defaultAmount;
  int canEmail;
  int pushNotification;
  String alias;
  String profilePictureUrl;
  List<Null> userIdentities;
  BrokerConnection brokerConnection;

  UserData(
      {this.firstName,
      this.lastName,
      this.email,
      this.marketingBrokerage,
      this.createdAt,
      this.updatedAt,
      this.restricted,
      this.defaultAmount,
      this.canEmail,
      this.pushNotification,
      this.alias,
      this.profilePictureUrl,
      this.userIdentities,
      this.brokerConnection});

  UserData.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    marketingBrokerage = json['marketing_brokerage'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    restricted = json['restricted'];
    defaultAmount = json['default_amount'];
    canEmail = json['can_email'];
    pushNotification = json['push_notification'];
    alias = json['alias'];
    profilePictureUrl = json['profile_picture_url'];
    brokerConnection = json['broker_connection'] != null
        ? new BrokerConnection.fromJson(json['broker_connection'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['marketing_brokerage'] = this.marketingBrokerage;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['restricted'] = this.restricted;
    data['default_amount'] = this.defaultAmount;
    data['can_email'] = this.canEmail;
    data['push_notification'] = this.pushNotification;
    data['alias'] = this.alias;
    data['profile_picture_url'] = this.profilePictureUrl;
    if (this.brokerConnection != null) {
      data['broker_connection'] = this.brokerConnection.toJson();
    }
    return data;
  }
}

class BrokerConnection {
  String brokerDealerName;
  String mpid;
  String minimumBuyOrder;
  String accountId;
  String accountName;
  String accountType;
  String status;
  double buyingPower;
  int canAcceptOrder;
  BrokerDealerRestrictions brokerDealerRestrictions;
  String updatedAt;

  BrokerConnection(
      {this.brokerDealerName,
      this.mpid,
      this.minimumBuyOrder,
      this.accountId,
      this.accountName,
      this.accountType,
      this.status,
      this.buyingPower,
      this.canAcceptOrder,
      this.brokerDealerRestrictions,
      this.updatedAt});

  BrokerConnection.fromJson(Map<String, dynamic> json) {
    brokerDealerName = json['broker_dealer_name'];
    mpid = json['mpid'];
    minimumBuyOrder = json['minimum_buy_order'];
    accountId = json['account_id'];
    accountName = json['account_name'];
    accountType = json['account_type'];
    status = json['status'];
    buyingPower = json['buying_power'];
    canAcceptOrder = json['can_accept_order'];
    brokerDealerRestrictions = json['broker_dealer_restrictions'] != null
        ? new BrokerDealerRestrictions.fromJson(
            json['broker_dealer_restrictions'])
        : null;
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['broker_dealer_name'] = this.brokerDealerName;
    data['mpid'] = this.mpid;
    data['minimum_buy_order'] = this.minimumBuyOrder;
    data['account_id'] = this.accountId;
    data['account_name'] = this.accountName;
    data['account_type'] = this.accountType;
    data['status'] = this.status;
    data['buying_power'] = this.buyingPower;
    data['can_accept_order'] = this.canAcceptOrder;
    if (this.brokerDealerRestrictions != null) {
      data['broker_dealer_restrictions'] =
          this.brokerDealerRestrictions.toJson();
    }
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class BrokerDealerRestrictions {
  int canAcceptOrder;
  String minimumBuyOrder;

  BrokerDealerRestrictions({this.canAcceptOrder, this.minimumBuyOrder});

  BrokerDealerRestrictions.fromJson(Map<String, dynamic> json) {
    canAcceptOrder = json['can_accept_order'];
    minimumBuyOrder = json['minimum_buy_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['can_accept_order'] = this.canAcceptOrder;
    data['minimum_buy_order'] = this.minimumBuyOrder;
    return data;
  }
}
