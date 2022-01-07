import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_cv/profile/bloc/profile_bloc.dart';
import 'package:my_cv/profile/commons/collapsing_navigation_drawer_widget.dart';
import 'package:my_cv/profile/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final birthday = DateTime(1996, 9, 17);
    final dateNow = DateTime.now();
    final difference = dateNow.difference(birthday).inDays;
    MediaQueryData media = MediaQuery.of(context);
    final double width = media.size.width;
    final double height = media.size.height;

    final bool isSmallScreen = width < 500;

    List<Widget> _listExperienceCard = [
      CustomWidget.experienceCard(
        context: context,
        title: 'จิตวิทยาเชิงบวก',
        subtitle: '2020',
        image: 'assets/images/hello-older.png',
        url: 'https://play.google.com/store/apps/details?id=com.helloolder.app',
        cardDetailWidgets: <Widget>[
          CustomWidget.cardDetails(
              context: context, text: 'Flutter, Dart', icon: Icons.code),
          CustomWidget.cardDetails(
              context: context,
              text: 'Available in google play store',
              icon: Icons.description),
        ],
      ),
    ];

    List<Widget> _listSkillCard = [
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/angular.png')),
          Text(
            'Angular',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/rxjs.png')),
          Text(
            'RxJs',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/nestjs.png')),
          Text(
            'NestJs',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/java.png')),
          Text(
            'Java',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/flutter.png')),
          Text(
            'Flutter',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/nx.png')),
          Text(
            'Nx',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/typescript.png')),
          Text(
            'Typescript',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/firebase.png')),
          Text(
            'Firebase',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/dart.png')),
          Text(
            'Dart',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
      Column(
        children: [
          Container(
              width: isSmallScreen ? 50 : 100,
              height: isSmallScreen ? 50 : 100,
              child: Image.asset('assets/images/skills/c#.png')),
          Text(
            'C#',
            style: isSmallScreen
                ? Theme.of(context).textTheme.bodyText1
                : Theme.of(context).textTheme.headline5,
          ),
        ],
      )
    ];

    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Material(
        child: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
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
                isSmallScreen
                    ? SizedBox.shrink()
                    : Expanded(
                        flex: 35,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/my-photo-light.png'),
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
                                            color: Colors.black,
                                            decoration: TextDecoration.none),
                                      ),
                                      AutoSizeText(
                                        'Frontend Developer',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.black,
                                            decoration: TextDecoration.none),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      color: Colors.black,
                                      iconSize: 30.0,
                                      icon: FaIcon(FontAwesomeIcons.facebook),
                                      tooltip: 'Facebook',
                                      onPressed: () => launch(
                                          'https://www.facebook.com/bas.poomin/'),
                                    ),
                                    IconButton(
                                      color: Colors.black,
                                      iconSize: 30.0,
                                      icon: FaIcon(FontAwesomeIcons.linkedin),
                                      tooltip: 'LinkedIn',
                                      onPressed: () => launch(
                                          'https://www.linkedin.com/in/poomin-yennattee/'),
                                    ),
                                    IconButton(
                                      color: Colors.black,
                                      iconSize: 30.0,
                                      icon: FaIcon(FontAwesomeIcons.github),
                                      tooltip: 'GitHub',
                                      onPressed: () => launch(
                                          'https://github.com/devilbas07'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
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
                                AutoSizeText('About me',
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                SizedBox(
                                  height: 20,
                                ),
                                AutoSizeText(
                                  (difference / 365).floor().toString() +
                                      ' years / Bangkok / Frontend Developer',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.merge(TextStyle(color: Colors.blue)),
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'I am interest in Software Developer whether it be Website Developer because I am interest in Development’s Technology which are widely, it is always make me learn in new thing, I am expert Object-Oriented Programing, I have many responsibility  and patient, I can work in groups and always respect opinions of others',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.merge(TextStyle(
                                        height: 2,
                                      )),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText('My skill',
                                    maxLines: 1,
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                SizedBox(
                                  height: 20,
                                ),
                                Theme(
                                  data: ThemeData.from(
                                    colorScheme: ColorScheme.fromSwatch(
                                      cardColor: Color(0xFFbbdefb),
                                      backgroundColor: Colors.blue,
                                    ),
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: isSmallScreen
                                          ? EdgeInsets.only(
                                              top: 30.0, bottom: 10.0)
                                          : EdgeInsets.only(
                                              top: 90.0,
                                              left: 50.0,
                                              right: 50.0,
                                              bottom: 10.0),
                                      child: StaggeredGridView.count(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        crossAxisCount: isSmallScreen ? 2 : 3,
                                        mainAxisSpacing:
                                            isSmallScreen ? 20 : 50.0,
                                        crossAxisSpacing:
                                            isSmallScreen ? 0 : 50.0,
                                        staggeredTiles: _listSkillCard
                                            .map((e) => StaggeredTile.fit(1))
                                            .toList(),
                                        children: _listSkillCard,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(
                                color: Colors.grey,
                              ),
                              AutoSizeText(
                                'Experience',
                                maxLines: 1,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              StaggeredGridView.extent(
                                maxCrossAxisExtent: 2,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                children: [
                                  new Container(
                                      color: Colors.green,
                                      child: new Center(
                                        child: new CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: new Text('1'),
                                        ),
                                      )),
                                ],
                              ),
                              Theme(
                                data: ThemeData.from(
                                  colorScheme: ColorScheme.fromSwatch(
                                    cardColor: Colors.blue,
                                    backgroundColor: Colors.blue,
                                  ),
                                ),
                                child: StaggeredGridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  crossAxisCount: isSmallScreen ? 1 : 2,
                                  mainAxisSpacing: 5.0,
                                  crossAxisSpacing: 5.0,
                                  staggeredTiles: _listExperienceCard
                                      .map((e) => StaggeredTile.fit(1))
                                      .toList(),
                                  children: _listExperienceCard,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
