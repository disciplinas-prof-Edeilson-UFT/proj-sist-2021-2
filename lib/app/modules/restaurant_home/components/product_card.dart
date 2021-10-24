import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

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
              const Positioned(
                top: 10,
                left: 10,
                right: 150,
                child: Text(
                  'Pirulitos Halloween 30g',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nunito',
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Positioned(
                top: 40,
                left: 10,
                right: 200,
                child: Text(
                  'Os pirulitos de chocolate ao leite e branco em formato de '
                  'abobora e fantasma vão fazer sucesso no Hallowen! Feitos com'
                  ' chocolate ao leite e branco e decorados artesanalmente. '
                  'Imagens ilustrativas.',
                  style: TextStyle(
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
                  FormatMoney.doubleToMoney(5.90),
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Image.asset(
                  'assets/images/product_page/lollipop.webp',
                  width: 180,
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
