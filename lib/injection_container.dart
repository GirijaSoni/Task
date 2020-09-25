import 'package:get_it/get_it.dart';
import 'package:testapp/data/post_api_service.dart';
import 'package:testapp/database/moor_database.dart';
import 'package:testapp/models/bank.dart';

final sl =GetIt.instance;
void setupLocator(){
  print("hey");
  sl.registerFactory(() => Bank());
  sl.registerFactory(() => AppDatabase());
}