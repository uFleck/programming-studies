import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlipCardState> _cardKey = GlobalKey<FlipCardState>();

  _renderBackground() {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
    );
  }

  _renderBack() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff993399),
        borderRadius: BorderRadius.all(Radius.circular(28.0)),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              width: double.infinity,
              height: 60.0,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'images/cirrus.png',
              height: 100,
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30, left: 30),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text('0000 0000 0000 0000',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
          ),
        ],
      ),
    );
  }

  _renderFront() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff993399),
        borderRadius: BorderRadius.all(Radius.circular(28.0)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'images/mastercard.png',
                height: 80,
                width: 120,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'images/chip.png',
                height: 50,
                width: 70,
              ),
              Image.asset(
                'images/nfc.png',
                height: 30,
                width: 50,
              ),
            ],
          ),
          Row(
            children: [
              Image.asset(
                'images/nubank.png',
                height: 80,
                width: 120,
              ),
              Text(
                'Bruno Koster',
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }

  _renderCard(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.only(left: 32, right: 32, top: 300, bottom: 300),
      color: Colors.white,
      child: FlipCard(
        key: _cardKey,
        flipOnTouch: true,
        direction: FlipDirection.HORIZONTAL,
        speed: 500,
        onFlipDone: (status) {
          print('status: $status');
        },
        front: _renderFront(),
        back: _renderBack(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          _renderBackground(),
          Column(
            children: [
              Expanded(
                child: _renderCard(context),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _cardKey.currentState.toggleCard(),
        tooltip: 'Girar',
        child: Icon(Icons.flip),
      ),
    );
  }
}
