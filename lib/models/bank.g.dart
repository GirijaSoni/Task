// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bank _$BankFromJson(Map<String, dynamic> json) {
  return Bank()
    ..STDCODE = json['STDCODE'] as String
    ..CENTRE = json['CENTRE'] as String
    ..ADDRESS = json['ADDRESS'] as String
    ..MICR = json['MICR'] as String
    ..CITY = json['CITY'] as String
    ..STATE = json['STATE'] as String
    ..RTGS = json['RTGS'] as bool
    ..BRANCH = json['BRANCH'] as String
    ..DISTRICT = json['DISTRICT'] as String
    ..NEFT = json['NEFT'] as bool
    ..UPI = json['UPI'] as bool
    ..CONTACT = json['CONTACT'] as String
    ..MICRCODE = json['MICRCODE'] as String
    ..IMPS = json['IMPS'] as bool
    ..BANK = json['BANK'] as String
    ..BANKCODE = json['BANKCODE'] as String
    ..IFSC = json['IFSC'] as String;
}

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'STDCODE': instance.STDCODE,
      'CENTRE': instance.CENTRE,
      'ADDRESS': instance.ADDRESS,
      'MICR': instance.MICR,
      'CITY': instance.CITY,
      'STATE': instance.STATE,
      'RTGS': instance.RTGS,
      'BRANCH': instance.BRANCH,
      'DISTRICT': instance.DISTRICT,
      'NEFT': instance.NEFT,
      'UPI': instance.UPI,
      'CONTACT': instance.CONTACT,
      'MICRCODE': instance.MICRCODE,
      'IMPS': instance.IMPS,
      'BANK': instance.BANK,
      'BANKCODE': instance.BANKCODE,
      'IFSC': instance.IFSC
    };
