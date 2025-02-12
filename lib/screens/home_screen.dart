import 'package:flutter/material.dart';
import '../widgets/max_widh_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Center(child: Text("Find your game")),
      ),
      body: MaxWidthContainer(
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
                'Répondez rapidement à ces questions sur vos envies et nous nous chargerons du reste !',
                style: TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  // Naviguer vers le formulaire
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Container(), // ToDO
                    ),
                  );
                },
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
  }
}
