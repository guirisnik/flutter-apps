class Story {
  String _title;
  Map<String, Story> _paths;

  Story({ String storyTitle }) {
    this._title = storyTitle;
    this._paths = Map();
  }

  void setPath({ String pathKey, Story path }) {
    this._paths[pathKey] = path;
  }

  String getTitle() => this._title;

  Story getPath({ String pathKey }) => this._paths[pathKey];

  List<String> getPathKeys() => this._paths.keys.toList(growable: false);
}