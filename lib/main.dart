import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find your game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Find your game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Center(child: Text(widget.title)),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth:
                    constraints.maxWidth > 800 ? 800 : constraints.maxWidth,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Vous souhaitez jouer, mais vous n\'arrivez pas à vous décider ? ',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Répondez rapidement à ces question sur vos envies et nous nous chargerons du reste !',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    ElevatedButton.icon(
                      onPressed: () => print('ToDo'),
                      icon: Icon(
                        Icons.search,
                        color: theme.colorScheme.onPrimary,
                      ),
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Commencer'),
                          SizedBox(width: 16),
                        ],
                      ),
                      iconAlignment: IconAlignment.end,
                      style: ElevatedButton.styleFrom(
                        iconSize: 40,
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                        textStyle: TextStyle(fontSize: 26),
                        padding: const EdgeInsets.all(20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
