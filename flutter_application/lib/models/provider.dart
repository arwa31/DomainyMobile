import 'package:meta/meta.dart';

class Provider {
  final String firstName;
  final String lastName;
  final String image;
  final String metier;
  final String localisation;
  final double rating;

  Provider({
    @required this.firstName,
    @required this.lastName,
    @required this.image,
    @required this.metier,
    @required this.localisation,
    @required this.rating,
  });
}
