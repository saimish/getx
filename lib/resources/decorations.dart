import 'package:flutter/material.dart';
import 'package:pikipedia/resources/resources.dart';

class AppDecorations {
  InputDecoration appFieldDecoration(
    Widget? suffIcon,
    String label,
    String hintText,
  ) {
    return InputDecoration(
      suffixIcon: suffIcon,

      isDense: true,
      labelStyle: R.textStyle.semiBoldPoppins(),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 1, color: Colors.grey),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 1, color: Colors.grey),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        borderSide: BorderSide(width: 1, color: Colors.grey),
      ),
      border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(8))),
      filled: false,
      // fillColor: R.colors.fieldFillColor,
      hintText: hintText,

      hintStyle: R.textStyle.mediumPoppins().copyWith(color: Colors.grey[500]),

      //  border: OutlineInputBorder()
    );
  }

  InputDecoration appFieldDecoration2(
    String hintText,
  ) {
    return InputDecoration(
      prefixIcon: const Icon(Icons.search),
      isDense: true,
      contentPadding: const EdgeInsets.only(top: 12),
      focusedBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      border: InputBorder.none,
      filled: false,
      // fillColor: R.colors.fieldFillColor,
      hintText: hintText,

      hintStyle: R.textStyle.mediumPoppins(),

      //  border: OutlineInputBorder()
    );
  }
}
