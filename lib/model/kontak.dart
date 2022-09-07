class Kontak {
  int? id;
  String? name;
  String? mobileNo;
  String? email;
  String? company;

  Kontak({this.id, this.name, this.mobileNo, this.email, this.company});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'mobileNo': mobileNo,
      'email': email,
      'company': company,
    };
  }

  Kontak.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    mobileNo = map['mobileNo'];
    email = map['email'];
    company = map['company'];
  }
}
