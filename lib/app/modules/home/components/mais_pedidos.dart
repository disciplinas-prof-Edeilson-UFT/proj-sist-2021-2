import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MaisPedidos extends StatelessWidget {
  const MaisPedidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CollectionReference most = FirebaseFirestore.instance.collection('most');

    return Center(
      child: FutureBuilder<QuerySnapshot>(
        future: most.get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text(
              'Algo deu errado',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            height: 140.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Container(
                  width: 135.0,
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    onTap: () {},
                    title: CircleAvatar(
                      radius: 45.0,
                      backgroundImage: NetworkImage(data['picture']),
                    ),
                    subtitle: Text(
                      data['name'],
                      softWrap: true,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
