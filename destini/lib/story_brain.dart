import 'package:destini/story.dart';

class StoryBrain {
  Story _currentStoryNode;

  static const String _RESET = 'Restart';

  Story storyTree = Story(
    storyTitle:
    '''
Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception.

You decide to hitchhike.

A rusty pickup truck rumbles to a stop next to you.

A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".
    ''',
  );

  Story story1 = Story(storyTitle: 'He nods slowly, unphased by the question.');
  Story story2 = Story(
    storyTitle:
    '''
As you begin to drive, the stranger starts talking about his relationship with his mother.

He gets angrier and angrier by the minute.

He asks you to open the glovebox.

Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John.

He reaches for the glove box.
    ''',
  );
  Story story3 = Story(
    storyTitle:
    '''
What? Such a cop out!

Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?
    ''',
  );
  Story story4 = Story(
    storyTitle:
    '''
As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.
    ''',
  );
  Story story5 = Story(
    storyTitle:
    '''
You bond with the murderer while crooning verses of "Can you feel the love tonight".

He drops you off at the next town.

Before you go he asks you if you know any good places to dump bodies.

You reply: "Try the pier".
    ''',
  );

  StoryBrain() {
    story5.setPath(pathKey: 'Restart', path: null);
    story5.setPath(pathKey: '', path: null);

    story4.setPath(pathKey: 'Restart', path: null);
    story4.setPath(pathKey: '', path: null);

    story3.setPath(pathKey: 'Restart', path: null);
    story3.setPath(pathKey: '', path: null);

    story2.setPath(pathKey: 'I love Elton John! Hand him the cassette tape.', path: story5);
    story2.setPath(pathKey: 'It\'s him or me! You take the knife and stab him.', path: story4);

    story1.setPath(pathKey: 'At least he\'s honest. I\'ll climb in.', path: story2);
    story1.setPath(pathKey: 'Wait, I know how to change a tire.', path: story3);

    storyTree.setPath(pathKey: 'Better ask him if he\'s a murderer first.', path: story1);
    storyTree.setPath(pathKey: 'I\'ll hop in. Thanks for the help!', path: story2);

    this._currentStoryNode = storyTree;
  }

  void setNextStory(String pathKey) {
    if (pathKey != StoryBrain._RESET)
      this._currentStoryNode = this._currentStoryNode.getPath(pathKey: pathKey);
    else
      this._resetStory();
  }

  Story getCurrentStory() => this._currentStoryNode;

  void _resetStory() {
    this._currentStoryNode = storyTree;
  }
}
