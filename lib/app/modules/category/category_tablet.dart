import 'package:flutter/material.dart';

class  CategoryTablet extends StatelessWidget {
  const CategoryTablet ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: ListView( 
        controller:ScrollController(initialScrollOffset: 0.0),
        scrollDirection: Axis.horizontal,
               children: 
           [ Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                    Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/acai.png",
                                    width: MediaQuery.of(context).size.width * 0.20,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Açaí")
                    
                              ]
                 ),
                        Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/hamburger.png",
                                    width: MediaQuery.of(context).size.width *0.20,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Hambúrguer")
                    
                              ]
                 ),
                 Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/bread.png",
                                    width: MediaQuery.of(context).size.width *0.20,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Padarias")
                    
                              ]
                 ),
                 Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/pizza.png",
                                    width: MediaQuery.of(context).size.width * 0.20,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Pizza")
                    
                              ]
                 ),
                 Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/cake.png",
                                    width: MediaQuery.of(context).size.width * 0.20,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Bolos e Doces")
                    
                              ]
                 ),
              
             


                  ]
                   
                  
                 
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