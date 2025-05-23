class Word {
  final String id;
  final String text;
  final int progress;
  Word({required this.id, required this.text, required this.progress});

  factory Word.fromJson(Map<String, dynamic> json) {
    return Word(
      id: json['id'] as String,
      text: json['text'] as String,
      progress: json['progress'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'progress': progress,
  };
}
