part of "pages.dart";

class AnimeDetailPage extends StatefulWidget {
  const AnimeDetailPage({super.key});

  @override
  State<AnimeDetailPage> createState() => _AnimeDetailPageState();
}

class _AnimeDetailPageState extends State<AnimeDetailPage> {
  bool iconPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anime Detail"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset("assets/images/genshin bg.jpg",
                      fit: BoxFit.fill
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10.0, 5.0, 0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.black45,
                          child: IconButton(
                              onPressed: (){
                                setState(() {
                                  if(iconPressed){
                                    ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
                                      content: Text("Genshin Impact has been removed from your list!"),
                                      duration: Duration(seconds: 1),
                                    ));
                                    iconPressed = false;
                                  }else{
                                    ScaffoldMessenger.of(this.context).showSnackBar(SnackBar(
                                      content: Text("Genshin Impact has been added to your list!"),
                                      duration: Duration(seconds: 1),
                                    ));
                                    iconPressed = true;
                                  }
                                  
                                });
                              },
                              iconSize: 30,
                              icon: (iconPressed) ? Icon(
                                          Icons.favorite, 
                                          color: Colors.red,
                                        ) 
                                        : Icon(
                                          Icons.favorite_outline
                                        )
                            ),
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
            Flexible(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/genshin1.jpg",
                              fit: BoxFit.fill,
                            ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/genshin2.jpg",
                              fit: BoxFit.fill,
                            ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/genshin3.jpg",
                              fit: BoxFit.fill,
                            ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/images/genshin4.jpg",
                              fit: BoxFit.fill,
                            ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
            Flexible(
              flex: 4,
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  children: [
                    Text(
                      "Genshin Impact",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text("Genshin Impact is an open-world action RPG with “gacha” (we’ll go over that later on) mechanics. It is developed and published by Chinese studio miHoYo. In it, players control a number of party members, each with different abilities, weapons, gear, and personalities. The combat plays out in real time, allowing players to utilize ranged, melee, and elemental attacks against a wide array of enemies across the game’s open world and dungeons.", 
                                        style: TextStyle(
                                          fontSize: 17
                                        ),
                                    ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Text("Genshin Impact is an online-only adventure that heavily leans into story and multiplayer — with many features you’d see in popular games as a service (like daily quests, rewards, loot, and other things to keep you checking in).", 
                                        style: TextStyle(
                                          fontSize: 17
                                        ),
                                    ),
                          ),
                          Container( 
                            padding: EdgeInsets.all(8),
                            child: Text("Many critics and players have compared Genshin Impact to The Legend of Zelda: Breath of the Wild with an anime twist. It’s a fair comparison, as many of the environments and locales resemble one another across both games. The biggest similarity is that you’re able to climb almost any surface in Genshin and the amount you can climb is dictated by a stamina meter — just like in Breath of the Wild. Once you get to the top of your destination, you can glide off, allowing you to travel quickly around the map — yet another similarity.", 
                                        style: TextStyle(
                                          fontSize: 17
                                        ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BookForm()));
        },
        backgroundColor: Colors.black87,
        label: Text(
          "Book Now",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}