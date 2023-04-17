// typedef Word = Map<String, String>

// class Word {
//   String term;
//   String definition;

//   Word({
//     required this.term,
//     required this.definition,
//   });
// }

// typedef Dictionary = List<Word>;

// class dictMethod {}

typedef Word = Map<String, String>;

class Dictionary {
  List<Word> dict = [];

  void add(Map<String, String> word) {
    if (word.isNotEmpty) {
      if (!word.containsKey("term")) {
        print("term을 입력해주세요!");
      } else if (!word.containsKey("definition")) {
        print("definition을 입력해주세요!");
      } else {
        dict.add(word);
        print("$word 등록완료!");
      }
    } else {
      print("term과 definition이 모두 들어있는 map형식의 단어를 추가해주세요!");
    }
  }

  String? get(String term) {
    for (Word word in dict) {
      if (word["term"] == term) return word["definition"];
    }

    return "찾는 단어가 없습니다.";
  }

  void delete(String term) {
    bool exist = false;
    for (Word word in dict) {
      if (word["term"] == term) {
        dict.remove(word);
        exist = true;
        print("$word가 삭제되었습니다.");
        return;
      }
    }

    if (!exist) print("해당 단어가 없습니다.");
  }

  void update(Map<String, String> update_word) {
    bool exist = false;

    if (update_word.isNotEmpty) {
      if (!update_word.containsKey("term")) {
        print("term을 입력해주세요!");
      } else if (!update_word.containsKey("definition")) {
        print("definition을 입력해주세요!");
      } else {
        for (Word word in dict) {
          if (word["term"] == update_word["term"]) {
            dict.remove(word);
            dict.add(update_word);
          }
          ;
          exist = true;
          print("$word가 변경되었습니다.");
        }

        if (!exist) print("해당 단어가 없습니다.");
      }
    } else {
      print("term과 definition이 모두 들어있는 map형식의 단어를 입력해주세요!");
    }
  }

  List<Word> showAll() => dict;

  int count() => dict.length;

  void upsert(Map<String, String> update_word) {
    bool exist = false;

    if (update_word.isNotEmpty) {
      if (!update_word.containsKey("term")) {
        print("term을 입력해주세요!");
      } else if (!update_word.containsKey("definition")) {
        print("definition을 입력해주세요!");
      } else {
        for (Word word in dict) {
          if (word["term"] == update_word["term"]) {
            dict.remove(word);
            dict.add(update_word);
            exist = true;
            print("$word가 변경되었습니다.");
          }
        }
        print("현재 존재합니까? : $exist");
        if (!exist) dict.add(update_word);
      }
    } else {
      print("term과 definition이 모두 들어있는 map형식의 단어를 입력해주세요!");
    }
  }

  bool exists(String term) {
    bool exist = false;

    for (Word word in dict) {
      if (word["term"] == term) {
        exist = true;
      }
    }
    return exist;
  }

  void bulkAdd(List<Word> words) {
    dict.addAll(words);
  }

  void bulkDelete(List<String> words) {
    for (var word in words) {
      delete(word);
    }
  }
}

void main(List<String> args) {
  var dict = Dictionary();
  dict.add({"term": "apple", "definition": "사과"});
  dict.add({"term": "apple"});
  dict.add({"definition": "사과"});
  print(dict.get("apple"));
  print(dict.get("banana"));

  print('-----');
  dict.add({"term": "banana", "definition": "바나나"});
  dict.delete("orange");
  dict.delete("apple");

  print('-----');
  dict.update({"term": "banana", "definition": "사과"});
  print(dict.get("banana"));

  print('-----');
  dict.upsert({"term": "orange", "definition": "오렌지"});
  dict.upsert({"term": "banana", "definition": "바나나"});

  print('-----');
  print(dict.exists("mango"));

  print('---끝--');
  print(dict.showAll());
  print(dict.count());
}
