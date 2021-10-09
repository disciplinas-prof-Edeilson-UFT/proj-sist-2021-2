import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/global/models/entities/product.dart';

class RestaurantTopBar extends StatefulWidget {
  RestaurantTopBar({
    Key? key,
  }) : super(key: key);

  @override
  _RestaurantTopBarState createState() => _RestaurantTopBarState();
}

class _RestaurantTopBarState extends State<RestaurantTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2*MediaQuery.of(context).size.width/3,
      child: Column(
        children: [
          SizedBox(height: 30),
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://png.pngtree.com/thumb_back/fh260/back_our/20190620/ourmid/pngtree-food-seasoning-food-banner-image_169169.jpg"
                ),
                fit: BoxFit.cover
              ),
              borderRadius: BorderRadius.circular(5)
            ),
          ),
          SizedBox(height: 40),
          Row(
            children: [
              CircleAvatar(
                maxRadius: 40,
                backgroundImage: NetworkImage("https://i.pinimg.com/736x/6f/1e/fb/6f1efb3e2f7ddb6f6b9a3dbefabe0c67.jpg"),
              ),
              SizedBox(width: 20),
              Text("Loja do nalbim",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
              SizedBox(width: 5),
              Icon(Icons.star,color: Colors.yellow[800],size: 20,),
              SizedBox(width: 1),
              Text('5',style: TextStyle(color: Colors.yellow[800],fontWeight: FontWeight.w700,fontSize: 17),),
              Expanded(child: Container()),
              Text("Ver mais",style: TextStyle(fontSize: 17,color: Colors.red, fontWeight: FontWeight.w700),),
              SizedBox(width: 20),
              Text("|",style: TextStyle(fontSize: 17,color: Colors.grey, fontWeight: FontWeight.w400),),
              SizedBox(width: 10),
              Icon(Icons.monetization_on,color: Colors.grey,size: 20,),
              SizedBox(width: 10),
              Text("Pedido mínimo R\$ 9,99",style: TextStyle(fontSize: 14,color: Colors.grey, fontWeight: FontWeight.w500),),
            ],
          ),
        ],
      ),
      // child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           height: MediaQuery.of(context).size.height/3,
      //           width: MediaQuery.of(context).size.width/5,
      //           decoration: BoxDecoration(color: Colors.black),
      //         ),
      //         SizedBox(width: 20),
      //         Container(
      //           height: MediaQuery.of(context).size.height/3,
      //           width: MediaQuery.of(context).size.width/5,
      //           decoration: BoxDecoration(color: Colors.black),
      //         ),
      //         SizedBox(width: 20),
      //         Container(
      //           height: MediaQuery.of(context).size.height/3,
      //           width: MediaQuery.of(context).size.width/5,
      //           decoration: BoxDecoration(color: Colors.black),
      //         ),
      //       ],
      //     ),
      //     SizedBox(height: 20,),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           height: MediaQuery.of(context).size.height/5,
      //           width: MediaQuery.of(context).size.width/4,
      //           decoration: BoxDecoration(color: Colors.black),
      //         ),
      //         SizedBox(width: 20),
      //         Container(
      //           height: MediaQuery.of(context).size.height/5,
      //           width: MediaQuery.of(context).size.width/4,
      //           decoration: BoxDecoration(color: Colors.black),
      //         ),
      //       ],
      //     ) 
      //   ],
      // )
    );
  }
}
