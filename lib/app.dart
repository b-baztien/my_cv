import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_cv/profile/profile.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
          key: key,
          title: 'Poomin Yennattee',
          home: ProfilePage(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Prompt',
            textTheme: TextTheme(
              headline1: GoogleFonts.prompt(
                fontSize: 106,
              ),
              headline2: GoogleFonts.prompt(
                fontSize: 66,
              ),
              headline3: GoogleFonts.prompt(
                fontSize: 53,
              ),
              headline4: GoogleFonts.prompt(
                fontSize: 38,
              ),
              headline5: GoogleFonts.prompt(
                fontSize: 27,
              ),
              headline6: GoogleFonts.prompt(
                fontSize: 22,
              ),
              subtitle1: GoogleFonts.prompt(
                fontSize: 18,
              ),
              subtitle2: GoogleFonts.prompt(
                fontSize: 15,
              ),
              bodyText1: GoogleFonts.prompt(
                fontSize: 18,
              ),
              bodyText2: GoogleFonts.prompt(
                fontSize: 15,
              ),
              button: GoogleFonts.prompt(
                fontSize: 15,
              ),
              caption: GoogleFonts.prompt(
                fontSize: 13,
              ),
              overline: GoogleFonts.prompt(
                fontSize: 11,
              ),
            ),
          ),
        );
}
