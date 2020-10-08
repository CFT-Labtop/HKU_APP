class Dangerous_Goods_Order {
  String department_code;
  String department_name;
  int ID_account;
  String ac_name;
  int hospital_price;
  String ref_no;
  String po_date;
  String requested_by;
  String telephone_no;
  String ac_no;
  String user;
  String building;
  String issued_by;
  int voucher;
  String remarks;
  int status;
  // String dn_file_name;
  String dn_file;
  String modify_user;
  int isDeleted;

  Dangerous_Goods_Order(Map<String, dynamic> json) {
    this.department_code = json["department_code"];
    this.department_name = json["department_name"];
    this.ID_account = json["ID_account"];
    this.ac_name = json["ac_name"];
    this.hospital_price = json["hospital_price"];
    this.ref_no = json["ref_no"];
    this.po_date = json["po_date"];
    this.requested_by = json["requested_by"];
    this.telephone_no = json["telephone_no"];
    this.ac_no = json["ac_no"];
    this.user = json["user"];
    this.building = json["building"];
    this.issued_by = json["issued_by"];
    this.voucher = json["voucher"];
    this.remarks = json["remarks"];
    this.status = json["status"];
    this.dn_file = json["dn_file"];
    this.modify_user = json["modify_user"];
    this.isDeleted = json["isDeleted"];
  }

  Map<String, dynamic> toJSON() {}

  String toJSONString() {}
}
