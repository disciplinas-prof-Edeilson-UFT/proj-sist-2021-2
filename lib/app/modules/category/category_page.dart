import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';
import 'package:pscomidas/app/global/widgets/bottom_app_bar/bottom_app_bar_mobile.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_grid.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  final itemKey = GlobalKey();
  Future scrollToItem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
    );
  }

  final secondItemKey = GlobalKey();
  Future secondScrollToItem() async {
    final context = secondItemKey.currentContext!;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 140,
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
                    child: const CategoryCard(
                      image: "assets/images/category/acai.png",
                      category: 'Açaí',
                    ),
                  ),
                  const CategoryCard(
                    image: "assets/images/category/hamburger.png",
                    category: 'Lanches',
                  ),
                  const CategoryCard(
                    image: "assets/images/category/bread.png",
                    category: 'Padarias',
                  ),
                  const CategoryCard(
                    image: "assets/images/category/pizza.png",
                    category: 'Pizza',
                  ),
                  const CategoryCard(
                    image: "assets/images/category/healthy.png",
                    category: 'Saudável',
                  ),
                  const CategoryCard(
                    image: "assets/images/category/cake.png",
                    category: 'Bolos e Doces',
                  ),
                  Container(
                    key: itemKey,
                    child: const CategoryCard(
                      image: "assets/images/category/drinks.png",
                      category: 'Bebidas',
                    ),
                  ),
                  const CategoryCard(
                    image: "assets/images/category/vegetarian.png",
                    category: 'Vegetariana',
                  ),
                  const CategoryCard(
                    image: "assets/images/category/italian.png",
                    category: 'Italiana',
                  ),
                  const CategoryCard(
                    image: "assets/images/category/icecream.png",
                    category: 'Sorvetes',
                  ),
                  const CategoryCard(
                    image: "assets/images/category/asian.png",
                    category: 'Asiática',
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Image.asset(
                  "assets/images/category/right.png",
                  width: 30,
                ),
                onTap: () => scrollToItem(),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                child: Image.asset(
                  "assets/images/category/left.png",
                  width: 30,
                ),
                onTap: () => secondScrollToItem(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryInside extends StatelessWidget {
  const CategoryInside({Key? key, this.categoryName}) : super(key: key);
  final String? categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              child: Text(
                categoryName!,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
            const RestaurantGrid(),
          ],
        ),
      ),
      bottomNavigationBar: const AppBarButton(),
    );
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard({
    Key? key,
    required this.image,
    this.category,
  }) : super(key: key);
  final String image;
  final String? category;

  @override
  _State createState() => _State();
}

class _State extends ModularState<CategoryCard, HomeStore> {
  final homeStore = Modular.get<HomeStore>();
  var width = 200.0;
  var height = 200.0;

  @override
  Widget build(BuildContext context) {
    void _updateState(_isHovering) {
      if (_isHovering) {
        setState(() {
          width = 215;
        });
      } else {
        setState(() {
          width = 200;
        });
      }
    }

    return AnimatedContainer(
      width: width,
      height: height,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceOut,
      child: Column(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              child: Image.asset(
                widget.image,
                width: width,
              ),
              onTap: () {
                homeStore.setSelectedCategory(widget.category);
              },
              onHover: (_isHovering) {
                _updateState(_isHovering);
              },
              hoverColor: Colors.transparent,
            ),
          ),
          Text(widget.category!)
        ],
      ),
    );
  }
}
