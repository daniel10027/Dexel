import 'package:dexel/models/controller.dart';
import 'package:dexel/models/feedback_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final _scaflodKey = GlobalKey<ScaffoldState>();

  TextEditingController nomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  void _submitForm(){

    if(_formKey.currentState!.validate()){
      FeedBackForm feedBackForm = FeedBackForm(nomController.text,
                                               emailController.text, 
                                               contactController.text, 
                                               feedbackController.text);

      FormController formController = FormController(
        (String response){
          print(response);
          if(response == FormController.STATUS_SUCCESS){
              _showSnackBar("Reponse Soumise");
              nomController.clear();
              emailController.clear();
              contactController.clear();
              feedbackController.clear();
          }
          else{
              _showSnackBar("Une erreur est survenue");
          }
        }
      );

       _showSnackBar("Soumission de la reponse...");
      formController.submitForm(feedBackForm);

    }

   
   }

   _showSnackBar(String message){
     final snackBar = SnackBar(content: Text(message),);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar( content: Text(message), duration: Duration(milliseconds: 300), ), );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaflodKey,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            children: [
              TextFormField( 
                controller: nomController,
                validator: (value){
                  if(value!.isEmpty){
                return "Entre un nom valide";
                  } else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Nom"
                ),
              ),
              TextFormField( 
                controller: emailController,
                 validator: (value){
                  if(value!.isEmpty){
                return "Entre un email valide";
                  } else{
                    return null;
                  }
                },
               
                decoration: InputDecoration(
                  hintText: "Email"
                ),
              ),
              TextFormField( 
                controller: contactController,
                 validator: (value){
                  if(value!.isEmpty){
                return "Entre un contact valide";
                  } else{
                    return null;
                  }
                },
         
                decoration: InputDecoration(
                  hintText: "Contact"
                ),
              ),
              TextFormField( 
                controller: feedbackController,
                 validator: (value){
                  if(value!.isEmpty){
                return "Entre une reponse.";
                  } else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "FeedBack"
                ),
              ),
              Spacer(),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              onPrimary: Colors.white,
              shadowColor: Colors.greenAccent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0)),
              minimumSize: Size(100, 40), //////// HERE
            ),
            onPressed: () {
              _submitForm();
            },
            child: Text('Valider'),
          )
            ],
          )),)
    );
  }
}