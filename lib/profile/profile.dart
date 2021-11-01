import 'package:auto_size_text/auto_size_text.dart';
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
    final birthday = DateTime(1996, 9, 17);
    final dateNow = DateTime.now();
    final difference = dateNow.difference(birthday).inDays;
    MediaQueryData media = MediaQuery.of(context);

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
              media.size.width > 600
                  ? Expanded(
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
                          padding: const EdgeInsets.only(bottom: 50.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      'Poomin Yennattee',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                    AutoSizeText(
                                      'Frontend Developer',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 26,
                                          color: Colors.white,
                                          decoration: TextDecoration.none),
                                    ),
                                  ],
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
                    )
                  : SizedBox.shrink(),
              Expanded(
                flex: 60,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 40.0, bottom: 40.0, left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                'About me',
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40.0),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AutoSizeText(
                                (difference / 365).floor().toString() +
                                    ' years / Bangkok / Frontend Developer',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 24),
                                maxLines: 2,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                '''I'm an Angular Google Developer Expert and I'm a big advocate of this framework. I use it for my personal projects as well as my work and I contribute to its open-source ecosystem (see projects below).
I'm a huge music fan and a musician myself. Naturally I often combine my hobbies as music apps or tools. I believe Web is one of the most exciting areas to work in because of how feature rich and multimedia it is.
I have two children and my wife and I are Montessori enthusiasts.''',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1000,
                          color: Colors.blue,
                        ),
                        Container(
                          height: 1000,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
