import 'package:flutter/material.dart';
import 'package:wasa/config/theme/theme.dart';
import '../../../../config/utils/constant.dart';
import '../../../../widget/datatable_element/table_data.dart';
import '../../../../widget/helpers/helpers.dart';
import '../../../../widget/icon_text_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math';

class RetardDetailsScreen extends StatefulWidget {
  const RetardDetailsScreen({super.key});

  @override
  State<RetardDetailsScreen> createState() => _RetardDetailsScreenState();
}

class _RetardDetailsScreenState extends State<RetardDetailsScreen> {
  List<Map> myData = List.generate(10, (index) {
    // Génération aléatoire de données
    final randomDate = DateTime.now().add(Duration(days: Random().nextInt(30)));
    final randomHour = Random().nextInt(24);
    final randomMinute = Random().nextInt(60);
    final randomSecond = Random().nextInt(60);

    return {
      'id': index + 1,
      'firstrow': '${randomDate.year}-${randomDate.month}-${randomDate.day}',
      'secondrow': '$randomHour:$randomMinute:$randomSecond',
    };
  });

  int _currentSortColumn = 0;
  bool _isSortAsc = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar('Parent / enfant', context, true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Alignement à gauche
          children: [
            mainViewDivider(),
            SizedBox(
              height: kDefaultSpacing,
            ),
            IconTextRow(
              icon: Icons.arrow_right_outlined,
              text: AppLocalizations.of(context)!.incident_name,
            ),
            SizedBox(
              height: kDefaultSpacing,
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultSpacing),
              child: Container(
                width: double.infinity, // Prend toute la largeur disponible
                child: createDataTable(
                    AppLocalizations.of(context)!.jour_retard,
                    AppLocalizations.of(context)!.period,
                    myData),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
