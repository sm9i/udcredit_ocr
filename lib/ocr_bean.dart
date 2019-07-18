class OcrBean {
  String addrCard;
  String beIdcard;
  String branchIssued;
  String classify;
  ClassifyTag classifyTag;
  String dateBirthday;
  String flagSex; //success  性别
  String idName; //success  姓名
  String idNo; // success 身份证
  String resultAuth;
  String resultStatus; //认证结果  T通过 F未通过
  String retCode; //000000  成功
  String retMsg;
  RiskTag riskTag; //作弊
  String startCard;
  String stateId; //success  民族
  String urlBackcard; //国徽地址  7天有效
  String urlFrontcard; //人像图片地址 7天有效
  String urlPhotoget;
  String urlPhotoliving;

  OcrBean(
      {this.addrCard,
      this.beIdcard,
      this.branchIssued,
      this.classify,
      this.classifyTag,
      this.dateBirthday,
      this.flagSex,
      this.idName,
      this.idNo,
      this.resultAuth,
      this.resultStatus,
      this.retCode,
      this.retMsg,
      this.riskTag,
      this.startCard,
      this.stateId,
      this.urlBackcard,
      this.urlFrontcard,
      this.urlPhotoget,
      this.urlPhotoliving});

  OcrBean.fromJson(Map<String, dynamic> json) {
    addrCard = json['addr_card'];
    beIdcard = json['be_idcard'];
    branchIssued = json['branch_issued'];
    classify = json['classify'];
    classifyTag = json['classify_tag'] != null
        ? new ClassifyTag.fromJson(json['classify_tag'])
        : null;
    dateBirthday = json['date_birthday'];
    flagSex = json['flag_sex'];
    idName = json['id_name'];
    idNo = json['id_no'];
    resultAuth = json['result_auth'];
    resultStatus = json['result_status'];
    retCode = json['ret_code'];
    retMsg = json['ret_msg'];
    riskTag = json['risk_tag'] != null
        ? new RiskTag.fromJson(json['risk_tag'])
        : null;
    startCard = json['start_card'];
    stateId = json['state_id'];
    urlBackcard = json['url_backcard'];
    urlFrontcard = json['url_frontcard'];
    urlPhotoget = json['url_photoget'];
    urlPhotoliving = json['url_photoliving'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addr_card'] = this.addrCard;
    data['be_idcard'] = this.beIdcard;
    data['branch_issued'] = this.branchIssued;
    data['classify'] = this.classify;
    if (this.classifyTag != null) {
      data['classify_tag'] = this.classifyTag.toJson();
    }
    data['date_birthday'] = this.dateBirthday;
    data['flag_sex'] = this.flagSex;
    data['id_name'] = this.idName;
    data['id_no'] = this.idNo;
    data['result_auth'] = this.resultAuth;
    data['result_status'] = this.resultStatus;
    data['ret_code'] = this.retCode;
    data['ret_msg'] = this.retMsg;
    if (this.riskTag != null) {
      data['risk_tag'] = this.riskTag.toJson();
    }
    data['start_card'] = this.startCard;
    data['state_id'] = this.stateId;
    data['url_backcard'] = this.urlBackcard;
    data['url_frontcard'] = this.urlFrontcard;
    data['url_photoget'] = this.urlPhotoget;
    data['url_photoliving'] = this.urlPhotoliving;
    return data;
  }
}

class ClassifyTag {
  String classify;
  String classifyScore;

  ClassifyTag({this.classify, this.classifyScore});

  ClassifyTag.fromJson(Map<String, dynamic> json) {
    classify = json['classify'];
    classifyScore = json['classify_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['classify'] = this.classify;
    data['classify_score'] = this.classifyScore;
    return data;
  }
}

class RiskTag {
  String livingAttack;
  String livingAttackScore;

  RiskTag({this.livingAttack, this.livingAttackScore});

  RiskTag.fromJson(Map<String, dynamic> json) {
    livingAttack = json['living_attack'];
    livingAttackScore = json['living_attack_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['living_attack'] = this.livingAttack;
    data['living_attack_score'] = this.livingAttackScore;
    return data;
  }
}
