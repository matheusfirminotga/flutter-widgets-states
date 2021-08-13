import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _saved = false;

  void _iconButtonSaveCliked(bool value) {
    setState(() {
      _saved = value;
    });
  }

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
                SavedIcon(
                  saved: _saved,
                  onChanged: _iconButtonSaveCliked,
                ),
                FavoritedLike(),
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

// Aqui o própio widget gerencia seu estado
class FavoritedLike extends StatefulWidget {
  @override
  _FavoritedLikeState createState() => _FavoritedLikeState();
}

class _FavoritedLikeState extends State<FavoritedLike> {
  int _countLikes = 21;
  bool _liked = false;

  void _updateCountLikes() {
    setState(() {
      if (!_liked) {
        _liked = true;
        _countLikes++;
      } else {
        _liked = false;
        _countLikes--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: _liked ? Icon(Icons.star) : Icon(Icons.star_border_outlined),
          onPressed: _updateCountLikes,
          color: Colors.redAccent.shade100,
        ),
        Text(
          '$_countLikes',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}

class SavedIcon extends StatelessWidget {
  const SavedIcon({this.saved = false, required this.onChanged});

  final bool saved;
  final ValueChanged<bool> onChanged;

  void updateIcon() {
    onChanged(!saved);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: saved ? Icon(Icons.favorite_border_outlined) : Icon(Icons.favorite),
      onPressed: updateIcon,
      color: Colors.redAccent.shade100,
    );
  }
}
