import 'package:flutter/material.dart';
import 'package:wasa/config/theme/theme.dart';

import '../../../widget/helpers/helpers.dart';
import '../../../widget/student_info_details.dart';

class TeacherStudentsList extends StatefulWidget {
  const TeacherStudentsList({super.key});

  @override
  State<TeacherStudentsList> createState() => _TeacherStudentsListState();
}

class _TeacherStudentsListState extends State<TeacherStudentsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customTeacherAppbar('Enseignant / classe / eleves', context),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            6,
            (index) => NumberTextWidgetFAQ(
              number: (index + 1)
                  .toString(), // Utilisez l'index de la boucle + 1 comme numéro
              text: 'Nyadjou',
              color: AppStyle.kGreen,
            ),
          ),
        ),
      ),
    );
  }
}
