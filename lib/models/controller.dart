import 'package:dexel/models/feedback_form.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class FormController{ 

  final void Function(String) callback;

  static const String URL = "https://script.google.com/macros/s/AKfycbzQNuHgYUUJwj0nuqrDq_Fmg3_FBWWj5WGpaYYeP2-IPQBW4vgVw8Ts-LfIk5gvTkKfmw/exec";

  static const STATUS_SUCCESS = "SUCCESS";

  FormController(this.callback);

  void submitForm(FeedBackForm feedBackForm) async { 

    try{
      
      await http.get(Uri.parse(URL + feedBackForm.toParams()))
      .then((response){
          callback(convert.jsonDecode(response.body)['status']);
      });

    } catch(e){

      print(e);

    }

  }
}