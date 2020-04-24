import 'package:flutter/material.dart';
import 'package:destini/story_brain.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.pinimg.com/originals/62/f0/a1/62f0a12f732ccfee8b84058539d1bfdf.jpg'),
              ),
            ),
            child: StoryPage(),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain storyBrain = StoryBrain();

  void onButtonPress({ String pathKey }) {
    setState(() {
      storyBrain.setNextStory(pathKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text(
                storyBrain.getCurrentStory().getTitle(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            )
          ),
        ),
        Expanded(
          child: storyBrain.getCurrentStory().getPathKeys()[0] != '' ? Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              child: Text(
                storyBrain.getCurrentStory().getPathKeys()[0],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              color: Colors.red,
              onPressed: () => this.onButtonPress(
                pathKey: storyBrain.getCurrentStory().getPathKeys()[0]
              ),
            ),
          ) : SizedBox(),
        ),
        Expanded(
          child: storyBrain.getCurrentStory().getPathKeys()[1] != '' ? Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              child: Text(
                storyBrain.getCurrentStory().getPathKeys()[1],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              color: Colors.blue,
              onPressed: () => this.onButtonPress(
                pathKey: storyBrain.getCurrentStory().getPathKeys()[1]
              ),
            ),
          ) : SizedBox(),
        ),
      ],
    );
  }
}