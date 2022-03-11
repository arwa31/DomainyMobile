import 'package:flutter_application/models/category.dart';
import 'package:flutter_application/utils/he_color.dart';
import 'package:flutter/material.dart';

class CategoryCell extends StatelessWidget {
  final Category category;

  const CategoryCell({Key key, @required this.category}) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
              side: BorderSide(color: Colors.white),
            ),
          ),
        ),

        onPressed: () => {},

        // padding: const EdgeInsets.all(0.0),
        child: Container(
          height: 100,
          padding: const EdgeInsets.only(top: 5.0, bottom: 5),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: _imageSection(),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: Text(
                  category.title,
                  style: TextStyle(
                    color: HexColor('#010101'),
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Image Section
  Container _imageSection() {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/' + category.icon),
        ),
      ),
    );
  }
}
