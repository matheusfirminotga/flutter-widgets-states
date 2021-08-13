import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _countLikes = 0;
  bool _liked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Flutter App 6'),
        backgroundColor: Colors.redAccent.shade200,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                'https://cdn.pixabay.com/photo/2016/06/20/23/50/mixed-berries-1470228_960_720.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Torta de Brigadeiro',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                              color: Colors.redAccent.shade200,
                            ),
                          ),
                          Text(
                            'Cobertura de Leite Condensado',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 0.5,
                              color: Colors.redAccent.shade100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      icon: _liked
                          ? Icon(Icons.star)
                          : Icon(Icons.star_border_outlined),
                      onPressed: () {
                        if (!_liked) {
                          setState(() {
                            _liked = true;
                            _countLikes++;
                          });
                        } else {
                          setState(() {
                            _liked = false;
                            _countLikes--;
                          });
                        }
                      },
                      color: Colors.redAccent.shade100,
                    ),
                    Text(
                      '$_countLikes Curtidas',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 12.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.pie_chart_outline,
                      color: Colors.grey[700],
                    ),
                    Text(
                      '6',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Porções',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      Icons.timer,
                      color: Colors.grey[700],
                    ),
                    Text(
                      '35',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      'Minutos',
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 12.0, right: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 12.0),
                        child: Divider(),
                      ),
                    ),
                    Text(
                      'Modo de Preparo',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8.0)),
                Text(
                  'Para fazer esta receita você precisa 500mL de leite condensado, 400g de farinha de trigo, '
                  '800mL de água filtrada e 100g de açucar. Logo depois, junte tudo e misture por pelo menos 15 minutos.'
                  'Você terá uma massa pronta, após isso coloque recheio ao seu gosto e decore como quiser.',
                  softWrap: true,
                  style: TextStyle(
                    fontSize: 14.0,
                    letterSpacing: 0.2,
                    color: Colors.grey[700],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Divider(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
