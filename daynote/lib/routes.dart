import 'package:flutter/material.dart';
import 'package:daynote/pages/home/activity_page.dart';
import 'package:daynote/pages/activity/add_activity.dart';
import 'package:daynote/pages/note/add_note_page.dart';
import 'package:daynote/pages/create_pin_page.dart';
import 'package:daynote/pages/enter_pin_page.dart';
import 'package:daynote/pages/home/note_page.dart';
import 'package:daynote/pages/home/profile_page.dart';
import 'package:daynote/pages/register_page.dart';
import 'package:daynote/pages/splash_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/splash': (context) => SplashPage(),
  '/register': (context) => RegisterPage(),
  '/enter_pin': (context) => EnterPin(),
  '/profile': (context) => ProfilePage(),
  '/note': (context) => NotePage(),
  '/add_note': (context) => AddNotePage(),
  '/activity': (context) => ActivityPage(),
  '/add_activity': (context) => AddActivityPage(),
};
