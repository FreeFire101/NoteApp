import 'package:flutter/material.dart';
import 'package:flutter_one/note_app/pages/note_page.dart';
import 'package:flutter_one/note_app/provider/note_provider.dart';
import 'package:flutter_one/theme/custom_theme.dart';
import 'package:flutter_one/theme/theme_provider.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:provider/provider.dart';

import 'provider_example/provider_class.dart';
import 'provider_example/provider_eg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'widgets/custom_red_error.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //custom red error widget
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) =>
      errorScreen(flutterErrorDetails.exception);
  await Hive.initFlutter();
  var box = await Hive.openBox('note_box');
  var noteBox = await Hive.openBox('note_box1');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Counter(),
        ),
        ChangeNotifierProvider.value(
          value: ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoteProvider(),
        ),
      ],
      child: const MyApp(),
    ),
    // ChangeNotifierProvider(
    //   create: (context) => ThemeProvider(),
    //   builder: (context, child) {
    //     return MyApp();
    //   },
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.DarkTheme ? dark : light,
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              // ),
              // home:  const MainPage(),
              // home: const ResponsiveUiPage(),
              // home: const ProviderExample(),
              // home: const MyErrorWidget(),
              home: const NotePage(),
            );
          },
        );
      },
    );
  }
}
