class Ghanacard_Model {
  dynamic username;
  String? tin;
  String? name;
  String? taxPayer;
  String? surname;
  String? otherName;
  dynamic birthDate;
  String? taxPayerTypeID;
  String? taxPayerSubTypeID;
  String? taxPayerType;
  String? taxPayerOffice;
  String? taxPayerBranchID;
  dynamic mobileNo;
  dynamic telephoneNo;
  String? email;
  String? address;

  Ghanacard_Model({
    this.username,
    this.tin,
    this.name,
    this.taxPayer,
    this.surname,
    this.otherName,
    this.birthDate,
    this.taxPayerTypeID,
    this.taxPayerSubTypeID,
    this.taxPayerType,
    this.taxPayerOffice,
    this.taxPayerBranchID,
    this.mobileNo,
    this.telephoneNo,
    this.email,
    this.address,
  });

  factory Ghanacard_Model.fromJson(Map<String, dynamic> json) {
    return Ghanacard_Model(
      username: json['username'],
      tin: json['tin'],
      name: json['name'],
      taxPayer: json['taxPayer'],
      surname: json['surname'],
      otherName: json['otherName'],
      birthDate: json['birthDate'],
      taxPayerTypeID: json['taxPayerTypeID'],
      taxPayerSubTypeID: json['taxPayerSubTypeID'],
      taxPayerType: json['taxPayerType'],
      taxPayerOffice: json['taxPayerOffice'],
      taxPayerBranchID: json['taxPayerBranchID'],
      mobileNo: json['mobileNo'],
      telephoneNo: json['telephoneNo'],
      email: json['email'],
      address: json['address'],
    );
  }
}
