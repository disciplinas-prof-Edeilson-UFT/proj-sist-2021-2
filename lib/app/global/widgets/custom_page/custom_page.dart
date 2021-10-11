import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/custom_app_bar.dart';

class CustomPage extends StatefulWidget {
  const CustomPage({Key? key, required this.body}) : super(key: key);

  final Widget body;
  @override
  _CustomPageState createState() => _CustomPageState();
}

class _CustomPageState extends State<CustomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: widget.body,
      ),
      //endDrawer: CartDrawer(),
    );
  }
}
