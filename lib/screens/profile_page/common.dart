import 'package:flutter/material.dart';

class LabelTitle extends StatelessWidget {
  LabelTitle({Key? key,required this.title}) : super(key: key);
  late String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        child: Text(title,
          style: TextStyle(color: Colors.green,
          fontSize: 18,
          fontWeight: FontWeight.w300),

        ),
      ),
    );
  }
}

class CommonTextfield extends StatelessWidget {
  const CommonTextfield({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextField(
        // controller: titleController,
        onSubmitted: (value){
          // debugPrint('Textfield');
          // updateTitle();
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.green),
          ),
        ),
      ),
    );

  }
}

