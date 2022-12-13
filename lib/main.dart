import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:regexpo/src/app/style/app_theme_data.dart';
import 'package:regexpo/src/blocs/bloc_wrapper.dart';
import 'package:regexpo/src/blocs/blocs.dart';
import 'src/blocs/bloc_relation.dart';

import 'src/views/desk_ui/splash/splash_page.dart';

void main() {
  runApp(const BlocWrapper(child:  MyApp()));
  if(Platform.isMacOS||Platform.isWindows||Platform.isLinux){
    DesktopWindow.setWindowSize(const Size(900, 600));
    DesktopWindow.setMinWindowSize(const Size(600, 400));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = context.select<AppConfigBloc, ThemeMode>(
          (value) => value.state.themeMode,
    );
    return BlocRelation(
      child: MaterialApp(
        title: 'regexpo',
        debugShowCheckedModeBanner: false,
        themeMode: mode,
        theme: AppThemeData.light,
        darkTheme:  AppThemeData.dark,
        home: const SplashPage(),
      ),
    );
  }
}
