import 'package:droptune/models/album.dart';
import 'package:flutter/material.dart';

import 'package:droptune/models/author.dart';

class Track {
  Track(
      {this.id,
      @required this.coverImage,
      this.remoteId,
      @required this.name,
      @required this.duration,
      @required this.path,
      @required this.author,
        @required this.album});

  final int id;
  final AssetImage coverImage;
  final int remoteId;
  final String name;
  final Duration duration;
  final String path;
  final Author author;
  final Album album;
/*final User user;*/
}
