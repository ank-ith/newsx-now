import 'package:flutter/material.dart';
import 'package:news_app/controller/home_screen_controller.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  Widget build(BuildContext context) {
    HomeScreenController provider = Provider.of<HomeScreenController>(context);
    return Scaffold(
      appBar: AppBar(title: Text("NEWX NOW 📰",),
        backgroundColor: Color(0xff6A3DE8),
        elevation: 0,
        titleTextStyle: TextStyle(),)
      , body: Provider
        .of<HomeScreenController>(context)
        .isLoading == true
        ? Center(child: CircularProgressIndicator())
        : Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(itemBuilder: (context, index) =>
          NewsCard(
            title: provider.newsModel.articles?[index].title.toString() ?? '',
            description: provider.newsModel.articles?[index].description
                .toString() ?? '',
            date: provider.newsModel.articles?[index].publishedAt,
            imageUrl: provider.newsModel.articles?[index].urlToImage
                .toString() ?? '' '',
            content: provider.newsModel.articles?[index].content.toString() ??
                '',
            sourceName: provider.newsModel.articles?[index].source?.name
                .toString() ?? '',
            url: provider.newsModel.articles?[index].url
                .toString() ??
                "",),
          separatorBuilder: (context, index) => Divider(height: 20,),
          itemCount: provider.newsModel.articles?.length ?? 0),
    ),);
  }


}

