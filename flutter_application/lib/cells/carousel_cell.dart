class CarouselModel {
  String image;
  CarouselModel(this.image);
}

List<CarouselModel> carousels = carouselsData
    .map((item) => CarouselModel(item['image'].toString()))
    .toList();

var carouselsData = [
  {"image": "assets/images/publicite6.png"},
  {"image": "assets/images/publicite4.png"},
  {"image": "assets/images/publicite3.png"},
];
