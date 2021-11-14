import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/client_address/client_address_store.dart';
import 'package:pscomidas/app/modules/home/schemas.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
    this.autofocus = false,
    required this.controller,
    this.iconswap,
    this.hint,
  }) : super(key: key);

  final bool autofocus;
  final TextEditingController controller;
  final bool? iconswap;
  final String? hint;

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
      controller: widget.controller,
      textInputAction: TextInputAction.newline,
      autofocus: widget.autofocus,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: widget.hint ?? '',
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.iconswap != null && widget.iconswap == true
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: secondaryCollor,
                  ),
                  onPressed: () {},
                )
              : IconButton(
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
