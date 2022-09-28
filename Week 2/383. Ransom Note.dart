class Solution {
  bool canConstruct(String ransomNote, String magazine) {
    Map<String, int> charMagazine = {}, charRansomNote = {};
    String str = "";
    int i = 0, magLen = magazine.length, ranLen = ransomNote.length;

    // geting count of each char of magazine
    for (i = 0; i < magLen; i++) {
      str = magazine[i];
      if (charMagazine[str] == null) {
        charMagazine[str] = 1;
      } else {
        charMagazine[str] = charMagazine[str]! + 1;
      }
    }

    // geting count of each char of ransomNote
    for (i = 0; i < ranLen; i++) {
      str = ransomNote[i];
      if (charRansomNote[str] == null) {
        charRansomNote[str] = 1;
      } else {
        charRansomNote[str] = charRansomNote[str]! + 1;
      }
    }

    // Algo:
    // check if char of ransomNote does not exist in magazine - means false,
    // check if char count of ransomNote is more then char count of Magazine - means false
    // else true;

    for (i = 0; i < ranLen; i++) {
      str = ransomNote[i];
      if (charMagazine[str] == null) {
        // char of ransomNote does not exist in magazine
        return false;
      } else if (charRansomNote[str]! > charMagazine[str]!) {
        // char count of ransomNote is more then char count of Magazine
        return false;
      }
    }

    return true;
  }
}

void main() {
  print("Status - ${Solution().canConstruct("aa", "ab")}");
}
