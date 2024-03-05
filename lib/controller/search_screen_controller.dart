import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app/model/news_model.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = false;
    notifyListeners();
    final url = Uri.parse(
        'https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=9bcc45dc2b0441088dabcb476cc26f82');
    try {
      final response = await http.get(
        url, headers: {"Content-Type": "application/json"},);
      print(response.statusCode);
      if(response.statusCode==200){
        final Map<String,dynamic>decodedData=jsonDecode(response.body);
        print(decodedData);
      }else{
        print('API failed');
      }
    }
    catch (e){
      print('Error $e');
    }
    finally{
      isLoading=false;
      notifyListeners();
    }
  }
}
