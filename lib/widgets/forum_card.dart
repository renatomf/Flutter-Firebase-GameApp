import 'package:flutter/material.dart';

import '../models/forum.dart';
import '../screens/details_page.dart';
import './forum_details_widget.dart';
import './forum_name_widget.dart';

class ForumCard extends StatelessWidget {
  final Forum forum;

  ForumCard({this.forum});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: forum.title,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsPage(forum: forum)));
          },
          child: SizedBox(
            width: 280.0,
            child: Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 60.0),
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      forum.imagePath,
                      fit: BoxFit.fitWidth,
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: ForumDetailsWidget(forum: forum),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 80.0,
                      child: ForumNameWidget(forum: forum),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
