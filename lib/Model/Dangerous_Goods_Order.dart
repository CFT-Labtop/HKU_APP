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
    this.department_code = json["department_code"]??null;
    this.department_name = json["department_name"]??null;
    this.ID_account = json["ID_account"]??null;
    this.ac_name = json["ac_name"]??null;
    this.hospital_price = json["hospital_price"]??null;
    this.ref_no = json["ref_no"]??null;
    this.po_date = json["po_date"]??null;
    this.requested_by = json["requested_by"]??null;
    this.telephone_no = json["telephone_no"]??null;
    this.ac_no = json["ac_no"]??null;
    this.user = json["user"]??null;
    this.building = json["building"]??null;
    this.issued_by = json["issued_by"]??null;
    this.voucher = json["voucher"]??null;
    this.remarks = json["remarks"]??null;
    this.status = json["status"]??null;
    this.dn_file = json["dn_file"]??null;
    this.modify_user = json["modify_user"]??null;
    this.isDeleted = json["isDeleted"]??null;
  }

  Map<String, dynamic> toJSON() {}

  String toJSONString() {}
}
