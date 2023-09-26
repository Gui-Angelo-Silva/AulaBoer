import 'package:flutter/material.dart';
import 'package:appcrudsqlite/data/dbsigom.dart';

class EditVeiculo extends StatefulWidget {
  int rollno;

  EditVeiculo({required this.rollno}); //constructor for class

  @override
  State<StatefulWidget> createState() {
    return _EditVeiculo();
  }
}

class _EditVeiculo extends State<EditVeiculo> {
  TextEditingController marca = TextEditingController();

  TextEditingController rollno = TextEditingController();

  TextEditingController cor = TextEditingController();

  TextEditingController ano = TextEditingController();
  
  TextEditingController preco = TextEditingController();

  DbSigom mydb = new DbSigom();

  @override
  void initState() {
    mydb.open();

    Future.delayed(Duration(milliseconds: 500), () async {
      var data = await mydb.getCarros(
          widget.rollno); //widget.rollno is passed paramater to this class

      if (data != null) {
        marca.text = data["marca"];

        rollno.text = data["roll_no"].toString();

        cor.text = data["cor"];

        ano.text = data["ano"];

        preco.text = data["preco"];

        setState(() {});
      } else {
        print("Não encontrado dados com roll no: " + widget.rollno.toString());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Editar Veiculos"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: marca,
                decoration: InputDecoration(
                  hintText: "Marca",
                ),
              ),
              TextField(
                controller: rollno,
                decoration: InputDecoration(
                  hintText: "Roll No.",
                ),
              ),
              TextField(
                controller: cor,
                decoration: InputDecoration(
                  hintText: "Cor",
                ),
              ),
              TextField(
                controller: ano,
                decoration: InputDecoration(
                  hintText: "Ano",
                ),
              ),
              TextField(
                controller: preco,
                decoration: InputDecoration(
                  hintText: "Preço(R\$)",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    mydb.db.rawInsert(
                        "UPDATE carro SET marca = ?, roll_no = ?, cor = ?, preco = ?, ano = ? WHERE roll_no = ?",
                        [
                          marca.text,
                          rollno.text,
                          cor.text,
                          preco.text,
                          ano.text,
                          widget.rollno
                        ]);

                    //update table with roll no.

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Veículo Alterado!")));
                  },
                  child: Text("Alterar Veículo")),
            ],
          ),
        ));
  }
}
