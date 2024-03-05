import 'package:flutter/material.dart';
import 'package:news_app/controller/category_controller.dart';
import 'package:news_app/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  void fetchData() async {
    Provider.of<CategoryScreenController>(context, listen: false).fetchData();
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    CategoryScreenController provider =
        Provider.of<CategoryScreenController>(context);
    return DefaultTabController(
        length: provider.categoryList.length,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              titleTextStyle: TextStyle(
                  color: Color(0xff6A3DE8),
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              title: Text('Categories'),
              bottom: TabBar(
                labelStyle: TextStyle(
                    color: Color(0xff6A3DE8), fontWeight: FontWeight.w600),
                labelColor: Colors.white,
                unselectedLabelColor: Color(0xff6A3DE8),
                indicatorPadding: EdgeInsets.symmetric(horizontal: 5),
                unselectedLabelStyle: TextStyle(
                    color: Color(0xff6A3DE8),
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
                overlayColor: MaterialStatePropertyAll(Colors.grey),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color: Color(0xff6A3DE8),
                    borderRadius: BorderRadius.circular(10)),
                isScrollable: true,
                tabs: List.generate(
                    provider.categoryList.length,
                    (index) => Tab(
                          text: provider.categoryList[index],
                        )),
                onTap: (value) {
                  provider.onTap(index: value);
                },
              ),
            ),
            body: provider.isLoading == true
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
                        title: provider.newsModel.articles?[index].title.toString() ??
                            '',
                        description: provider.newsModel.articles?[index].description
                                .toString() ??
                            '',
                        date: provider.newsModel.articles?[index].publishedAt,
                        imageUrl: provider.newsModel.articles?[index].urlToImage
                                .toString() ??
                            '',
                        content: provider.newsModel.articles?[index].content
                                .toString() ??
                            '',
                        sourceName:
                            provider.newsModel.articles?[index].source?.name.toString() ?? '',
                        url: provider.newsModel.articles?[index].url.toString() ?? ''),
                    separatorBuilder: (context, index) => Divider(height: 20,),
                    itemCount: provider.newsModel.articles?.length??0)));
  }
}
