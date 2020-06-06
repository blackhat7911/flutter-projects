class Cases{
  String total;
  String confirmed;
  String recovered;
  String death;
  String pos_tested;
  String neg_tested;
  String isolation;
  String quarentine;
  String tested_rtd;
  String pending;

  Cases({
    this.total, 
    this.confirmed, 
    this.recovered, 
    this.death,
    this.pos_tested,
    this.neg_tested,
    this.isolation,
    this.quarentine,
    this.tested_rtd,
    this.pending
  });

  factory Cases.fromJson(Map<String, dynamic> json){
    return Cases(
      total: json['tested_total'].toString(),
      confirmed: json['tested_positive'].toString(),
      recovered: json['recovered'].toString(),
      death: json['deaths'].toString(),
      pos_tested: json['tested_positive'].toString(),
      neg_tested: json['tested_negative'].toString(),
      isolation: json['in_isolation'].toString(),
      quarentine: json['quarantined'].toString(),
      tested_rtd: json['tested_rtd'].toString(),
      pending: json['pending_result'].toString(),
    );
  }

}