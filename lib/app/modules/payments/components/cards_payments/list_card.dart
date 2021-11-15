import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pscomidas/app/global/utils/schemas.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Função para pegar apenas os quatros ultimos numeros do cartão
    String getLastChars(String numero) {
      var tamanho = numero.length;
      var start = tamanho == 16 ? 12 : 10;
      var end = tamanho;
      var lastChars = numero.substring(start, end);
      return lastChars;
    }

    final Size screen = MediaQuery.of(context).size;

    return Observer(builder: (_) {
      return ListView.builder(
        itemCount: 1, // numero de cartões cadastrados
        itemBuilder: (_, index) {
          return Card(
            child: InkWell(
              splashColor: Colors.red.withAlpha(30),
              onTap: () => null,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.credit_card, color: secondaryColor),
                        SizedBox(width: screen.width * 0.02,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Cartão clonado'),
                            Text(
                              '... ${getLastChars('1234567812345678')}',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Como quer chamar o cartão?', 
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              content: const TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder()
                                ),
                              ),
                              actions: [
                                Center(
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(250, 40),
                                          primary: secondaryColor
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Salvar apelido'),
                                      ),
                                      const SizedBox(height: 10,),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Cancelar'),
                                      ),
                                    ]
                                  ),
                                )
                                
                              ],
                            ),
                          ),
                          tooltip: 'Editar',
                          icon: const Icon(Icons.edit, color: secondaryColor,)
                        ),
                        IconButton(
                          onPressed: ()=> showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Quer excluir este cartão?', 
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              content: const Text(
                                'Ao confirmar, (apelido do cartão), final (os 4 numeros finais) \n'
                                'não estará mais disponível na sua lista de cartões salvos no site.'),
                              actions: [
                                Center(
                                  child: Column(
                                    children: [
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(250, 40),
                                          primary: secondaryColor
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text('Excluir cartão'),
                                      ),
                                      const SizedBox(height: 10,),
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text(
                                          'Cancelar', 
                                          style: TextStyle(color: secondaryColor),
                                        ),
                                      ),
                                    ]
                                  ),
                                )
                                
                              ],
                            ),
                          ),
                          tooltip: 'Deletar', 
                          icon: const Icon(Icons.delete, color: secondaryColor)
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          );
        }
      );
    });
  }
}
