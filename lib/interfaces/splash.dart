import 'package:droptune/misc/database/database_client.dart';
import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/song_track_adapter/song_track_adapter.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/track.dart';
import 'package:flute_music_player/flute_music_player.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoadingForTheFirstTime = false;

  @override
  void initState() {
    super.initState();
    load(context);
  }

  @override
  Widget build(BuildContext context) {
    Widget built = Scaffold(
        body: Container(
      alignment: Alignment(0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/images/droptune_logo.png',
            height: 125,
            width: 125,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(isLoadingForTheFirstTime
              ? "Initial set up is running, please wait..."
              : "Setting up, please wait..."),)
        ],
      ),
    ));

    return built;
  }

  void load(BuildContext context) async {
    var db = new DatabaseClient();
    await db.create();
    if (await db.alreadyLoaded()) {
      GetItReference.getIt.registerSingleton<List<Track>>(await db.fetchTracks());
      Routing.goToAccessHub(context, clearStack: true);
    } else {
      setState(() {
        isLoadingForTheFirstTime = true;
      });
      var songs;
      songs = await MusicFinder.allSongs();
      List<Song> list = new List.from(songs);
      if (list == null || list.length == 0) {
        print("List-> $list");
        Navigator.of(context).pop(true);
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return Center(
            child: Text("No music found"),
          );
        }));
      } else {
        SongTrackAdapter adapter = SongTrackAdapter(null);

        List<Track> cached = [];
        for (Song song in list) {
          adapter.song = song;
          Track t = Track(
              name: adapter.getName(),
              coverImage: adapter.getCoverImage(),
              album: adapter.getAlbum(),
              author: adapter.getAuthor(),
              duration: adapter.getDuration(),
              path: adapter.getPath(),
              id: adapter.getId(),
              remoteId: adapter.getRemoteId());
          db.insertTrack(t);
          cached.add(t);
        }  
        cached.sort((Track a, Track b){
          return a.name.compareTo(b.name);
        });
        GetItReference.getIt.registerSingleton<List<Track>>(cached);
        Routing.goToAccessHub(context, clearStack: true);
      }
    }
  }
}
