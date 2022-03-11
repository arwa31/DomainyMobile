import 'package:flutter_application/models/provider.dart';
import 'package:flutter_application/utils/custom_icons_icons.dart';
import 'package:flutter_application/utils/he_color.dart';
import 'package:flutter/material.dart';

class trProvider extends StatelessWidget {
  final Provider provider;
  final Function onTap;

  const trProvider({
    Key key,
    @required this.onTap,
    @required this.provider,
  }) : super(key: key);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 200,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              color: HexColor('#404B63').withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imageSection(),
              SizedBox(
                height: 6,
              ),
              _detailsSection(),
            ],
          ),
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// Image Section
  Container _imageSection() {
    return Container(
      width: 110,
      height: 110,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage('assets/images/' + provider.image),
        ),
      ),
    );
  }

  /// Details Section
  Column _detailsSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          provider.firstName + ' ' + provider.lastName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          provider.metier,
          style: TextStyle(
            color: HexColor('#929BB0'),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          provider.localisation,
          style: TextStyle(
            color: HexColor('#929BB0'),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              provider.rating.toString(),
              style: TextStyle(
                color: HexColor('#929BB0'),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Icon(
              CustomIcons.star,
              color: HexColor('#FFBB23'),
              size: 14,
            ),
            Icon(
              CustomIcons.star,
              color: HexColor('#FFBB23'),
              size: 14,
            ),
            Icon(
              CustomIcons.star,
              color: HexColor('#FFBB23'),
              size: 14,
            ),
          ],
        ),
      ],
    );
  }
}
