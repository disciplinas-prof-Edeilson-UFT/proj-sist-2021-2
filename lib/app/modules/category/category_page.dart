import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/global/widgets/bottom_appp_bar/bottom_app_bar_mobile.dart';
//import 'package:pscomidas/app/modules/category/custom_category.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_grid.dart';


class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  final itemKey = GlobalKey();
  Future scrollToItem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(context,
        //alignment: 1,
        duration: Duration(seconds: 1));
  }

  final secondItemKey = GlobalKey();
  Future SecondScrollToItem() async {
    final context = secondItemKey.currentContext!;
    await Scrollable.ensureVisible(context, duration: Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        //MediaQuery.of(context).size.width * 0.1 ,
        //< 200 ? 200: MediaQuery.of(context).size.width * 0.1
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: ScrollController(initialScrollOffset: 0.0),
              scrollDirection: Axis.horizontal,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        key: secondItemKey,
                        child: CategoryCard(
                            image: "assets/category/acai.png",
                            category: 'Açaí')),
                    CategoryCard(
                        image: "assets/category/hamburger.png",
                        category: 'Lanches'),
                    CategoryCard(
                        image: "assets/category/bread.png",
                        category: 'Padarias'),
                    CategoryCard(
                        image: "assets/category/pizza.png",
                        category: 'Pizza'),
                    CategoryCard(
                        image: "assets/category/healthy.png",
                        category: 'Saudável'),
                    CategoryCard(
                        image: "assets/category/cake.png",
                        category: 'Bolos e Doces'),
                    Container(
                        key: itemKey,
                        child: CategoryCard(
                            image: "assets/category/drinks.png",
                            category: 'Bebidas')),
                    CategoryCard(
                        image: "assets/category/vegetarian.png",
                        category: 'Vegetariana'),
                    CategoryCard(
                        image: "assets/category/italian.png",
                        category: 'Italiana'),
                    CategoryCard(
                        image: "assets/category/icecream.png",
                        category: 'Sorvetes'),
                  CategoryCard(
                        image: "assets/category/asian.png",
                        category: 'Asiática'),
                  ]),
                  
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Image.asset(
                  "assets/category/right.png",
                  width: 30,
                ),
                onTap: () => scrollToItem(),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: Image.asset(
                  "assets/category/left.png",
                  width: 30,
                ),
                onTap: () => SecondScrollToItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryInside extends StatelessWidget {
   CategoryInside({Key? key, this.categoryName}) : super(key: key);
  final String? categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      
      body: 
       
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text(
                categoryName!,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            RestaurantGrid(CategoryField: categoryName),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarButton(),
    );
  }
}
//Text(categoryName!)

class CategoryCard extends StatefulWidget {
  CategoryCard({Key? key, this.image, this.category}) : super(key: key);

  @override
  _State createState() => _State();
  late final image;
  late final String? category;
  double _width = 200;
  double _height = 200;
}

class _State extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    void _updateState(_isHovering) {
      if (_isHovering) {
        setState(() {
          widget._width = 230;
        });
      } else {
        setState(() {
          widget._width = 200;
        });
      }
    }

    return AnimatedContainer(
      width: widget._width,
      height: widget._height,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceOut,
      child: Column(children: [
        MouseRegion(
          //image como botão para Filtros
          cursor: SystemMouseCursors.click,
          child: InkWell(
            child: Image.asset(
              widget.image,
              width: widget._width,

              // MediaQuery.of(context).size.width * 0.12,
            ),
            onTap: () {
             
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  CategoryInside(categoryName: widget.category)),
              );
            },
            onHover: (_isHovering) {
              _updateState(_isHovering);
            },
            hoverColor: Colors.transparent,
          ),
        ),
        Text(widget.category!)
      ]),
    );
  }
}
