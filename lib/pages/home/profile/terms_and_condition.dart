import 'package:flutter/material.dart';
import 'package:wasa/widget/helpers/helpers.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('Terms and Condition', context, false),
      body: PolicyTextView(
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vitae nunc amet pulvinar mi in neque diam arcu. Mauris tellus orci est et amet quam facilisis. Vel aliquam accumsan, at amet, sed diam ullamcorper. Habitant dui odio vel adipiscing id pellentesque feugiat. Tortor gravida convallis viverra pretium urna vulputate tortor enim viverra. Porta egestas dui, mi lectus sit cras tortor dui.\nArcu est et vel faucibus morbi. Sed ut porttitor hendrerit non eget. Amet, scelerisque fermentum at aliquam. At at eu leo, arcu, aliquam lectus. Vitae curabitur pellentesque viverra eu nulla cursus elementum. Morbi urna orci et semper sit nec sed enim ut. ',
      ),
    );
  }
}
