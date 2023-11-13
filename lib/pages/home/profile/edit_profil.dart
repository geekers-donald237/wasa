import 'package:flutter/material.dart';
import 'package:wasa/widget/helpers/helpers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/utils/constant.dart';
import '../../../widget/custom_textfield.dart';

class EditProfilScreen extends StatefulWidget {
  const EditProfilScreen({super.key});

  @override
  State<EditProfilScreen> createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: customAppbar('Profile', context, false),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultSpacing),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                HeaderWidget(
                  text: 'edit profile',
                ),
                CustomTextField(
                  icon: Icons.person,
                  hintText: 'Username',
                ),
                CustomTextField(
                  icon: Icons.person,
                  hintText: 'Lastname',
                ),
                CustomTextField(
                  icon: Icons.email_outlined,
                  hintText: 'Email',
                ),
                CustomTextField(
                  icon: Icons.phone,
                  hintText: 'Mobile Number',
                ),
                CustomTextField(
                  icon: Icons.location_on_outlined,
                  hintText: AppLocalizations.of(context)!.adr_field,
                ),
                SizedBox(
                  height: kDefaultSpacing,
                ),
                customSubmitBtn('Update'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
