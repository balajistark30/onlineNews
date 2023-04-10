import 'package:flutter/material.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/helper/news.dart';
import 'package:flutternews/views/home.dart';
import 'article_view.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();


}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async {
    CategoryNewsClass newsclass = CategoryNewsClass();
    await newsclass.getnews(widget.category);
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'News',
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Icon(Icons.save)),
          ),
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ///blogs
              Container(
                height: 800,
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogTile(
                      imageUrl: articles[index].urlTOImage,
                      title: articles[index].title,
                      desc: articles[index].description,
                      url: articles[index].url,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogTile(
      {@required this.imageUrl,
        @required this.title,
        @required this.desc,
        @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ArticleView(
            blogUrl: url,

          )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              desc,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}