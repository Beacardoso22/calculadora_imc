import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CALCULADORA DE IMC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


 
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  String resultadoImc = '';
  void _incrementCounter() {
    setState(() {
  
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
       
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Image.asset('assets/imc.png'),
                width: 150,
                height: 200,
              ),
              const Text(
                'CALCULADORA DE IMC',
              ),

             const SizedBox(height: 16),
             TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: controllerPeso,
              decoration: const InputDecoration(
                labelText: 'Peso' ,
                hintText: 'Digite seu peso',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))
                )
              ),
             ),
             const SizedBox(height: 16),
             TextFormField(
              keyboardType: TextInputType.numberWithOptions(),
              controller: controllerAltura,
              decoration: const InputDecoration(
                labelText: 'Altura',
                hintText: 'Digite sua altura',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))
                )
              ),
             ),

             const SizedBox(height: 32),
         Text(resultadoImc, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),

             const SizedBox(height: 32),
             Container(
              width: 200,
               child: ElevatedButton(
                onPressed: (){
                setState(() {
                   num numAux = (num.parse(controllerPeso.text) / (num.parse(controllerAltura.text) * 
                 num.parse(controllerAltura.text)));

                 resultadoImc = numAux.toStringAsFixed(2);
                });
                },
                child:const Text('Calcular')),
             )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            resultadoImc = '';
          });
        },
        tooltip: 'Increment',
        child: Text('Limpar')
      ), 
    );
  }
}
