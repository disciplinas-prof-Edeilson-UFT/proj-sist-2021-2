import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';
import 'package:pscomidas/app/modules/restaurant_register/pages/register_shop/shop_register_card.dart';
import 'owner_register_formulary.dart';
import 'package:pscomidas/app/modules/restaurant_register/restaurant_register_store.dart';

class OwnerRegisterCard extends StatelessWidget {
  OwnerRegisterCard({Key? key}) : super(key: key);
  final RestaurantRegisterStore registerStore =
      Modular.get<RestaurantRegisterStore>();
  final cardFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 8,
      child: Container(
        width: 420,
        height: 530,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black, fontFamily: 'Nunito'),
                  children: [
                    TextSpan(
                      text: 'Cadastre sua loja\n',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Entre e ganhe 1 mês de mensalidade grátis!',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: Form(
                  key: cardFormKey,
                  child: OwnerRegisterFormulary(
                    controller: registerStore.controller,
                  ),
                ),
              ),
              const Text(
                'Ao prosseguir, aceito que o PSfood entre em contato comigo por telefone, email ou'
                ' Whatsapp (incluindo mensagens automáticas para fins comerciais).',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    backgroundColor:
                        MaterialStateProperty.resolveWith(_getButtonColor),
                    minimumSize: MaterialStateProperty.all(const Size(210, 48)),
                  ),
                  onPressed: () async {
                    if (cardFormKey.currentState!.validate()) {
                      Modular.to.navigate(ShopRegisterCard.routeName);
                    }
                  },
                  child: const Text(
                    'Começar o cadastro',
                    style: TextStyle(fontFamily: 'Nunito', fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getButtonColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return const Color(0xffA31922);
    }
    return secondaryColor;
  }
}
