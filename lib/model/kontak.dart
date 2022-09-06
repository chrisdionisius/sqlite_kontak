class Kontak {
  int? id;
  String? nama;
  String? mobileNo;
  String? email;
  String? company;

  Kontak({this.id, this.nama, this.mobileNo, this.email, this.company});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'mobileNo': mobileNo,
      'email': email,
      'company': company,
    };
  }

  Kontak.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    mobileNo = map['mobileNo'];
    email = map['email'];
    company = map['company'];
  }
}
