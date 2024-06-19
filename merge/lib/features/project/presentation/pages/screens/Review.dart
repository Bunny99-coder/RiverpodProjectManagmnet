import 'package:flutter/material.dart';
import 'userProfile.dart';
import 'package:merge/features/project/presentation/widget/reusableWidgets.dart';

void main() {
  runApp(Review());
}

class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Applications',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.account_circle),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Color.fromRGBO(83, 92, 145, 1),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Handle home tap
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Handle logout tap
              },
            ),
            ListTile(
              title: Text('Projects'),
              onTap: () {
                // Handle setting tap
              },
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                // Handle setting tap
              },
            ),
            ListTile(
              title: Text('FAQ'),
              onTap: () {
                // Handle FAQ tap
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardWidget(
              title: 'Hospital management',
              description: [
                'Languages: react,nodejs',
                'Duration: Two months',
                'Application deadline: March 2, 2024.',
                'Intake capacity: 2 developers',
              ],
              imageAssetPath: 'assets/hospital.jpg',
              editAction: () {
                // Handle edit action
              },
              deleteAction: () {
                // Handle delete action
              },
            ),
            CardWidget(
              title: 'Task management',
              description: [
                'Languages: Angular,nodejs',
                'Duration: Five months',
                'Application deadline: August 23, 2024.',
                'Intake capacity: 3 software engineers',
              ],
              imageAssetPath: 'assets/task.jpg',
              editAction: () {
                // Handle edit action
              },
              deleteAction: () {
                // Handle delete action
              },
            ),
            CardWidget(
              title: 'Library management',
              description: [
                'Languages: react,nodejs',
                'Duration: Two months',
                'Application deadline: Dec 4, 2024.',
                'Intake capacity: 1 UI designer 2 developers',
              ],
              imageAssetPath: 'assets/Library.jpg',
              editAction: () {
                // Handle edit action
              },
              deleteAction: () {
                // Handle delete action
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final List<String> description;
  final String imageAssetPath;
  final Function editAction;
  final Function deleteAction;

  const CardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.imageAssetPath,
    required this.editAction,
    required this.deleteAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Color.fromRGBO(255, 247, 252, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              imageAssetPath,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: description
                      .map(
                        (line) => Text(
                          '• $line',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: editAction as void Function()?,
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(83, 92, 145, 1),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: deleteAction as void Function()?,
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(83, 92, 145, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Handle search results display
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Return empty list view to remove suggestions
    return ListView();
  }
}
