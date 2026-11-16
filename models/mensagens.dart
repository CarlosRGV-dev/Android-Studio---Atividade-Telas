import 'package:cloud_firestore/cloud_firestore.dart';

class Mensagens{
  String user="";
  String friend="";
  String msg="";
  DateTime dt=DateTime.now();

  Mensagens();

  //Converte o objeto para json, que sera gravado (set) no Firestore
  Map<String, dynamic> toJson()=>{
    'user': user,
    'friend': friend,
    'msg': msg,
    'dt': dt
  };

  //Converte o json que veio do Firestore (get) para o objeto
  Mensagens.fromSnapshot(DocumentSnapshot snapshot):
    user = snapshot['user'],
    friend = snapshot['friend'],
    msg = snapshot['msg'],
    dt = snapshot['dt'].toDate();

}
