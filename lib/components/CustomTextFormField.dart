// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({Key? key,required this.textController,required this.hintText,required this.errorText,required this.icons}) : super(key: key);
  TextEditingController textController;
  String hintText;
  String errorText;
  IconData icons;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          filled: true,

          fillColor: const Color(0xD8DBD7FA) ,
          hintText: hintText,
          prefixIcon: Icon(icons ,color: Colors.deepPurple,),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: const BorderSide(
              color: Color(0xD8DBD7FA),

            ),

          ),


        ),
        validator: (value){
          if(value==null || value.isEmpty) {
            return errorText;
          }
          return null ;
        },

      ),
    );
  }
}
