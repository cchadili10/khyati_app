class Item {
  final int? id;
  final String name;
  final String type;
  final String type_tob;
  final double ktaf;
  final double kom;
  final double sdr;
  final double hzam;
  final double tol;
  final double trkiz;
  final double ras_kom;
  final String fatha;
  final double col;
  final double price;
  final double pay;
  final double rest;

  const Item({
    this.id,
    required this.name,
    required this.type,
    required this.type_tob,
    required this.ktaf,
    required this.kom,
    required this.sdr,
    required this.hzam,
    required this.tol,
    required this.trkiz,
    required this.ras_kom,
    required this.fatha,
    required this.col,
    required this.price,
    required this.pay,
    required this.rest,
  });

  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name':name,
      'type':type,
      'type_tob':type_tob,
      'ktaf' : ktaf,
      'kom':kom,
      'sdr':sdr,
      'hzam':hzam,
      'tol':tol,
      'trkiz':trkiz,
      'ras_kom':ras_kom,
      'fatha' : fatha,
      'col' : col,
      'price':price,
      'pay':pay,
      'resy':rest
    };
  }
}
