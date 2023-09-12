import 'package:flutter/material.dart';

import 'package:appcrudsqlite/data/dbsigom.dart';

class Add extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Add();
  }
}

class _Add extends State<Add> {
  TextEditingController marca = TextEditingController();
  TextEditingController cor = TextEditingController();
  TextEditingController ano = TextEditingController();
  TextEditingController preco = TextEditingController();
  TextEditingController roll_no = TextEditingController();

  //test editing controllers for form

  DbSigom mydb = DbSigom(); //mydb new object from db.dart

  @override
  void initState() {
    mydb.open(); //initilization database

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inserir Veículo"),
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              TextField(
                controller: marca,
                decoration: const InputDecoration(
                  hintText: "Marca",
                ),
              ),
              TextField(
                controller: cor,
                decoration: const InputDecoration(
                  hintText: "Cor",
                ),
              ),
              TextField(
                controller: ano,
                decoration: const InputDecoration(
                  hintText: "Ano",
                ),
              ),
              TextField(
                controller: preco,
                decoration: const InputDecoration(
                  hintText: "Preço(R\$)",
                ),
              ),
              TextField(
                controller: roll_no,
                decoration: const InputDecoration(
                  hintText: "Código",
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    mydb.db.rawInsert(
                        "INSERT INTO carro(marca, cor, ano, preco, roll_no) VALUES (?, ?, ?, ?, ?);",
                        [
                          marca.text,
                          cor.text,
                          ano.text,
                          preco.text,
                          roll_no.text
                        ]); //add student from form to database

                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Veículo Adicionado")));

                    marca.text = "";
                    cor.text = "";
                    ano.text = "";
                    preco.text = "";
                    roll_no.text = "";
                  },
                  child: Text("Salvar Veículo")),
            ],
          ),
        ));
  }
}
