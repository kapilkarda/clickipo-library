class OfferingDetailsModel {
  int error;
  String message;
  OffDetailsData data;

  OfferingDetailsModel({this.error, this.message, this.data});

  OfferingDetailsModel.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
    data =
        json['data'] != null ? new OffDetailsData.fromJson(json['data']) : null;
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

class OffDetailsData {
  String name;
  String description;
  String tickerSymbol;
  String logoSmall;
  String extId;
  String status;
  double minPrice;
  double maxPrice;
  Null priceRange;
  String brochureUrl;
  String prospectusUrl;
  int dsp;
  int unitIncrement;
  Null dspAttestationFile;
  Null dspFaqFile;
  int ordrDollarShare;
  int bizInsights;
  String tradeDate;
  String finalShares;
  int availableToOrder;
  String createdAt;
  String updatedAt;
  Null activeWindow;
  String exchange;
  Null sixtyMinMailTime;
  double minTicketSize;
  double maxTicketSize;
  Null ioiCutoffDatetime;
  String industry;
  String offeringTypeName;
  int ratingCount;
  Null ratingAverage;
  int maxShares;
  bool dspAttestationFlag;
  bool enforceBuyingPower;
  List<UnderwritersList> underwritersList;
  bool read;
  bool followed;
  bool hasOrder;

  OffDetailsData(
      {this.name,
      this.description,
      this.tickerSymbol,
      this.logoSmall,
      this.extId,
      this.status,
      this.minPrice,
      this.maxPrice,
      this.priceRange,
      this.brochureUrl,
      this.prospectusUrl,
      this.dsp,
      this.unitIncrement,
      this.dspAttestationFile,
      this.dspFaqFile,
      this.ordrDollarShare,
      this.bizInsights,
      this.tradeDate,
      this.finalShares,
      this.availableToOrder,
      this.createdAt,
      this.updatedAt,
      this.activeWindow,
      this.exchange,
      this.sixtyMinMailTime,
      this.minTicketSize,
      this.maxTicketSize,
      this.ioiCutoffDatetime,
      this.industry,
      this.offeringTypeName,
      this.ratingCount,
      this.ratingAverage,
      this.maxShares,
      this.dspAttestationFlag,
      this.enforceBuyingPower,
      this.underwritersList,
      this.read,
      this.followed,
      this.hasOrder});

  OffDetailsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    tickerSymbol = json['ticker_symbol'];
    logoSmall = json['logo_small'];
    extId = json['ext_id'];
    status = json['status'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    priceRange = json['price_range'];
    brochureUrl = json['brochure_url'];
    prospectusUrl = json['prospectus_url'];
    dsp = json['dsp'];
    unitIncrement = json['unit_increment'];
    dspAttestationFile = json['dsp_attestation_file'];
    dspFaqFile = json['dsp_faq_file'];
    ordrDollarShare = json['ordr_dollar_share'];
    bizInsights = json['biz_insights'];
    tradeDate = json['trade_date'];
    finalShares = json['final_shares'];
    availableToOrder = json['available_to_order'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    activeWindow = json['active_window'];
    exchange = json['exchange'];
    sixtyMinMailTime = json['sixty_min_mail_time'];
    minTicketSize = json['min_ticket_size'];
    maxTicketSize = json['max_ticket_size'];
    ioiCutoffDatetime = json['ioi_cutoff_datetime'];
    industry = json['industry'];
    offeringTypeName = json['offering_type_name'];
    ratingCount = json['rating_count'];
    ratingAverage = json['rating_average'];
    maxShares = json['max_shares'];
    dspAttestationFlag = json['dsp_attestation_flag'];
    enforceBuyingPower = json['enforce_buying_power'];
    if (json['underwriters_list'] != null) {
      underwritersList = new List<UnderwritersList>();
      json['underwriters_list'].forEach((v) {
        underwritersList.add(new UnderwritersList.fromJson(v));
      });
    }
    read = json['read'];
    followed = json['followed'];
    hasOrder = json['has_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['ticker_symbol'] = this.tickerSymbol;
    data['logo_small'] = this.logoSmall;
    data['ext_id'] = this.extId;
    data['status'] = this.status;
    data['min_price'] = this.minPrice;
    data['max_price'] = this.maxPrice;
    data['price_range'] = this.priceRange;
    data['brochure_url'] = this.brochureUrl;
    data['prospectus_url'] = this.prospectusUrl;
    data['dsp'] = this.dsp;
    data['unit_increment'] = this.unitIncrement;
    data['dsp_attestation_file'] = this.dspAttestationFile;
    data['dsp_faq_file'] = this.dspFaqFile;
    data['ordr_dollar_share'] = this.ordrDollarShare;
    data['biz_insights'] = this.bizInsights;
    data['trade_date'] = this.tradeDate;
    data['final_shares'] = this.finalShares;
    data['available_to_order'] = this.availableToOrder;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['active_window'] = this.activeWindow;
    data['exchange'] = this.exchange;
    data['sixty_min_mail_time'] = this.sixtyMinMailTime;
    data['min_ticket_size'] = this.minTicketSize;
    data['max_ticket_size'] = this.maxTicketSize;
    data['ioi_cutoff_datetime'] = this.ioiCutoffDatetime;
    data['industry'] = this.industry;
    data['offering_type_name'] = this.offeringTypeName;
    data['rating_count'] = this.ratingCount;
    data['rating_average'] = this.ratingAverage;
    data['max_shares'] = this.maxShares;
    data['dsp_attestation_flag'] = this.dspAttestationFlag;
    data['enforce_buying_power'] = this.enforceBuyingPower;
    if (this.underwritersList != null) {
      data['underwriters_list'] =
          this.underwritersList.map((v) => v.toJson()).toList();
    }
    data['read'] = this.read;
    data['followed'] = this.followed;
    data['has_order'] = this.hasOrder;
    return data;
  }
}

class UnderwritersList {
  String executingBrokerMpid;
  String executingBrokerName;
  bool display;
  bool lead;

  UnderwritersList(
      {this.executingBrokerMpid,
      this.executingBrokerName,
      this.display,
      this.lead});

  UnderwritersList.fromJson(Map<String, dynamic> json) {
    executingBrokerMpid = json['executing_broker_mpid'];
    executingBrokerName = json['executing_broker_name'];
    display = json['display'];
    lead = json['lead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['executing_broker_mpid'] = this.executingBrokerMpid;
    data['executing_broker_name'] = this.executingBrokerName;
    data['display'] = this.display;
    data['lead'] = this.lead;
    return data;
  }
}
