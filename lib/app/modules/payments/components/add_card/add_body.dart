import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';
import 'package:pscomidas/app/modules/payments/components/add_card/form_card.dart';
import 'package:pscomidas/app/modules/payments/components/add_card/type_card.dart';
import 'package:pscomidas/app/modules/payments/payments_store.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  PaymentsStore store = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            color: primaryCollor,
            width: 300,
            height: 50,
            child: Observer(
              builder: (_) {
                return Material(
                    child: !store.typeCardChosen
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Observer(builder: (_) {
                                return IconButton(
                                  onPressed: () {
                                    store.setDataInvalid(false);
                                    store.setTypeCardChosen(false);
                                    store.clear();
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: tertiaryColor,
                                  ),
                                );
                              }),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(builder: (_) {
                                return IconButton(
                                  onPressed: () {
                                    store.setDataInvalid(false);
                                    store.clear();
                                    store.setTypeCardChosen(false);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: tertiaryColor,
                                  ),
                                );
                              }),
                              Observer(builder: (_) {
                                return IconButton(
                                  onPressed: () {
                                    store.setDataInvalid(false);
                                    store.setTypeCardChosen(false);
                                    store.clear();
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(
                                    Icons.close_outlined,
                                    color: tertiaryColor,
                                  ),
                                );
                              }),
                            ],
                          ));
              },
            )),
        Observer(
          builder: (_) {
            return !store.typeCardChosen ? const TypeCard() : const FormCard();
          },
        )
      ],
    );
  }
}
