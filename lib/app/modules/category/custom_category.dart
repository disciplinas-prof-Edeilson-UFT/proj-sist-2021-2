import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/desktop_app_bar.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/mobile_app_bar.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/tablet_app_bar.dart';
import 'package:pscomidas/app/modules/category/category_desktop.dart';
import 'package:pscomidas/app/modules/category/category_mobile.dart';
import 'package:pscomidas/app/modules/category/category_tablet.dart';

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
    return  CategoryDesktop(
    
    );
  }
}

