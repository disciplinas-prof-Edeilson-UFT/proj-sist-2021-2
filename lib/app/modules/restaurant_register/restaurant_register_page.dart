import 'package:flutter/material.dart';
import 'package:pscomidas/app/global/widgets/app_bar/components/components_app_bar.dart';
import 'package:pscomidas/app/modules/restaurant_register/components/register_plans.dart';
import 'pages/register_owner/owner_register_card.dart';
import 'pages/register_owner/register_side_text.dart';

class RestaurantRegisterPage extends StatefulWidget {
  final String title;
  static String get routeName => 'owner';
  const RestaurantRegisterPage({
    Key? key,
    this.title = 'RestaurantRegisterPage',
  }) : super(key: key);
  @override
  RestaurantRegisterPageState createState() => RestaurantRegisterPageState();
}

class RestaurantRegisterPageState extends State<RestaurantRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0XFFf7f7f7),
        automaticallyImplyLeading: false,
        elevation: 2,
        title: const Center(child: LogoAppBar()),
      ),
      body: Container(
        child: pageResponsivity(MediaQuery.of(context).size.width),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/register/background.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget pageResponsivity(width) {
    if (width > 850) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RegisterSideText(),
                OwnerRegisterCard(),
              ],
            ),
            const RegisterPlans(),
          ],
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              RegisterSideText(),
              OwnerRegisterCard(),
              const RegisterPlans(),
            ],
          ),
        ],
      ),
    );
  }
}
