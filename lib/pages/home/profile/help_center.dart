import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wasa/config/utils/constant.dart';
import 'package:wasa/widget/helpers/helpers.dart';

import '../../../widget/custom_textfield.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppbar('help Center', context, false),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(defaultSpacing),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HeaderWidget(
                text: 'help center',
              ),
              CustomTextField(
                icon: Icons.person,
                hintText: 'Full Name',
              ),
              CustomTextField(
                icon: Icons.email_outlined,
                hintText: 'Email',
              ),
              TextAreaWithLabel(
                labelText: 'Query ',
                controller: TextEditingController(),
                labelPositionIscentered: true,
              ),
              SizedBox(
                height: doubleSpacing,
              ),
              customSubmitBtn('Submit'),
            ],
          ),
        ),
      )),
    );
  }
}
