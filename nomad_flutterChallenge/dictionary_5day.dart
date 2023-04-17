typedef Dict = Map<String, String>;

class Dictionary {
  Dict dict = {};

  void add(String term, String definition) {
    dict.addAll({term: definition});
  }

  String? get(String term) => dict[term];

  void delete(String term) {
    dict.remove(term);
  }

  void update(String term, String definition) {
    if (dict.containsKey(term)) {
      dict.update(term, (value) => definition);
    } else {
      print("$term 이라는 단어가 등록되어 있지 않습니다.");
    }
  }

  Map<String, String> showAll() {
    return dict;
  }

  int count() => dict.length;

  void upsert(String term, String definition) {
    if (dict.containsKey(term)) {
      update(term, definition);
    } else {
      add(term, definition);
    }
  }

  bool exists(String term) => dict.containsKey(term);

  void bulkAdd(List<Map<String, String>> words) {
    for (Map<String, String> wordSet in words) {
      dict.addAll(wordSet);
    }
  }

  void bulkDelete(List<String> words) {
    for (var word in words) {
      delete(word);
    }
  }
}

void main(List<String> args) {
  var dict = Dictionary();
  dict.add("hihihi", "헬로우라는 뜻");
  print(dict.get("hihihi"));

  dict.update("hihihi", "하이라는 뜻");
  print(dict.showAll());
  print(dict.count());

  print('-----');
  dict.add("apple", "사과");
  dict.upsert("apple", "사과애오쀼");
  dict.upsert("banana", "빠난나");
  print(dict.showAll());
  print(dict.exists("banana"));
  print(dict.exists("orange"));

  print('-----');
  dict.bulkAdd([
    {"term": "김치", "definition": "대박이네~"},
    {"term": "아파트", "definition": "비싸네~"}
  ]);
  dict.bulkDelete(["hihihi"]);
  print(dict.showAll());
}
