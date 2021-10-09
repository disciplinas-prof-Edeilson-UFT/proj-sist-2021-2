import 'package:flutter/material.dart';
// import 'package:pscomidas/app/modules/restaurant/widgets/product_dialog.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key? key,
  }) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        // TODO: Implementar ProductDialog
      },
      child: Container(
        width: screen.width * 0.4,
        height: 300.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 2.0,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150.0,
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0 * 0.5),
                  topRight: Radius.circular(10.0 * 0.5),
                ),
              ),
            ),
            SizedBox(
              width: screen.width * 0.38,
              height: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'X-tudo',
                      // style: listItemTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'Pão, salsicha e carne',
                      // style: listItemSubTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
                    child: Text(
                      'R\$10,00',
                      // style: priceStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
