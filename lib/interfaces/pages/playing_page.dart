import 'package:droptune/interfaces/pages/queue_page.dart';
import 'package:droptune/misc/droptune_utils.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:droptune/models/author.dart';
import 'package:droptune/models/playlist.dart';
import 'package:droptune/models/track.dart';
import 'package:flutter/material.dart';

class PlayingPage extends StatefulWidget {
  final Track currentTrackArtifical;
  final Playlist playlist;

  PlayingPage(this.currentTrackArtifical, {this.playlist});

  @override
  State createState() {
    return _PlayingPageState(currentTrackArtifical);
  }
}

class _PlayingPageState extends State<PlayingPage> {
  List<Track> _trackss = [
    Track(
        id: 1,
        name: "Thunderstruck",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 2,
        name: "Dio cane",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 3,
        name: "Dio boia",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 4,
        name: "Porco dio",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 5,
        name: "Dio porco",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 6,
        name: "Dio negro",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 7,
        name: "Dio a",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 8,
        name: "Dio b",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 9,
        name: "Dio c",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 10,
        name: "Dio d",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 11,
        name: "Dio e",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
    Track(
        id: 12,
        name: "Dio f",
        path: "",
        duration: Duration(minutes: 3, seconds: 1),
        coverImage: AssetImage('assets/images/default_song_image.jpg'),
        authors: <Author>[Author(name: "AC/DC", tracks: [])]),
  ];

  Track currentTrack;
  double _sliderProgress = 0;
  bool dismissed = false;

  _PlayingPageState(this.currentTrack);

  Widget _buildTitleAndSettings() {
    return Column(
      children: <Widget>[
        Text(
          currentTrack.name,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
        Text(DroptuneUtils.buildAuthorsLabel(currentTrack),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.black45))
      ],
    );
  }

  Widget _buildSlider(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Slider(
          activeColor: Colors.cyan,
          value: _sliderProgress,
          max: 100,
          inactiveColor: Colors.grey[400],
          onChanged: (double newProgress) {
            setState(() {
              _sliderProgress = newProgress;
            });
          }),
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Flexible(
            flex: 11,
            child: Padding(
              padding: EdgeInsets.all(9),
              child: Image.asset('assets/images/shuffle_icon.png'),
            )),
        Flexible(
          flex: 20,
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Transform.rotate(
                angle: 3.14,
                child: Image.asset('assets/images/forward_button.png')),
          ),
        ),
        Flexible(
            flex: 40,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment(0, 0),
                  child: Icon(
                    Icons.pause,
                    size: 40,
                    color: Colors.white,
                  ),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment(0, 0),
                          image: AssetImage(
                              'assets/images/pause_play_button.png'))),
                ),
              ),
            )),
        Flexible(
            flex: 20,
            child: Padding(
              padding: EdgeInsets.all(7),
              child: Image.asset('assets/images/forward_button.png'),
            )),
        Flexible(
            flex: 11,
            child: Padding(
              padding: EdgeInsets.all(9),
              child: Image.asset('assets/images/repeat_icon.png'),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
      onResize: () {
        if (dismissed) return;
        Navigator.of(context).pop();
        dismissed = true;
      },
      key: Key('playing page'),
      direction: DismissDirection.vertical,
      child: Scaffold(
        body: SafeArea(
            child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.15), BlendMode.dstATop),
                  image: currentTrack.coverImage,
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black45,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                    widget.playlist != null &&
                            widget.playlist.name != "All tracks"
                        ? Column(
                            children: <Widget>[
                              Text(
                                "Reproducing from playlist",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                widget.playlist.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15),
                              )
                            ],
                          )
                        : Container(),
                    Container(
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: 15, top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            Routing.goToQueue(context, _trackss,
                                clearStack: false);
                          },
                          child: Image(
                            color: Colors.black54,
                            image: AssetImage("assets/images/queue_icon.png"),
                            width: 21,
                            height: 21,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 20,
                child: Container(),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 45),
                    child: _buildTitleAndSettings(),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: _buildSlider(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 25, right: 25),
                    child: _buildControls(),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
