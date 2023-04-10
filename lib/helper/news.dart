import 'dart:convert';
import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/views/home.dart';
import 'package:http/http.dart' as http;
class News{

  List<ArticleModel> news =[];

   Future<void> getnews(dropdownValue) async{


     var url =Uri.parse("https://newsapi.org/v2/top-headlines?country=$dropdownValue&apiKey=dab8b325692d4be18ee228bb84441cde");
     var response = await http.get(url);
     
     var jsondata = jsonDecode(response.body);

     if(jsondata['status']=='ok'){
       jsondata['articles'].forEach((element){
         if(element["urlToImage"] != null && element["description"] != null){
           ArticleModel articleModel = ArticleModel(
             title: element['title'],
             author: element["author"],
             description: element["description"],
             url: element["url"],
             urlTOImage: element["urlToImage"],
             content: element["context"]
           );
           news.add(articleModel);

         }
       },);
     }

   }
  

}
class CategoryNewsClass{

  List<ArticleModel> news =[];

  Future<void> getnews(String category) async{
    var url =Uri.parse("https://newsapi.org/v2/top-headlines?country=$dropdownValue&category=$category&apiKey=dab8b325692d4be18ee228bb84441cde");
    var response = await http.get(url);

    var jsondata = jsonDecode(response.body);

    if(jsondata['status']=='ok'){
      jsondata['articles'].forEach((element){
        if(element["urlToImage"] != null && element["description"] != null){
          ArticleModel articleModel = ArticleModel(
              title: element['title'],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlTOImage: element["urlToImage"],
              content: element["context"]
          );
          news.add(articleModel);

        }
      },);
    }

  }


}