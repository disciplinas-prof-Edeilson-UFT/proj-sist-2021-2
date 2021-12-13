import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        hoverColor: Colors.transparent,
        child: SizedBox(
          height: 200,
          width: 400,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                left: 10,
                right: 150,
                child: Text(
                  widget.product.name.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                top: 40,
                left: 10,
                right: 200,
                child: Text(
                  widget.product.description.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Nunito',
                    color: tertiaryColor,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Text(
                  FormatMoney.doubleToMoney(widget.product.price!),
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        widget.product.imgUrl.toString(),
                        scale: 2,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
