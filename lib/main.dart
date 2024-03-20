import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          toolbarHeight: 70
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController motController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


     int countA = 0;
    int countE = 0;
    int countI = 0;
    int countO = 0;
    int countU = 0;
    int countY = 0;
    int countConsommes = 0;



    calculVoyelle(String mot){
      for(int i=0 ; i < mot.length ; i++){
        switch (mot[i].toUpperCase()){
          case 'A' : {
            setState(() {
              countA++;
            });
            break;
          }
          case 'E' : {
            setState(() {
              countE++;
            });
            break;
          }
          case 'I' : {
            setState(() {
              countI++;
            });
            break;
          }
          case 'O' : {
            setState(() {
              countO++;
            });
            break;
          }
          case 'U' : {
            setState(() {
              countU++;
            });
            break;
          }
          case 'Y' : {
            setState(() {
              countY++;
            });
            break;
          }
        }
      }

      setState(() {
        countConsommes = mot.length - (countA+countE+countI+countO+countU+countY);
      });
    }


    reset(){
      setState(() {
        countA = 0;
    countE = 0;
    countI = 0;
    countO = 0;
    countU = 0;
    countY = 0;
    countConsommes = 0;
    motController.text = '';
      });
    }

    @override
  void initState() {
    super.initState();
    countA = 0;
    countE = 0;
    countI = 0;
    countO = 0;
    countU = 0;
    countY = 0;
    countConsommes = 0;
  }
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("ANALYSE VOYELLE"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
        
        
            Form(
              key: _formKey,
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: motController,
                validator: (value) {
                  if(value!.isEmpty){
                    return 'Champ obligatoir !';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Entrez un mot",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  contentPadding: const EdgeInsets.all(17),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(                
                      color: Colors.grey.shade500
                    )
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(                
                      color: Colors.red
                    )
                  ),
                ),
              ),
            ),
        
        
            const SizedBox(height: 10,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color?>(Colors.blue),
                    fixedSize: MaterialStateProperty.all<Size?>(const Size.fromWidth(150)),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
                    shape: MaterialStateProperty.all(BeveledRectangleBorder(borderRadius: BorderRadius.circular(2)))
                  ),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      calculVoyelle(motController.text);
                    }
                }, child: const Center(
                  child: Text("Analyser", style: TextStyle(color: Colors.white, fontSize: 15),),
                )),

                const SizedBox(width: 10,),

                InkWell(
                  onTap: () {
                    reset();
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromARGB(255, 6, 50, 85)
                    ),
                    child:  const Center(child: Icon(Icons.replay_outlined, color: Colors.white,)),
                  ),
                )
              ],
            ),
        
        
            const SizedBox(height: 50,),
        
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text('a : $countA occurences', style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
                ),),
                ),
            ),
        
        
        
        
             const SizedBox(height: 15,),
        
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text('e : $countE occurences', style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
                ),),
                ),
            ),
        
        
        
             const SizedBox(height: 15,),
        
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 181, 181, 2),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text('I : $countI occurences', style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
                ),),
                ),
            ),
        
        
        
             const SizedBox(height: 15,),
        
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text('O : $countO occurences', style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
                ),),
                ),
            ),
        
        
        
             const SizedBox(height: 15,),
        
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text('U : $countU occurences', style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
                ),),
                ),
            ),
        
        
        
        
             const SizedBox(height: 15,),
        
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 109, 225, 158),
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text('Y : $countY occurences', style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
                ),),
                ),
            ),
        
        
        
             const SizedBox(height: 15,),
        
        
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Text('Consommes : $countConsommes occurences', style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600
                ),),
                ),
            ),
        
          ],
        ),
      ),
    );
    
  }
}
