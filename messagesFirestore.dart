import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'messageCard.dart';
import 'models/mensagens.dart';
import 'widgets/widgetsButton.dart';
import 'widgets/widgetsInput.dart';
import 'widgets/widgetsTexto.dart';

class MensagensFirestore extends StatefulWidget {
  final String user;
  final String friend;

  const MensagensFirestore(this.user, this.friend, {super.key});

  @override
  _MensagensFirestoreState createState() => _MensagensFirestoreState();
}

class _MensagensFirestoreState extends State<MensagensFirestore> {
  late final TextEditingController _friend;
  late final TextEditingController _user;
  final _msg = TextEditingController();
  final _qtdmsg = TextEditingController();
  List<DocumentSnapshot> _resultsList = [];
  QuerySnapshot? result;

  @override
  void initState() {
    super.initState();
    _user = TextEditingController(text: widget.user);
    _friend = TextEditingController(text: widget.friend);
  }

  @override
  void dispose() {
    _friend.dispose();
    _user.dispose();
    _msg.dispose();
    _qtdmsg.dispose();
    super.dispose();
  }

  // Método para inicializar o Firebase exigido nos slides
  Future<void> inicializarFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Firebase.initializeApp().whenComplete(() => print("Conectado no Firebase"));
  }

  @override
  Widget build(BuildContext context) {
    inicializarFirebase();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mensagens"),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      padding: const EdgeInsets.all(9),
      children: [
        Textos("Conversas com seu amigo: ${_friend.text}"),
        Textos(" "),
        ContainerOldMessages(),
        ContainerInsere(_msg, "Digite a mensagem:", ""),
        Botoes("Enviar", onPressed: () {
          _clicksend(context);
        }),
        Botoes("Receber", onPressed: _buscaRegistro)
      ],
    );
  }

  Widget ContainerOldMessages() {
    return Container(
      color: Colors.transparent,
      height: 270,
      width: double.maxFinite,
      margin: const EdgeInsets.only(left: 3, right: 3, bottom: 0, top: 0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _resultsList.length,
        itemBuilder: (BuildContext ctx, int index) =>
            buildMessageCard(ctx, _resultsList[index], widget.friend),
      ),
    );
  }

  Widget ContainerInsere(TextEditingController txt, String label, String rotulo) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(left: 3, right: 3, bottom: 0, top: 0),
      alignment: AlignmentDirectional.topStart,
      child: InputTextos(rotulo, label, controller: txt),
    );
  }

  void _clicksend(BuildContext ctx) {
    Mensagens ms = Mensagens();
    ms.friend = _friend.text.toString().trim();
    ms.user = _user.text.toString().trim();
    ms.msg = _msg.text.toString().trim();
    ms.dt = DateTime.now();

    CollectionReference instanciaColecaoFirestore =
    FirebaseFirestore.instance.collection("msg");

    Future<void> addMsg() {
      return instanciaColecaoFirestore
          .doc(ms.dt.toString().trim())
          .set(ms.toJson())
          .then((value) => print("Mensagem adicionada"))
          .catchError((onError) => print("Erro ao gravar no banco $onError"));
    }

    addMsg();

    _msg.text = "";
    _qtdmsg.text = "1";
  }

  Future<void> _buscaRegistro() async {
    var banco = FirebaseFirestore.instance.collection("msg");
    var consulta = banco
        .where("friend", isEqualTo: _friend.text.trim())
        .where("user", isEqualTo: _user.text.trim())
        .limit(100);

    result = await consulta.get();
    if (!mounted) return;
    setState(() {
      _resultsList = result!.docs;
    });
  }
}

class DefaultFirebaseOptions {
}