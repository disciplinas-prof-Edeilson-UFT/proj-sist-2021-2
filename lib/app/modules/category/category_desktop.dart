import 'package:flutter/material.dart';

class  CategoryDesktop extends StatelessWidget {
  const CategoryDesktop ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 140,
      //MediaQuery.of(context).size.width * 0.1 ,
      //< 200 ? 200: MediaQuery.of(context).size.width * 0.1
      child: Stack(
        children: [
          ListView( 
              controller:ScrollController(initialScrollOffset: 0.0),
              scrollDirection: Axis.horizontal,
                  children: [ 
                   Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: const [
                      CategoriaCard(imagem: "assets/categorias/acai.png", categoria: 'Açaí'),
                      CategoriaCard(imagem: "assets/categorias/hamburger.png", categoria: 'Hambúguer'),
                      CategoriaCard(imagem: "assets/categorias/bread.png", categoria: 'Padarias'),
                      CategoriaCard(imagem: "assets/categorias/pizza.png", categoria: 'Pizza'),
                      CategoriaCard(imagem: "assets/categorias/healthy.png", categoria: 'Saudável'),
                      CategoriaCard(imagem: "assets/categorias/cake.png", categoria: 'Bolos e Doces'),
                      CategoriaCard(imagem: "assets/categorias/drinks.png", categoria: 'Bebidas'),
                      CategoriaCard(imagem: "assets/categorias/vegetarian.png", categoria: 'Vegetariana'),
                      CategoriaCard(imagem: "assets/categorias/italian.png", categoria: 'Italiana'),
                      CategoriaCard(imagem: "assets/categorias/icecream.png", categoria: 'Sorvetes'),
                    ]

   
                 ),
               ],
                   
            ),
            
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                        
                        child: Image.asset(
                            "assets/categorias/right-arrow.png",
                          width: 30,
                       
                        ),
                        onTap: () {
                         
                        },
                                          ),
                      ),
                    Align(
                       alignment: Alignment.centerLeft,
                      child: InkWell(
                        child: Image.asset(
                            "assets/categorias/right-arrow.png",
                          width: 30,
                          
                        ),
                        onTap: () {
                         
                        },
                      ),
                    ),
                              

              
        ],
      ),
    ); 
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
//final  _imagem = "assets/categorias/acai.png";
class CategoriaCard extends StatelessWidget {
  const CategoriaCard({ Key? key, required this.imagem, this.categoria}) : super(key: key);
  final  imagem;
  final String? categoria;
  @override
  Widget build(BuildContext context) {
    return  Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                      imagem,
                                    width:200,
                                    // MediaQuery.of(context).size.width * 0.12,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ),  Text(categoria!)
                    
                              ]
                 );
  }
}