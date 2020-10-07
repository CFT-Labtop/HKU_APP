class Dangerous_Goods_Order_Detail {
  int ID_dangerous_goods_order;
  int ID_dangerous_goods;
  int ID_stock_inventory;
  List<dynamic> ID_stock_inventory_detail;
  int pickedQuantity;
  String article_no;
  String location;
  String shelf;
  String rfid_code;
  String pick_dept_code;
  String product_name;
  int unit_price;
  int quantity;
  // double volume;
  String unit;
  int amount;
  String product_brand;

  Dangerous_Goods_Order_Detail(Map<String, dynamic> json) {
    this.ID_dangerous_goods_order = json["ID_dangerous_goods_order"];
    this.ID_dangerous_goods = json["ID_dangerous_goods"];
    this.ID_stock_inventory = json["ID_stock_inventory"];
    this.ID_stock_inventory_detail = json["ID_stock_inventory_detail"];
    this.pickedQuantity = json["pickedQuantity"];
    this.article_no = json["article_no"];
    this.location = json["location"];
    this.shelf = json["shelf"];
    this.rfid_code = json["rfid_code"];
    this.pick_dept_code = json["pick_dept_code"];
    this.product_name = json["product_name"];
    this.unit_price = json["unit_price"];
    this.quantity = json["quantity"];
    // this.volume = json["volume"];
    this.unit = json["unit"];
    this.amount = json["amount"];
    this.product_brand = json["product_brand"];
  }

  Map<String, dynamic> toJSON() {}

  String toJSONString() {}
}
