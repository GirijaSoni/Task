import 'package:json_annotation/json_annotation.dart';

part 'bank.g.dart';

@JsonSerializable()
class Bank {
    Bank();
    String STDCODE;
    String CENTRE;
    String ADDRESS;
    String MICR;
    String CITY;
    String STATE;
    bool RTGS;
    String BRANCH;
    String DISTRICT;
    bool NEFT;
    bool UPI;
    String CONTACT;
    String MICRCODE;
    bool IMPS;
    String BANK;
    String BANKCODE;
    String IFSC;
    
    factory Bank.fromJson(Map<String,dynamic> json) => _$BankFromJson(json);
    Map<String, dynamic> toJson() => _$BankToJson(this);
}
