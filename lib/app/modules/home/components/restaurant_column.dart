import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_card.dart';

/*
This is the Ifood's session "Stores". it holds a column witch contains the restaurant cards.
From this component is EXPECTED: 
 - retrieve data from Firestore database [OK]
 - construct the cards and columns. 
  
  there should be 1 to 3 columns based on available space (responsivity);
*/

class RestaurantColumns extends StatelessWidget {
  final int numberOfColumns;

  const RestaurantColumns({Key? key, required this.numberOfColumns})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('restaurant').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        final restaurants = streamSnapshot.data!.docs;

        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: numberOfColumns,
              mainAxisExtent: 115,
              childAspectRatio: 5 / 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12),
          itemCount: restaurants.length,
          itemBuilder: (context, index) {
            try {
              //lida com erros nos campos dos documentos do firebase.
              //garantido que os documentos serão feitos sem erros, este try catch pode ser excluido.
              restaurants[index]['image'];
              restaurants[index]['social_name'];
              restaurants[index]['avaliation'];
              restaurants[index]['category'];
              restaurants[index]['distance'];       
              restaurants[index]['estimated_delivery'];
              restaurants[index]['delivery_price'];
            } catch (exception) {
              return Column(children: [
                Text(exception.toString()),
                Text("CONTACTE O GRUPO 1 PARA MAIS DETALHES.", style: TextStyle(color: Colors.red),),
              ]);
            } 
            return RestaurantCard(restaurants[index]);
          }
        );
      }
    );
  }
}
