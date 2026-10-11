
import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetLayoutDemo());
}

class WidgetLayoutDemo extends StatelessWidget {
  const WidgetLayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab 2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
        useMaterial3: true,
      ),
      home: const LayoutHomePage(),
    );
  }
}

class LayoutHomePage extends StatelessWidget {
  const LayoutHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Layout Demo',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            indicatorColor: Colors.amber,
            tabs: [
              Tab(text: 'Widgets'),
              Tab(text: 'Row'),
              Tab(text: 'Column'),
              Tab(text: 'Stack'),
            ],
          ),
        ),

        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo, Colors.blue],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.phone_android,
                      size: 45,
                      color: Colors.white,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Flutter Lab 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Widgets and Layouts',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              _drawerItem(context, Icons.widgets, 'Basic Widgets', 0),
              _drawerItem(context, Icons.view_week, 'Row Layout', 1),
              _drawerItem(context, Icons.view_agenda, 'Column Layout', 2),
              _drawerItem(context, Icons.layers, 'Stack Layout', 3),
            ],
          ),
        ),

        body: const TabBarView(
          children: [
            WidgetsPage(),
            RowPage(),
            ColumnPage(),
            StackPage(),
          ],
        ),
      ),
    );
  }

  static Widget _drawerItem(
    BuildContext context,
    IconData icon,
    String title,
    int tabIndex,
  ) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(title),
      onTap: () {
        DefaultTabController.of(context).animateTo(tabIndex);
        Navigator.pop(context);
      },
    );
  }
}

// PART A: BASIC WIDGETS

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Basic Flutter Widgets',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Explore Text, Image and Container widgets.',
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(height: 20),

        const Text(
          '1. Styled Text',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Welcome to Flutter!',
          style: TextStyle(
            fontSize: 27,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Flutter makes UI development simple.',
          style: TextStyle(
            fontSize: 17,
            color: Colors.deepOrange,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 22),

        const Text(
          '2. Image in a Decorated Container',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFE3F2FD), Color(0xFFE8EAF6)],
            ),
            border: Border.all(color: Colors.indigo, width: 2),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/600/300',
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 170,
                      color: Colors.blue.shade100,
                      child: const Center(
                        child: Icon(
                          Icons.image_not_supported,
                          size: 60,
                          color: Colors.indigo,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Image inside a decorated Container',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'Hello, Flutter!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.amber.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Text(
            'This container demonstrates padding, margin, '
            'background color and rounded corners.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// PART B: ROW LAYOUT

class RowPage extends StatelessWidget {
  const RowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Row Layout',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'A Row arranges its children horizontally.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 30),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.indigo.shade50,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.indigo),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.star, size: 42, color: Colors.amber),
                  SizedBox(height: 8),
                  Text('Star'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.favorite, size: 42, color: Colors.red),
                  SizedBox(height: 8),
                  Text('Favorite'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.thumb_up, size: 42, color: Colors.blue),
                  SizedBox(height: 8),
                  Text('Like'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 25),
        const Text(
          'MainAxisAlignment.spaceEvenly distributes the children '
          'with equal spacing.',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }
}

// COLUMN LAYOUT

class ColumnPage extends StatelessWidget {
  const ColumnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Column Layout',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'A Column arranges its children vertically.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.green.shade50,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.green),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Beautiful Nature',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 15),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/500/280',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.green.shade100,
                      child: const Center(
                        child: Icon(
                          Icons.landscape,
                          size: 70,
                          color: Colors.green,
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Nature provides fresh air, beautiful landscapes and '
                'a peaceful environment. This section demonstrates '
                'vertical arrangement using the Column widget.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// STACK LAYOUT

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Stack Layout',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'A Stack places widgets on top of one another.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 25),

        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              Image.network(
                'https://picsum.photos/700/400',
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 260,
                    width: double.infinity,
                    color: Colors.indigo.shade200,
                    child: const Icon(
                      Icons.landscape,
                      size: 80,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                  child: const Text(
                    'Explore the World!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Flutter Stack',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),
        const Text(
          'The Positioned widget controls the placement of text '
          'and labels over the background image.',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        const SizedBox(height: 20),

        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            Container(
              height: 90,
              width: 220,
              decoration: BoxDecoration(
                color: Colors.blue.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Overlapping Containers',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}