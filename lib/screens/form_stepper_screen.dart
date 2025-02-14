import 'dart:collection';

import 'package:find_your_game/widgets/show_games.dart';
import 'package:flutter/material.dart';
import '../widgets/max_widh_container.dart';
import '../widgets/form_inputs/numeric_step_button.dart';

class FormStepperScreen extends StatefulWidget {
  @override
  _FormStepperScreenState createState() => _FormStepperScreenState();
}

final gameTimes = ['< 30', '30 - 60', '> 60'];
final partyStyles = ['alone', 'team', 'coop'];
final partyStylesText = {
  'alone': 'Chacun pour soi',
  'team': 'Equipe',
  'coop': 'Coopératif',
};

final List<String> gameStyles = <String>[
  'deckbuilding',
  'roll_and_write',
  'ambiance',
];

final gameStylesText = {
  'deckbuilding': 'Deckbuilding',
  'roll_and_write': 'Roll & Write',
  'ambiance': 'Ambiance',
};

typedef MenuEntry = DropdownMenuEntry<String>;

class _FormStepperScreenState extends State<FormStepperScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  String? _value = '15';

  String dropdownValue = gameStyles.first;

  final TextEditingController _playerNumberController = TextEditingController();
  final TextEditingController _playerAgeBoolController =
      TextEditingController();
  final TextEditingController _playerAgeController = TextEditingController();
  final TextEditingController _gameLengthController = TextEditingController();
  final TextEditingController _partyGameController = TextEditingController();
  final TextEditingController _styleGameController = TextEditingController();

  late final List<TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = [
      _playerNumberController,
      _playerAgeBoolController,
      _playerAgeController,
      _gameLengthController,
      _partyGameController,
      _styleGameController,
    ];
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  bool _isYoungPlayerChecked = false;

  void _nextPage() {
    if (_currentPage < 1) {
      setState(() {
        _currentPage++;
      });
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      setState(() {
        _currentPage--;
      });
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  final pageHeader = ['Informations sur la soirée', 'Informations sur le jeu'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: Center(child: Text("Formulaire - ${pageHeader[_currentPage]}")),
      ),
      body: MaxWidthContainer(
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(), // Empêche le swipe
          children: [
            _buildFirstForm(),
            _buildSecondForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildFirstForm() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Parlez-nous de votre soirée:",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          Wrap(
            runSpacing: 10.0,
            children: [
              NumericStepButton(
                controller: _playerNumberController,
                maxValue: 50,
                label: "Nombre de joueurs:",
                defaultValue: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Y a-t-il de jeunes joueurs (<14 ans) ?',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 65),
                    child: Checkbox(
                      value: _isYoungPlayerChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isYoungPlayerChecked = value ?? false;
                        });
                      },
                    ),
                  )
                ],
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300), // Animation speed
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(
                    sizeFactor: animation, // Animates the height
                    axisAlignment: 1.0,
                    child: FadeTransition(opacity: animation, child: child),
                  );
                },
                child: _isYoungPlayerChecked
                    ? NumericStepButton(
                        key: ValueKey(true), // Ensures proper animation
                        controller: _playerAgeController,
                        maxValue: 14,
                        label: "Age du plus jeune:",
                        defaultValue: 8,
                      )
                    : SizedBox.shrink(), // Prevents layout shift
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Temps de jeu:',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Wrap(spacing: 5.0, children: [
                    for (var time in gameTimes)
                      ChoiceChip(
                        label: Text('${time} min'),
                        selected: _value == time,
                        onSelected: (bool selected) {
                          setState(() {
                            _value = selected ? time : null;
                          });
                        },
                      )
                  ]
                      // List<Widget>.generate(3, (int index) {
                      //   return
                      // }).toList(),
                      ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed: _nextPage, child: Text("Next")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSecondForm() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Exprimez vos envies:",
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: 30,
          ),
          Wrap(
            runSpacing: 10.0,
            spacing: 20.0,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Ambiance:',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  Wrap(spacing: 5.0, children: [
                    for (var style in partyStyles)
                      ChoiceChip(
                        label: Text('${partyStylesText[style]}'),
                        selected: _partyGameController.text == style,
                        onSelected: (bool selected) {
                          setState(() {
                            _partyGameController.text = selected ? style : '';
                          });
                        },
                      )
                  ]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Style:',
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                  DropdownMenu<String>(
                    initialSelection: gameStyles.first,
                    onSelected: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                        _styleGameController.text = value;
                        print(_controllers[5]);
                      });
                    },
                    dropdownMenuEntries: gameStyles
                        .map<DropdownMenuEntry<String>>((String style) {
                      return DropdownMenuEntry<String>(
                        value: style,
                        label: gameStylesText[style] ??
                            style,
                      );
                    }).toList(),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(onPressed: _previousPage, child: Text("Back")),
            ],
          ),
          SizedBox(height: 30),
          Text(
            'Ces jeux peuvent vous convenir:',
            style: TextStyle(fontSize: 26),
          ),
          SizedBox(height: 30),
          ShowGames(controllers: _controllers),
        ],
      ),
    );
  }
}
