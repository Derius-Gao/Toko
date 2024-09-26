class Cabang {
  final int id;
  final String nama;
  final String alamat;
  final String kota;
  final String provinsi;
  final String kodepos;
  final String telp;
  final String email;
 
  Cabang({required this.id,required this.nama,required this.alamat,required this.kota,required this.provinsi,required this.kodepos,required this.telp,required this.email});
 
  factory Cabang.fromJson(Map<String, dynamic> json) {
    return Cabang(
      id: json['id'] as int,
      nama: json['nama'] as String,
      alamat: json['alamat'] as String,
      kota: json['kota'] as String,
      provinsi: json['provinsi'] as String,
      kodepos: json['kodepos'] as String,
      telp: json['telp'] as String,
      email: json['email'] as String
    );
  }
  
  factory Cabang.fromMap(Map<String, dynamic> map) {
    return Cabang(
      id: map['id'] as int,
      nama: map['nama'] as String,
      alamat: map['alamat'] as String,
      kota: map['kota'] as String,
      provinsi: map['provinsi'] as String,
      kodepos: map['kodepos'] as String,
      telp: map['telp'] as String,
      email: map['email'] as String
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['nama'] = nama;
    map['alamat'] = alamat;
    map['kota'] = kota;
    map['provinsi'] = provinsi;
    map['kodepos'] = kodepos;
    map['telp'] = telp;
    map['email'] = email;
    return map;
  }
}