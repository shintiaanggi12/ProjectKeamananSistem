import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:daynote/controllers/auth_controller.dart';
import 'package:daynote/pages/home_page.dart';
import 'package:daynote/routes.dart';
import 'package:daynote/theme.dart';
import 'package:daynote/wrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: AuthServices.userStream,
        initialData: null,
        builder: (context, snapshot) {
          return MaterialApp(
            home: Wrapper(),
            theme: theme(),
            debugShowCheckedModeBanner: false,
            routes: routes,
          );
        });
  }
}
