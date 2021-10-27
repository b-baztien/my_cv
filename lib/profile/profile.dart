import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_cv/profile/bloc/profile_bloc.dart';
import 'package:my_cv/profile/commons/collapsing_navigation_drawer_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: Container(
        child: Row(
          children: [
            Flexible(
                flex: 5,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Color(0xFF4AC8EA),
                    ),
                    CollapsingNavigationDrawer()
                  ],
                )),
            Flexible(
              flex: 35,
              child: Container(
                height: 100,
                color: Colors.red,
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
    );
  }
}
