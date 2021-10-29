import 'package:flutter/material.dart';
import 'package:my_cv/profile/profile.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
          key: key,
          home: ProfilePage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Prompt'),
        );
}
