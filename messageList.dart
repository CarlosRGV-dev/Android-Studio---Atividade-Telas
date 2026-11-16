import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'messageCard.dart';


class MessageList extends StatefulWidget {

  String user;
  String friend;
  MessageList(this.user, this.friend);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  List _resultsList = [];
  late QuerySnapshot result; //armazena o resultado da consulta

  @override
  void initState() {
    super.initState();
    //Busca uma vez ao abrir a tela. Nao pode ficar dentro do build, pois o
    //setState da busca chamaria o build de novo, em loop
    _buscaRegistro();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("Lista conversas"),
    actions: [
      IconButton(
        onPressed: _buscaRegistro,
        icon: Icon(Icons.search),
      )
    ],
    ),
    body: _lista(),
    );
  }




  _lista() {
    if (_resultsList.isEmpty) {
      return Center(child: Text("Nenhuma mensagem encontrada"));
    }
    return ListView.builder(
      padding: EdgeInsets.all(9),
      itemCount: _resultsList.length,
      itemBuilder: (BuildContext ctx, int index) =>
          buildMessageCard(ctx, _resultsList[index], widget.friend),
    );
  }




  Future <void> _buscaRegistro() async{
    var banco = FirebaseFirestore.instance.collection("msg");
    var filtronaColecao = banco;
    var consulta;

    //Mesmo filtro da tela de mensagens: campos friend e user, 100 documentos
    consulta = await filtronaColecao
        .where("friend", isEqualTo: widget.friend.trim())
        .where("user", isEqualTo: widget.user.trim())
        .limit(100);
    result = await consulta.get();
    if (!mounted) return;
    setState(() {
      _resultsList = result.docs;
    });
  }
}
