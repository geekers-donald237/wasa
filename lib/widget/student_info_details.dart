import 'package:flutter/material.dart';

import '../config/theme/theme.dart';
import '../config/utils/constant.dart';
import '../config/utils/custom_dialog.dart';
import 'helpers/helpers.dart';

class NumberTextWidget extends StatelessWidget {
  final String number;
  final String text;
  final Color color;

  NumberTextWidget({
    required this.number,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultSpacing),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 2, // Ajustez la hauteur selon vos besoins
            decoration: BoxDecoration(
              color: Colors.blue, // Couleur de fond bleue
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90.0), // Bordure en haut à gauche
                topRight: Radius.circular(90.0), // Bordure en haut à droite
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFF6F7FA),
            ),

            width: double.infinity,
            // height: 250,
            padding: EdgeInsets.all(
                16), // Espace entre les bords du container et les éléments internes

            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Espace automatique entre les éléments de la colonne
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30), // Bordure
                            border: Border.all(
                              color: AppStyle
                                  .kTransparent, // Couleur de la bordure
                              width: 2, // Largeur de la bordure (2 pixels)
                            ),
                            color: color,
                          ),
                          child: Center(
                            child: Text(
                              number,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: kDefaultSpacing,
                        ),
                        Text(
                          text,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF757D85),
                            fontSize: 14,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                        color: color, // Couleur de fond rouge
                        borderRadius: BorderRadius.circular(5), // Bordure de 10
                      ),
                      child: Center(
                        child: Text(
                          'See More',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NumberTextWidgetFAQ extends StatefulWidget {
  final String number;
  final String text;
  final Color color;

  NumberTextWidgetFAQ({
    required this.number,
    required this.text,
    required this.color,
  });

  @override
  _NumberTextWidgetFAQState createState() => _NumberTextWidgetFAQState();
}

class _NumberTextWidgetFAQState extends State<NumberTextWidgetFAQ> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultSpacing),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90.0),
                topRight: Radius.circular(90.0),
              ),
            ),
          ),
          ExpansionPanelList(
            elevation: 1,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: AppStyle.kTransparent,
                                  width: 2,
                                ),
                                color: widget.color,
                              ),
                              child: Center(
                                child: Text(
                                  widget.number,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontFamily: 'Work Sans',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: kDefaultSpacing,
                            ),
                            Text(
                              widget.text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF757D85),
                                fontSize: 14,
                                fontFamily: 'Work Sans',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            showRemarqModal(context);
                          },
                          child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Remarque',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(kDefaultSpacing),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppStyle.kDefaultColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppStyle.kgreyToWhite,
                        ),
                        padding: EdgeInsets.all(kDefaultSpacing),
                        child: Column(
                          children: [
                            InfoRow(
                              label: 'Numero',
                              value: Text('121212'),
                            ),
                            InfoRow(
                              label: 'Nom',
                              value: Text(
                                'Nyadjou',
                                style: TextStyle(
                                  color: Color(0xFF3BA859),
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            InfoRow(
                              label: 'Prenom',
                              value: Text(
                                'Lucie Danielle',
                                style: TextStyle(
                                  color: Color(0xFF3BA859),
                                  fontSize: 14,
                                  fontFamily: 'Work Sans',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            InfoRow(
                              label: 'Age',
                              value: Text('19'),
                            ),
                            InfoRow(
                              label: 'Sexe',
                              value: Text('Feminin'),
                            ),
                            InfoRow(
                              label: 'Niveau',
                              value: Text('1 ere'),
                            ),
                            InfoRow(
                              label: 'Classe',
                              value: Text('1 ere All'),
                            ),
                            InfoRow(
                              label: 'Nationalite',
                              value: Text('Camerounaise'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppStyle.kDefaultColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50.0),
                            bottomRight: Radius.circular(50.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                isExpanded: _isExpanded,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
