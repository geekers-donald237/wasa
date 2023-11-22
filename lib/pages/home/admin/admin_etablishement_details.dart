import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/utils/custom_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../config/utils/localfiles.dart';
import '../../../widget/helpers/helpers.dart';

class AdminDetailsScreen extends StatelessWidget {
  const AdminDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('admin / wiew', context, false),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildAdminContainer(
                context, 'Eleves', '21', 'Voir plus', Localfiles.horloge),
            buildAdminContainer(
                context, 'Niveau', '21', 'Voir plus', Localfiles.horloge),
            buildAdminContainer(
                context, 'MAtiere', '21', 'Voir plus', Localfiles.horloge),
          ],
        ),
      ),
    );
  }
}
