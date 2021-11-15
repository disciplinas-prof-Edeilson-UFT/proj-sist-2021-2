import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_store.dart';

class AddressDialog extends StatefulWidget {
  const AddressDialog({Key? key,}) : super(key: key);

  @override
  State<AddressDialog> createState() => _AddressDialogState();
}

class _AddressDialogState extends State<AddressDialog> {
  final RestaurantStore restaurantStore = Modular.get();

  final CartStore cartStore = Modular.get();

  final ProductOptionsStore store = Modular.get();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    bool _value = false;

    return AlertDialog(
      titleTextStyle: const TextStyle(color: Colors.black54),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
      content: SizedBox(
        width: screen.width * .5,
        height: 350,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Você não informou o número de endereço'),
            Container(
              width: 100,
              child: const TextField(
                decoration: InputDecoration(  
                  border: OutlineInputBorder(),   
                  labelText: 'Número',
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Endereço sem número'),
                Checkbox(
                  value: _value,
                  onChanged: (value){setState((){ _value = value?? true;});},
                )
              ],
            ),
            Container(
              width: 300,
              height: 50,
              child: TextButton(
                onPressed: (){},
                child: const Text('Buscar com número', style: TextStyle(color: Colors.white),),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}
