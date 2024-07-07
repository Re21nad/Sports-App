import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.white,
      ),
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('ar', 'SA'), // Arabic
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _changeLanguage(String languageCode, String countryCode) {
    setState(() {});
  }

  void _showComingSoonDialog(BuildContext context, String sport) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$sport'),
          content: Text('Coming Soon!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.language),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'en',
                child: Text('English'),
              ),
              PopupMenuItem<String>(
                value: 'ar',
                child: Text('العربية'),
              ),
            ],
            onSelected: (String value) {
              if (value == 'en') {
                _changeLanguage('en', 'US');
              } else if (value == 'ar') {
                _changeLanguage('ar', 'SA');
              }
            },
          ),
          IconButton(
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile_pic.png'),
              radius: 50.0,
            ),
            onPressed: () {
              // Handle profile button tap
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Shatha Alhakami',
                    style: TextStyle(fontSize: 16.0, color: Colors.orange),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Last News:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  ),
                ],
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  NewsCard(imagePath: 'assets/images/news1.png'),
                  NewsCard(imagePath: 'assets/images/news2.png'),
                  NewsCard(imagePath: 'assets/images/news3.png'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Sports',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              padding: const EdgeInsets.all(16.0),
              children: [
                SportCard(
                  imagePath: 'assets/images/football.png',
                  sport: 'Football',
                  onTap: () => _showComingSoonDialog(context, 'Football'),
                ),
                SportCard(
                  imagePath: 'assets/images/basketball.png',
                  sport: 'Basketball',
                  onTap: () => _showComingSoonDialog(context, 'Basketball'),
                ),
                SportCard(
                  imagePath: 'assets/images/tennis.png',
                  sport: 'Tennis',
                  onTap: () => _showComingSoonDialog(context, 'Tennis'),
                ),
                SportCard(
                  imagePath: 'assets/images/cricket.png',
                  sport: 'Cricket',
                  onTap: () => _showComingSoonDialog(context, 'Cricket'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final String imagePath;

  NewsCard({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Adjust the width as needed
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SportCard extends StatelessWidget {
  final String imagePath;
  final String sport;
  final VoidCallback onTap;

  SportCard(
      {required this.imagePath, required this.sport, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(sport, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
