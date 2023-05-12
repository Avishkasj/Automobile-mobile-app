import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class NetworkUtiliti{
  Future<String?>? fetchUrl(Uri uri,{Map<String, String>? headers}) async {
    try{
      final responce = await http.get(uri, headers: headers);
      if(responce.statusCode == 200){
        return responce.body;
      }


    }catch(e){
      debugPrint(e.toString());
    }
    return null;
  }

}