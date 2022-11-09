import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cambio de divisa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Convertidor'),
    );
  }
}

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = "COP";
String op2 = "USD";

List<DropdownMenuItem<String>> listaMoneda = <DropdownMenuItem<String>>[
  DropdownMenuItem(value: "USD", child: Text("USD")),
  DropdownMenuItem(value: "EUR", child: Text("EUR")),
  DropdownMenuItem(value: "COP", child: Text("COP")),
];

List<calculadora> cal = <calculadora>[
  calculadora("7", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("8", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("9", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("4", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("5", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("6", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("1", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("2", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("3", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("0", Colors.blueGrey, Icon(Icons.abc)),
  calculadora("Limpiar", Colors.blueGrey, Icon(Icons.cleaning_services)),
  calculadora("=", Colors.blueGrey, Icon(Icons.abc)),
];

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            Row(
              children: [
                Text("Moneda origen: "),
                DropdownButton(
                    value: op1,
                    items: listaMoneda,
                    onChanged: (String? x) {
                      setState(() {
                        op1 = x.toString();
                      });
                    }),
                VerticalDivider(),
                Text("Moneda Destino: "),
                DropdownButton(
                    value: op2,
                    items: listaMoneda,
                    onChanged: (String? x) {
                      setState(() {
                        op2 = x.toString();
                      });
                    }),
              ],
            ),
            TextField(
                autofocus: true,
                controller: textOrigen,
                decoration: InputDecoration(
                    labelText: "Origen",
                    hintText: "0",
                    icon: Icon(Icons.monetization_on))),
            TextField(
                enabled: false,
                controller: textDestino,
                decoration: InputDecoration(
                    labelText: "Destino",
                    hintText: "0",
                    icon: Icon(Icons.monetization_on))),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: cal[index].color,
                    child: ListTile(
                      title: Center(
                        child: index == 10
                            ? cal[index].icono
                            : Text(
                                cal[index].titulo,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 50),
                              ),
                      ),
                      onTap: () {
                        if (index < 10) {
                          textOrigen.text = textOrigen.text + cal[index].titulo;
                        } else if (index == 10) {
                          textOrigen.clear();
                          textDestino.clear();
                        } else {
                          if (op1 == "USD" && op2 == "COP") {
                            textDestino.text =
                                (double.parse(textOrigen.text) * 4974.21)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "USD") {
                            textDestino.text =
                                (double.parse(textOrigen.text) / 4974.21)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "COP") {
                            textDestino.text =
                                (double.parse(textOrigen.text) * 4928.15)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "EUR") {
                            textDestino.text =
                                (double.parse(textOrigen.text) / 4928.15)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "USD") {
                            textDestino.text =
                                (double.parse(textOrigen.text) * 0.99)
                                    .toString();
                          } else if (op1 == "USD" && op2 == "EUR") {
                            textDestino.text =
                                (double.parse(textOrigen.text) / 0.99)
                                    .toString();
                          } else {
                            textDestino.text = textOrigen.text;
                          }
                        }
                        print(cal[index].titulo);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
