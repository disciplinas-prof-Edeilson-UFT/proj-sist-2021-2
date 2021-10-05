import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pscomidas/app/modules/home/components/restaurant_card.dart';
import 'dart:math';

/*
This is the Ifood's session "Stores". it holds a column witch contains the restaurant cards.
From this component is EXPECTED: 
 - retrieve data from Firestore database [OK]
 - construct the cards and columns [OK]. 
  
  there should be 1 to 3 columns based on available space (responsivity) [OK];
*/

class RestaurantGrid extends StatelessWidget {

  const RestaurantGrid({Key? key})
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
        double _pageWidth = MediaQuery.of(context).size.width;
        restaurants.removeAt(0);/*ATENÇÃO: ESTE É O CARD CRIADO PELOS LÍDERES COMO PADRÃO.
        ELE ESTÁ OBSOLETO DENTRO DAS NECESSIDADES DO CARD CRIADO PELO GRUPO 1. UM CONSENSO É ESPERADO.
        */
        return GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _pageWidth > 1100 ? 3 : _pageWidth > 700 ? 2 : 1,
            mainAxisExtent: _pageWidth * 0.10 < 115 ? 115 : _pageWidth * 0.10,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8),
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
              restaurants[index]['cupom'];
            } catch (exception) {
              return Column(children: [
                Text(exception.toString()),
                const Text(
                  "CONTACTE O GRUPO 1 PARA MAIS DETALHES.",
                  style: TextStyle(color: Colors.red),
                ),
              ]);
            }
            return RestaurantCard(restaurants[index]);
          }
        );
      },
    );
  }
}
