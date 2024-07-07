import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Team Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            // Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TabButton(label: 'General', selected: true),
                TabButton(label: 'Flag', selected: false),
                TabButton(label: 'Top', selected: false),
              ],
            ),
            SizedBox(height: 16.0),
            // Sub-tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubTabButton(label: 'Teams', selected: true),
                SubTabButton(label: 'Scorer', selected: false),
              ],
            ),
            SizedBox(height: 16.0),
            // Team logos
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                children: [
                  TeamLogo(
                      imagePath: 'assets/images/team1.png',
                      label: 'Saudi Alahli'),
                  TeamLogo(
                      imagePath: 'assets/images/team2.png', label: 'Al Nassr'),
                  TeamLogo(
                      imagePath: 'assets/images/team3.png', label: 'Al Hilal'),
                  TeamLogo(
                      imagePath: 'assets/images/team4.png', label: 'Al Etihad'),
                  TeamLogo(
                      imagePath: 'assets/images/team5.png', label: 'Khaleej'),
                  TeamLogo(
                      imagePath: 'assets/images/team6.png', label: 'Altaawoun'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String label;
  final bool selected;

  TabButton({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selected ? Colors.orange : Colors.grey[200], // Background color
        foregroundColor: selected ? Colors.white : Colors.black, // Text color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

class SubTabButton extends StatelessWidget {
  final String label;
  final bool selected;

  SubTabButton({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: selected ? Colors.orange : Colors.black, // Text color
        backgroundColor:
            selected ? Colors.orange[100] : Colors.white, // Background color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}

class TeamLogo extends StatelessWidget {
  final String imagePath;
  final String label;

  TeamLogo({required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text(label, style: TextStyle(fontSize: 16.0)),
      ],
    );
  }
}
