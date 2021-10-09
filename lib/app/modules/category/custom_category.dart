import 'package:flutter/material.dart';
import 'category_page.dart';

class CustomCategory extends StatefulWidget implements PreferredSizeWidget {
  const CustomCategory({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  _CustomCategoryState createState() => _CustomCategoryState();
}

class _CustomCategoryState extends State<CustomCategory> {
  @override
  Widget build(BuildContext context) {
    return  CategoryPage(
    
    );
  }
}

