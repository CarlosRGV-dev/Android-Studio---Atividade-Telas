import 'package:flutter/material.dart';

import 'messageList.dart';
import 'messagesFirestore.dart';
import 'tela_Adicionar.dart';
import 'tela_consulta.dart';
import 'widgets/widgetsButton.dart';
import 'widgets/widgetsInput.dart';
class Menu extends StatelessWidget {
  final _user = TextEditingController();
  final _friend = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo Firestore"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed:(){
            _abreTelaAdicionar(context, TelaAdicionar());
            } ,
            tooltip: 'Clique para adicionar registros',
          ),
          IconButton(
            icon: Icon(Icons.line_style),
            onPressed:(){
              _abreTelaListar(context, TelaConsulta());
              },
            tooltip: 'Clique para visualizar os registros',
          )
        ],
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context){
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Center(
          child: Botoes("Conversar", onPressed: () {
            if (_camposPreenchidos(context)) {
              _abreTelaAdicionar(context,
                  MensagensFirestore(_user.text.trim(), _friend.text.trim()));
            }
          }),
        ),
        SizedBox(height: 32),
        Center(child: Text("Seu usuário:", style: TextStyle(fontSize: 18))),
        InputTextos("", "Digite seu usuário", controller: _user),
        SizedBox(height: 32),
        Center(
          child: Text("Com quem você quer conversar?",
              style: TextStyle(fontSize: 18)),
        ),
        InputTextos("", "Digite o nome do amigo", controller: _friend),
        SizedBox(height: 32),
        Center(
          child: Botoes("Histórico de mensagens", onPressed: () {
            if (_camposPreenchidos(context)) {
              _abreTelaListar(context,
                  MessageList(_user.text.trim(), _friend.text.trim()));
            }
          }),
        ),
      ],
    );
  }

  //As consultas filtram por usuario e amigo, entao os dois sao obrigatorios
  bool _camposPreenchidos(BuildContext context){
    if (_user.text.trim().isEmpty || _friend.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Preencha seu usuário e o nome do amigo")),
      );
      return false;
    }
    return true;
  }

  _abreTelaAdicionar(ctx, page){
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
    {
      return page;
    }));
  }

  _abreTelaListar(ctx, page){
    Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext context)
    {
      return page;
    }));
  }
}
