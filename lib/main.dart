import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        body: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 2,
            childAspectRatio: .5,
            // Generate 100 widgets that display their index in the List.
            children: [
              new RotatedBox(quarterTurns: 1, child: _buildCard(1)),
              new RotatedBox(quarterTurns: 3, child: _buildCard(2)),
              new RotatedBox(quarterTurns: 1, child: _buildCard(3)),
              new RotatedBox(quarterTurns: 3, child: _buildCard(0)),
            ]),
      ),
    );
  }
}

class PlayerCard extends StatefulWidget {
  const PlayerCard({Key? key}) : super(key: key);

  @override
  _PlayerCardState createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  int _counter = 40;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      IconButton(
        icon: const Icon(Icons.add),
        tooltip: 'Increase volume by 10',
        onPressed: () {
          incrementCounter();
        },
      ),
      Text(
        '$_counter',
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
      IconButton(
        icon: const Icon(Icons.remove),
        tooltip: 'Increase volume by 10',
        onPressed: () {
          decrementCounter();
        },
      ),
    ]));
  }
}

Widget _buildCard(bgNumber) {
  var _backgrounds = [
    'https://c1.scryfall.com/file/scryfall-cards/art_crop/front/4/2/42a97ec1-f613-49a5-9236-7fded1a81f3b.jpg?1625190690',
    'https://c1.scryfall.com/file/scryfall-cards/art_crop/front/2/5/2501a911-d072-436d-ae3b-a5164e3b30aa.jpg?1637627743',
    'https://c1.scryfall.com/file/scryfall-cards/art_crop/front/0/3/03f4341c-088b-4f35-b82b-3d98d8a93de4.jpg?1576382166',
    'https://c1.scryfall.com/file/scryfall-cards/art_crop/front/b/b/bbc3bbda-a4bc-4302-a3fc-b1c89f0f5461.jpg?1608909299'
  ];
  return Container(
      child: PlayerCard(),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(_backgrounds[bgNumber]),
        fit: BoxFit.cover,
        colorFilter: new ColorFilter.mode(
            Colors.black.withOpacity(0.4), BlendMode.dstATop),
      )));
}
