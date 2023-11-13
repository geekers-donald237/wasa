import 'package:flutter/material.dart';
import '../config/utils/constant.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String hintText;
  final bool isPassword;

  CustomTextField({
    required this.icon,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kSmallerSpacing, bottom: kSmallerSpacing),
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Color(0x7AECEEF5),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Padding(
                    padding: const EdgeInsetsDirectional.only(end: 15.0),
                    child: Icon(
                      _obscureText
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Color(0xFF6C757D),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : Padding(
                  padding: const EdgeInsetsDirectional.only(end: 15.0),
                  child: Icon(
                    widget.icon,
                    color: Color(0xFF6C757D),
                  ),
                ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.0, // Ajustez la hauteur selon vos besoins
            horizontal: 25.0, // Ajustez la marge horizontale selon vos besoins
          ),
          filled: true,
          fillColor: Color(0x7AECEEF5), // Couleur de fond grise
        ),
        obscureText: widget.isPassword && _obscureText,
      ),
    );
  }
}
