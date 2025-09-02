import 'package:flutter/material.dart';
import 'package:news_app/presentation/widgets/breaking_news.dart';
import 'package:news_app/presentation/widgets/trending_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  List<String> categories = [
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
  ];
  String selectedCategory = 'Business';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Image.asset(
                'assets/icons/man.png',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
              title: Text('Welcome'),
              subtitle: Text(
                'Prashant Nirgun',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: Icon(Icons.notifications),
            ),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 150, child: BreakingNews()),
            SizedBox(height: 10),
            Text(
              'Trending Right Now',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SizedBox(height: 45, child: categoryUI()),
            SizedBox(height: 10),
            Expanded(child: TrendingNews(searchKeyword: selectedCategory)),
          ],
        ),
      ),
    );
  }

  Widget categoryUI() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        String category = categories[index];
        bool isSelected = selectedCategory == category;

        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue : Colors.white,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16.0),
            ),
            onPressed: () {
              selectedCategory = category;
              setState(() {});
            },
            child: Text(
              category,
              style: TextStyle(
                fontSize: 15,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
