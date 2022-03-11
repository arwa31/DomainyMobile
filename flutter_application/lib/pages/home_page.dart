import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter_application/cells/category_cell.dart';
import 'package:flutter_application/cells/trProvider_cell.dart';
import 'package:flutter_application/models/provider.dart';
import 'package:flutter_application/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';

import '../models/service.dart';
import '../models/category.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Category> _categories = List<Category>();
  List<Service> _services = List<Service>();
  List<Category> _categories2 = List<Category>();
  List<Provider> _trProviders = List<Provider>();
  final _controller = TextEditingController();

  /// **********************************************
  /// ACTIONS
  /// **********************************************

  _onCellTap(Provider provider) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(provider: provider),
        ));
  }

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  void initState() {
    super.initState();
    _categories = _getCategories();
    for (var i = _categories.length ~/ 2; i < _categories.length; i++) {
      _categories2.add(_categories[i]);
    }
    _trProviders = _getTRProviders();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.white)),
        child: CurvedNavigationBar(
          color: Color(0xFF008C83),
          backgroundColor: Colors.transparent,
          height: 60,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 25,
            ),
            Icon(Icons.message, size: 25),
            Icon(Icons.favorite, size: 25),
            Icon(Icons.notifications, size: 25),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            _SearchSection(),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categorySection(),
                  SizedBox(
                    height: 20,
                  ),
                  _trProviderSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      elevation: 0,
      toolbarHeight: 100,
      // profil photo + nom + hello
      flexibleSpace: Container(
        margin: EdgeInsets.only(left: 40, top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 19),
                  child: Text(
                    'Hello',
                    style: TextStyle(fontSize: 19, color: Colors.grey),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Arwa',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image(
                      width: 25,
                      height: 25,
                      image: AssetImage('assets/images/salutImage.jpg'),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 20),
              child: CircleAvatar(
                radius: 18,
                // Image radius
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/564x/10/b9/36/10b93635bf4cb048f8bc52fbfe7c2316.jpg'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _SearchSection() {
    return Column(children: [
      Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        width: 310,
        height: 43,
        margin: EdgeInsets.only(left: 25, bottom: 20),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.zero,
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(500.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(500.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(500.0),
                ),
                hintText: 'Search',
                prefixIcon: Icon(
                  FontAwesome5.search,
                  size: 25,
                  color: Colors.grey,
                ),
                suffixIcon: ClipOval(
                  child: Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/settings.png'))),
                    child: FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {},
                      child: null,
                    ),
                  ),
                )),
          ),
        ),
      ),
    ]);
  }

  /// Category Section
  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Categories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'View all',
              style: TextStyle(
                color: Color.fromARGB(255, 181, 181, 184),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories.length ~/ 2,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) =>
                CategoryCell(category: _categories[index]),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 40,
          child: ListView.separated(
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _categories2.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(indent: 16),
            itemBuilder: (BuildContext context, int index) =>
                CategoryCell(category: _categories2[index]),
          ),
        ),
      ],
    );
  }

  /// Top fournisseurs
  Column _trProviderSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Top Rated provider',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'View all',
              style: TextStyle(
                color: Color.fromARGB(255, 181, 181, 184),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        _trSection(),
      ],
    );
  }

  /// **********************************************
  /// DUMMY DATA
  /// **********************************************
//Get Services
  List<Service> _getServices() {
    List<Service> _services = List<Service>();
    _services.add(Service(
      imageServ: 'art.png',
      title: 'Art',
    ));
    _services.add(Service(
      imageServ: 'art.png',
      title: 'Bebe',
    ));
    _services.add(Service(
      imageServ: 'art.png',
      title: 'Yooo',
    ));
    return _services;
  }

  /// Get Categories
  List<Category> _getCategories() {
    List<Category> categories = List<Category>();

    categories.add(Category(
      icon: 'art.png',
      title: 'Art',
    ));
    categories.add(Category(
      icon: 'marketin.png',
      title: 'Marketing',
    ));
    categories.add(Category(
      icon: 'loisir.png',
      title: 'leisure',
    ));
    categories.add(Category(
      icon: 'education.png',
      title: 'Education',
    ));

    categories.add(Category(
      icon: 'medical.png',
      title: 'Medical',
    ));
    categories.add(Category(
      icon: 'business.png',
      title: 'Business',
    ));
    categories.add(Category(
      icon: 'coding.png',
      title: 'Coding',
    ));
    categories.add(Category(
      icon: 'design.png',
      title: 'Design',
    ));

    return categories;
  }

  /// Get Top Rated Doctors List
  List<Provider> _getTRProviders() {
    List<Provider> trProvider = List<Provider>();

    trProvider.add(Provider(
      firstName: 'Idris',
      lastName: 'Mohamed',
      image: 'livreur.jpg',
      metier: 'Delivery Man',
      localisation: 'Sousse',
      rating: 4.9,
    ));
    trProvider.add(Provider(
        firstName: 'Trabelsi',
        lastName: 'Khalid',
        image: 'dentiste.jpg',
        metier: 'Dentiste',
        localisation: 'Bizerte',
        rating: 4.7));

    trProvider.add(Provider(
      firstName: 'Bouzidi',
      lastName: 'Hanen',
      image: 'artiste.jpg',
      metier: 'Artist',
      localisation: 'Aouina',
      rating: 4.6,
    ));

    return trProvider;
  }

  SizedBox _trSection() {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 4),
        itemCount: _trProviders.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(indent: 16),
        itemBuilder: (BuildContext context, int index) => trProvider(
          provider: _trProviders[index],
          onTap: () => _onCellTap(_trProviders[index]),
        ),
      ),
    );
  }
}
