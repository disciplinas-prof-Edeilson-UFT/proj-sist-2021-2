// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/item.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';
import 'package:pscomidas/app/global/utils/format_money.dart';
import 'package:pscomidas/app/modules/cart/cart_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/register_client/widgets/custom_submit_button.dart';
import 'package:pscomidas/app/modules/restaurant/restaurant_store.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/restaurant/widgets/product_options/product_store.dart';

import '../client_address_store.dart';

class AddressNumber extends StatefulWidget {
  
  const AddressNumber({Key? key,}) : super(key: key);
  

  @override
  State<AddressNumber> createState() => _AddressNumberState();
}

class _AddressNumberState extends State<AddressNumber> {
final ClientAddressStore store = Modular.get();

  get child => null;

  get mycontroller => null;

  @override
  void initState() {
    super.initState();
  }
  bool checkValue = false;
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    //bool _value = true;
    

   /* String? numberValidator(String value) {
      if(value == null) {
        return null;
      }
      final n = num.tryParse(value);
      if(n == null) {
        return '"$value" is not a valid number';
      }
      return null;
    }*/
   return 
   Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
            children: [
              IconButton(
                onPressed: () => store.jump(2),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: secondaryCollor,
                ),
              ),
              //const SizedBox(width: 50.0),
              const Expanded(
                child:  Text(
                  'Você não informou o número de endereço',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
            Container(
              width: 100,
              child: TextFormField(
                inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(  
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
                  value: checkValue,
                  onChanged: (bool ? value){
                    setState(() {
                      checkValue = value!;
                    });
                  }
                ),
              ],
            ),
            CustomSubmit(
            label: 'Adcionar endereço',
            onPressed: () async => store.jump(3),
          ),
          ],
        );
  }
}
/* Checkbox(
                  value: _value,
                  onChanged: (value){setState((){ _value = value?? true;});},
                )*/