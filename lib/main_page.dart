import 'package:flutter/material.dart';
import 'package:flutter_one/custom_circular_progress/custom_circular_progress.dart';
import 'package:flutter_one/flutter_mvvm/mvvm_home.dart';
import 'package:flutter_one/http_delete_method/http_delete_page.dart';
import 'package:flutter_one/isolate_example/isolate_example.dart';
import 'package:flutter_one/note_app/pages/note_page.dart';
import 'package:flutter_one/settings/settings_page.dart';
import 'package:flutter_one/weather_app/weather_pages/weather_home.dart';
import 'package:flutter_one/youtube_video_list/youtube_video_list.dart';
import 'http_post_method/http_post_home.dart';
import 'provider_example/provider_eg.dart';
import 'responsive_ui/responsive_ui_page.dart';
import 'screen_utils_testing/screen_utils_testing.dart';
import 'sqlite/sqlite_pages/sqlite_home.dart';
import 'widgets/error_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Apps'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            ),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotePage(),
                  ),
                );
              },
              child: const Text('Note App'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeatherHome(),
                  ),
                );
              },
              child: const Text('Weather App'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const YoutubeVideoList(),
                  ),
                );
              },
              child: const Text('Youtube Videos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResponsiveUiPage(),
                  ),
                );
              },
              child: const Text('Responsive Ui Page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProviderExample(),
                  ),
                );
              },
              child: const Text('Provider Example'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyErrorWidget(),
                  ),
                );
              },
              child: const Text('Error Widget Test'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HttpPostHome(),
                  ),
                );
              },
              child: const Text('Http Post Method'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HttpDeletePage(),
                  ),
                );
              },
              child: const Text('Http Delete Method'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SqliteHome(),
                  ),
                );
              },
              child: const Text('Sqlite'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MvvmHome(),
                  ),
                );
              },
              child: const Text('Flutter MVVM'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenUtilsTesting(),
                  ),
                );
              },
              child: const Text('Screen Utils Testing'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CustomCircularProgress(),
                  ),
                );
              },
              child: const Text('Custom Circular Progress Indicator'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IsolateExample(),
                  ),
                );
              },
              child: const Text('Isolate/Compute Example'),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(left: 28.0),
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(right: 28.0),
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(left: 28.0),
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 20.0,
              padding: const EdgeInsets.only(right: 28.0),
              icon: const Icon(Icons.list),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
