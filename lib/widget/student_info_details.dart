import 'package:flutter/material.dart';

import '../config/theme/theme.dart';
import '../config/utils/constant.dart';

class NumberTextWidget extends StatelessWidget {
  final String number;
  final String text;

  NumberTextWidget({required this.number, required this.text});

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
                            color: Color(0xFFFF5757),
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
                        color: Color(0xFFFF5757), // Couleur de fond rouge
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
