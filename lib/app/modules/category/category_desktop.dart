import 'package:flutter/material.dart';

class  CategoryDesktop extends StatelessWidget {
   CategoryDesktop ({ Key? key }) : super(key: key);
  final itemKey = GlobalKey();
  Future scrollToItem() async{
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(context,
    
     //alignment: 1,
     duration: Duration(seconds: 1)
    );}

    final secondItemKey = GlobalKey();
  Future SecondScrollToItem() async {
    final context = secondItemKey.currentContext!;
    await Scrollable.ensureVisible(context,
    duration: Duration(seconds: 1)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 140,
        //MediaQuery.of(context).size.width * 0.1 ,
        //< 200 ? 200: MediaQuery.of(context).size.width * 0.1
        child: Stack(
          children: [
            SingleChildScrollView( 
                controller:ScrollController(initialScrollOffset: 0.0),
                scrollDirection: Axis.horizontal,
                    child: 
                     Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children:  [
                        Container(
                          key: secondItemKey,
                          child: CardCategoria (imagem: "assets/categorias/acai.png", categoria: 'Açaí')),
                        CardCategoria (imagem: "assets/categorias/hamburger.png", categoria: 'Hambúguer'),
                        CardCategoria (imagem: "assets/categorias/bread.png", categoria: 'Padarias'),
                       CardCategoria (imagem: "assets/categorias/pizza.png", categoria: 'Pizza'),
                        CardCategoria (imagem: "assets/categorias/healthy.png", categoria: 'Saudável'),
                        CardCategoria (imagem: "assets/categorias/cake.png", categoria: 'Bolos e Doces'),
                        Container(key: itemKey, 
                        child: 
                        CardCategoria (
                          imagem: "assets/categorias/drinks.png",
                           categoria: 'Bebidas')),
                        CardCategoria (imagem: "assets/categorias/vegetarian.png", categoria: 'Vegetariana'),
                        CardCategoria (imagem: "assets/categorias/italian.png", categoria: 'Italiana'),
                        CardCategoria (imagem: "assets/categorias/icecream.png", categoria: 'Sorvetes'),
                      ]

   
                   ),
                 
                     
              ),
              
                     
                           Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                            
                            child: Image.asset(
                                "assets/categorias/right.png",
                              width: 30,
                           
                            ),
                            onTap: () => scrollToItem(), 
                          ),               
                          ),
                          
                        
                      Align(
                         alignment: Alignment.centerLeft,
                        child: InkWell(
                          child: Image.asset(
                              "assets/categorias/left.png",
                            width: 30,
                            
                          ),
                           onTap: () => SecondScrollToItem(), 
                        ),
                      ),
                                

                
          ],
        ),
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
class CardCategoria extends StatefulWidget {
  CardCategoria({ Key? key, this.imagem, this.categoria }) : super(key: key);
  
  @override
  _State createState() => _State();
  late final  imagem;
  late final String? categoria;
    double _width = 200;
    double _height = 200;
    
  
}
 
class _State extends State<CardCategoria> {
  @override
  Widget build(BuildContext context) {
    
  
 void _updateState(_isHovering){
   if(_isHovering){
  setState(() {
        widget._width = 230;
        });
   }
    else{
      setState(() {
       widget._width = 200;
      
    
      });
    }
    }
    return 
      AnimatedContainer(
      width:  widget._width,
      height:  widget._height,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceOut,
      child: Column(
                    children: [
                    MouseRegion(
                                  
                                  //Imagem como botão para Filtros
                                  cursor: SystemMouseCursors.click,
                                  child: InkWell(
                                    child: Image.asset(
                                        widget.imagem,
                                      width:widget._width,
                                  
                                   
                                      // MediaQuery.of(context).size.width * 0.12,
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SecondRoute()),
                                      ); },
                                    onHover: ( _isHovering){
                                      _updateState(_isHovering);
                                    },
                                    hoverColor: Colors.transparent,

                                  ),
                                ),  Text(widget.categoria!)
                      
                                ]
                   ),
    );
    
  }
}

