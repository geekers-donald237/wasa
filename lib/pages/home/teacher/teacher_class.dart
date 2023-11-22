import 'package:flutter/material.dart';
import 'package:wasa/config/utils/constant.dart';

import '../../../widget/helpers/helpers.dart';

class TeacherClass extends StatefulWidget {
  const TeacherClass({super.key});

  @override
  State<TeacherClass> createState() => _TeacherClassState();
}

class _TeacherClassState extends State<TeacherClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customTeacherAppbar('Enseignant / classe', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YourContainer(
              numero: '1',
              classe: '5e',
              date: '23 /07 /2023',
            ),
            SizedBox(
              height: kDefaultSpacing,
            ),
            YourContainer(
              numero: '2',
              classe: '6e',
              date: '13 /02 /2023',
            ),
            SizedBox(
              height: kDefaultSpacing,
            ),
            YourContainer(
              numero: '3',
              classe: 'Tle',
              date: '13 /02 /2023',
            ),
          ],
        ),
      ),
    );
  }
}
