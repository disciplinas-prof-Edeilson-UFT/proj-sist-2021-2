import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({Key? key, this.autofocus = false}) : super(key: key);
final bool autofocus;

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final ClientAddressStore store = Modular.get();

  @override
  void initState() {
    super.initState();
    store.textController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:  store.textController,
      textInputAction: TextInputAction.newline,
      autofocus: widget.autofocus,
      decoration: InputDecoration(
        hintText: 'Busque endereço e número',
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: true? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: secondaryCollor,
            ),
            onPressed: () {},
          ) : IconButton(
            icon: const Icon(
              Icons.search,
              color: secondaryCollor,
            ),
            onPressed: () {},
          ),
        ),
        suffixIcon: store.textController.text.isNotEmpty
            ? IconButton(
          icon: const Icon(
            Icons.cancel_sharp,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () {
            store.textController.clear();
          },
        )
            : null,
      ),
    );
  }
}
