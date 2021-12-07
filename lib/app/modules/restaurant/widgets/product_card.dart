import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_dialog.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => ProductDialog(
          product: widget.product,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2.0,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Wrap(
          children: <Widget>[
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    widget.product.imgUrl ??
                        'https://firebasestorage.googleapis.com/v0/b/ps-comidas.appspot.com/o/no-image.png?alt=media&token=ef69bdba-5ece-4dc0-9754-fcf2a04364f0',
                  ),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    widget.product.name ?? 'Não encontrado',
                    style: titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                    right: 20.0,
                  ),
                  child: Text(
                    widget.product.description ?? '',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    FormatMoney.doubleToMoney(widget.product.price!),
                    style: priceStyle,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get priceStyle => const TextStyle(
        color: Colors.black87,
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      );

  TextStyle get titleStyle => const TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
      );
}
