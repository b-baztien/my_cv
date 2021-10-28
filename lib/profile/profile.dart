import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cv/profile/bloc/profile_bloc.dart';
import 'package:my_cv/profile/commons/collapsing_navigation_drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Material(
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: <Widget>[
                  Container(
                    color: Color(0xFF4AC8EA),
                  ),
                  CollapsingNavigationDrawer()
                ],
              ),
              Expanded(
                flex: 35,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: AssetImage('assets/images/my-photo.jpg'),
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.center,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 150.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text(
                            'Poomin Yennattee',
                            textScaleFactor: 3.5,
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              color: Colors.white,
                              iconSize: 30.0,
                              icon: FaIcon(FontAwesomeIcons.facebook),
                              tooltip: 'Facebook',
                              onPressed: () => launch(
                                  'https://www.facebook.com/bas.poomin/'),
                            ),
                            IconButton(
                              color: Colors.white,
                              iconSize: 30.0,
                              icon: FaIcon(FontAwesomeIcons.linkedin),
                              tooltip: 'LinkedIn',
                              onPressed: () => launch(
                                  'https://www.linkedin.com/in/poomin-yennattee/'),
                            ),
                            IconButton(
                              color: Colors.white,
                              iconSize: 30.0,
                              icon: FaIcon(FontAwesomeIcons.github),
                              tooltip: 'GitHub',
                              onPressed: () =>
                                  launch('https://github.com/devilbas07'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 60,
                child: Container(
                  height: 100,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
