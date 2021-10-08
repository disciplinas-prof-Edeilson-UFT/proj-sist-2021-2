import 'package:flutter/material.dart';

class  CategoryDesktop extends StatelessWidget {
  const CategoryDesktop ({ Key? key }) : super(key: key);

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
                                    width: MediaQuery.of(context).size.width * 0.14,
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
                                    width: MediaQuery.of(context).size.width *0.14,
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
                                    width: MediaQuery.of(context).size.width *0.14,
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
                                    width: MediaQuery.of(context).size.width * 0.14,
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
                                    width: MediaQuery.of(context).size.width * 0.14,
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
                 //ACHO QUE É AQ
                Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/healthy.png",
                                    width: MediaQuery.of(context).size.width * 0.14,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Saudável")
                    
                              ]
                 ),
                /* Container(
                   key:itemKey,
                   child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child:Image.asset(
                                    "assets/categorias/arroow.png",
                                    width: MediaQuery.of(context).size.width * 0.14,
                                  ),
                                  onTap: () => scrollToItem(), 
                                ),
                              ),
                    
                              ]
                 ),), */
                 

                  Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/vegetarian.png",
                                    width: MediaQuery.of(context).size.width * 0.14,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Vegetariana")
                    
                              ]
                 ),
                 
                

                 Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/japonese.png",
                                    width: MediaQuery.of(context).size.width * 0.14,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Japonesa")
                    
                              ]
                 ),
                 Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/drinks.png",
                                    width: MediaQuery.of(context).size.width * 0.14,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Bebidas")
                    
                              ]
                 ),
                 Column(
                  children: [
                  MouseRegion(
                                
                                //Imagem como botão para Filtros
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  child: Image.asset(
                                    "assets/categorias/italian.png",
                                    width: MediaQuery.of(context).size.width * 0.14,
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const SecondRoute()),
                                    );
                                  },
                                ),
                              ), const Text("Italiana")
                    
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