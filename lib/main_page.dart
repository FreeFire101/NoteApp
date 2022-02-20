import 'package:flutter/material.dart';
import 'package:flutter_one/http_delete_method/http_delete_page.dart';
import 'package:flutter_one/note_app/pages/note_page.dart';
import 'package:flutter_one/settings/settings_page.dart';
import 'package:flutter_one/weather_app/weather_pages/weather_home.dart';
import 'package:flutter_one/youtube_video_list/youtube_video_list.dart';
import 'http_post_method/http_post_home.dart';
import 'provider_example/provider_eg.dart';
import 'responsive_ui/responsive_ui_page.dart';
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
                builder: (context) => SettingsPage(),
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
          ],
        ),
      ),
    );
  }
}
