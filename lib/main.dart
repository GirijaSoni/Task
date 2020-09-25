import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/post_api_service.dart';
import 'database/moor_database.dart';
import 'homepage.dart';
import 'injection_container.dart';

void main() {
  setupLocator();
  runApp(MyApp());


}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider(builder: (_) => PostApiService.create(),dispose: (context, PostApiService service) => service.client.dispose()),
        Provider(builder: (_) =>AppDatabase())
      ],
        child: MaterialApp(
      title: 'Flutter Demo',
    theme: ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    primaryColor: Color(0xff669db2),

    // This makes the visual density adapt to the platform that you run
    // the app on. For desktop platforms, the controls will be smaller and
    // closer together (more dense) than on mobile platforms.
    visualDensity: VisualDensity.adaptivePlatformDensity),
          home: homepage(),
    )
    );
  }
}