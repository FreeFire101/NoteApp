import 'package:flutter/material.dart';
import 'package:flutter_one/adv_ui_8ball/components/magic_8_ball.dart';
import 'package:flutter_one/adv_ui_8ball/components/sphere_of_destiny.dart';

import 'components/rules_of_oracle.dart';

class AdvPageMain extends StatefulWidget {
  const AdvPageMain({Key? key}) : super(key: key);

  @override
  State<AdvPageMain> createState() => _AdvPageMainState();
}

class _AdvPageMainState extends State<AdvPageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The MAGIC 8-Ball'),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: const [
            // SphereOfDestiny(diameter: 200),
            Magic8Ball(),
            Expanded(
              child: RulesOfTheOracle(),
            )
          ],
        ),
      ),
    );
  }
}
