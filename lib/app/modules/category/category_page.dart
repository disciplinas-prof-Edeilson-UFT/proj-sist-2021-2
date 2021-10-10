import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/store/home_store.dart';

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
                        category: 'Hambúguer'),
                    CategoryCard(
                        image: "assets/category/bread.png",
                        category: 'Padarias'),
                    CategoryCard(
                        image: "assets/category/pizza.png", category: 'Pizza'),
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

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  CategoryCard({Key? key, this.image, this.category}) : super(key: key);

  @override
  _State createState() => _State();
  late final image;
  late final String? category;
  double _width = 200;
  double _height = 200;
}

class _State extends ModularState<CategoryCard, HomeStore> {
  final homeStore = Modular.get<HomeStore>();

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
      ]),
    );
  }
}
