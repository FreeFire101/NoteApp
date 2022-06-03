import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_one/adv_ui_8ball/main_page.dart';
import 'package:flutter_one/flutter_mvvm/user_list/views_models/user_view_model.dart';
import 'package:flutter_one/localization/l10n.dart';
import 'package:flutter_one/note_app/provider/language_provider.dart';
import 'package:flutter_one/note_app/provider/note_provider.dart';
import 'package:flutter_one/responsive_ui/size_config.dart';
import 'package:flutter_one/theme/custom_theme.dart';
import 'package:flutter_one/theme/theme_provider.dart';
import 'package:flutter_one/weather_app/weather_service/weather_service.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'http_delete_method/http_delete_service.dart';
import 'provider_example/provider_class.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('bg message shown: ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high importance channel',
  'high importancce notificaitons',
  importance: Importance.high,
  playSound: true,
  description: 'this is the description',
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  //custom red error widget
  // ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) =>
  //     errorScreen(flutterErrorDetails.exception);
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
        ChangeNotifierProvider(
          create: (context) => AppLanguageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WeatherServiceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HttpDeleteService(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserViewModel(),
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
    final appLanguage = Provider.of<AppLanguageProvider>(context).language;
    final themeNotifier = Provider.of<ThemeProvider>(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              // showPerformanceOverlay: true,
              // showSemanticsDebugger: true,
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: themeNotifier.DarkTheme ? dark : light,
              supportedLocales: L10n.all,
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              locale: appLanguage,
              // theme: ThemeData(
              //   primarySwatch: Colors.blue,
              // ),
              // home: const MainPage(),
              home: const AdvPageMain(),
              // home: const ProviderExample(),
              // home: const MyErrorWidget(),
              // home: const NotePage(),
              // home: const WeatherHome(),
              // home: HttpPostHome(),
              // home: HttpDeletePage(),
              // home: const SqliteHome(),
            );
          },
        );
      },
    );
  }
}
