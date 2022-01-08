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

    final bool isSmallScreen = width <= 512;
    final bool isMediumScreen = width <= 1024;
    final bool isLargeScreen = width > 1024;

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
      CustomWidget.skillCard(
          context: context,
          title: 'Angular',
          image: 'assets/images/skills/angular.png'),
      CustomWidget.skillCard(
          context: context,
          title: 'RxJs',
          image: 'assets/images/skills/rxjs.png'),
      CustomWidget.skillCard(
          context: context,
          title: 'NestJs',
          image: 'assets/images/skills/nestjs.png'),
      CustomWidget.skillCard(
          context: context,
          title: 'Java',
          image: 'assets/images/skills/java.png'),
      CustomWidget.skillCard(
          context: context,
          title: 'Flutter',
          image: 'assets/images/skills/flutter.png'),
      CustomWidget.skillCard(
          context: context, title: 'Nx', image: 'assets/images/skills/nx.png'),
      CustomWidget.skillCard(
          context: context,
          title: 'Typescript',
          image: 'assets/images/skills/typescript.png'),
      CustomWidget.skillCard(
          context: context,
          title: 'Firebase',
          image: 'assets/images/skills/firebase.png'),
      CustomWidget.skillCard(
          context: context,
          title: 'Dart',
          image: 'assets/images/skills/dart.png'),
      CustomWidget.skillCard(
          context: context, title: 'C#', image: 'assets/images/skills/c#.png'),
    ];

    Widget _listIconProfile = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 30.0,
          icon: FaIcon(FontAwesomeIcons.facebook),
          tooltip: 'Facebook',
          onPressed: () => launch('https://www.facebook.com/bas.poomin/'),
        ),
        IconButton(
          iconSize: 30.0,
          icon: FaIcon(FontAwesomeIcons.linkedin),
          tooltip: 'LinkedIn',
          onPressed: () =>
              launch('https://www.linkedin.com/in/poomin-yennattee/'),
        ),
        IconButton(
          iconSize: 30.0,
          icon: FaIcon(FontAwesomeIcons.github),
          tooltip: 'GitHub',
          onPressed: () => launch('https://github.com/devilbas07'),
        ),
        IconButton(
          iconSize: 30.0,
          icon: FaIcon(FontAwesomeIcons.fileDownload),
          tooltip: 'Resume',
          onPressed: () => launch(
              'https://github.com/devilbas07/my_cv/raw/master/assets/files/POOMIN_RESUME_ENG.pdf'),
        ),
      ],
    );

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
                // Stack(
                //   children: <Widget>[
                //     Container(
                //       color: Color(0xFF4AC8EA),
                //     ),
                //     CollapsingNavigationDrawer()
                //   ],
                // ),
                if (isLargeScreen)
                  Expanded(
                    flex: 35,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                          image: AssetImage('assets/images/my-photo-light.png'),
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
                                        decoration: TextDecoration.none),
                                  ),
                                  AutoSizeText(
                                    'Frontend Developer',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 26,
                                        decoration: TextDecoration.none),
                                  ),
                                ],
                              ),
                            ),
                            _listIconProfile
                          ],
                        ),
                      ),
                    ),
                  ),
                Expanded(
                  flex: 60,
                  child: Scaffold(
                    body: NestedScrollView(
                      headerSliverBuilder:
                          (BuildContext context, bool innerBoxIsScrolled) =>
                              <Widget>[
                        if (isMediumScreen)
                          SliverAppBar(
                            pinned: true,
                            floating: false,
                            elevation: 0,
                            backgroundColor: Colors.white,
                            expandedHeight:
                                isMediumScreen ? height / 1.7 : height / 2,
                            automaticallyImplyLeading: false,
                            flexibleSpace: FlexibleSpaceBar(
                              collapseMode: CollapseMode.parallax,
                              background: ShaderMask(
                                shaderCallback: (rect) {
                                  return LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black, Colors.transparent],
                                  ).createShader(Rect.fromLTRB(
                                      0, rect.height / 1.5, 0, rect.height));
                                },
                                blendMode: BlendMode.dstIn,
                                child: Image.asset(
                                  'assets/images/my-photo-light.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            bottom: PreferredSize(
                              preferredSize: const Size.fromHeight(50.0),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15.0),
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      'Poomin Yennattee',
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontSize: 30,
                                          decoration: TextDecoration.none),
                                    ),
                                    _listIconProfile,
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                      body: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 40.0, bottom: 30.0, left: 20.0, right: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText('About me',
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    AutoSizeText(
                                      (difference / 365).floor().toString() +
                                          ' years / Bangkok / Frontend Developer',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5
                                          ?.merge(
                                              TextStyle(color: Colors.blue)),
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
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: isMediumScreen
                                              ? EdgeInsets.only(
                                                  top: 30.0, bottom: 10.0)
                                              : EdgeInsets.only(
                                                  top: 90.0,
                                                  left: 50.0,
                                                  right: 50.0,
                                                  bottom: 10.0),
                                          child: StaggeredGridView.count(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            crossAxisCount:
                                                isSmallScreen ? 2 : 3,
                                            mainAxisSpacing:
                                                isSmallScreen ? 20 : 50.0,
                                            crossAxisSpacing:
                                                isSmallScreen ? 0 : 50.0,
                                            staggeredTiles: _listSkillCard
                                                .map(
                                                    (e) => StaggeredTile.fit(1))
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
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  SizedBox(
                                    height: 20,
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
