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
    this.onPressed,
  }) : super(key: key);

  final bool autofocus;
  final TextEditingController controller;
  final bool? iconswap;
  final String? hint;
  final Function()? onPressed;

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  final ClientAddressStore store = Modular.get();

  @override
  void initState() {
    store.textController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    store.textController.clear();
    super.dispose();
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
                  onPressed: () => store.jump(0),
                )
              : const Icon(
                  Icons.search,
                  color: secondaryCollor,
                ),
        ),
        suffixIcon: Visibility(
          visible: store.textController.text.isNotEmpty,
          child: IconButton(
            icon: const Icon(
              Icons.cancel_sharp,
              color: Colors.grey,
              size: 20,
            ),
            onPressed: () {
              setState(() {
                store.textController.clear();
              });
            },
          ),
        ),
      ),
    );
  }
}
