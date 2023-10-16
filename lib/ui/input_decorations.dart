import 'package:flutter/material.dart';

class InputDecorations {

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData ? prefixIcon

  }){
    return  InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF820091)
        )
      ),
      focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF00A6FF),
        width: 1 //px
        )
      ),
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon != null ? Icon( prefixIcon, color: const Color(0xFFFFFFFF) ) : null,
      labelStyle: TextStyle(
        color: Colors.blueGrey.shade600,
        fontSize: 14
      )
    );

  }


}