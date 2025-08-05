void main() {
  Solution solution = Solution();
  print(solution.isPalindrome2("A man, a plan, a canal: Panama"));
}

// 125. 유효한 팰린드롬
class Solution {
  //내 답안
  bool isPalindrome(String s) {
    bool result = false;
    String wordA = '';
    String wordB = '';
    List<String> aList = [];
    List<String> bList = [];
    String sfilter = s.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    if (sfilter == '') {
      result = true;
    } //공백이면 true리턴

    for (int i = 0; i < sfilter.length; i++) {
      //s의 길이만큼 돌리면서
      wordA = sfilter[i];
      wordB = sfilter[sfilter.length - (1 + i)];
      if (wordA == wordB) {
        //i번째와 뒤에서 i번째를 비교해서 같다면
        aList.add(wordA); //각각의 리스트에 문자를 넣기
        bList.add(wordB);
      } else {
        bList.add(wordB); //다르다면 b에 문자넣기
      }
    }

    if (aList.length == bList.length) {
      //문자열 길이가 같으면 true
      result = true;
    }

    return result;
  }

  //튜터님 답안======================================================
  bool isPalindrome2(String s) {
    var regs = s.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    print(regs);
    int regSHalfLenght = regs.length ~/ 2;

    for (int i = 0; i < regSHalfLenght; i++) {
      if (regs[i] != regs[regs.length - 1 - i]) {
        return false;
      }
    }

    return true;
  }

  //정답======================================================
  bool isPalindrome3(String s) {
    // 알파벳과 숫자만 남기고, 소문자로 변환
    String filtered = '';
    for (var c in s.split('')) {
      if (RegExp(r'[a-zA-Z0-9]').hasMatch(c)) {
        filtered += c.toLowerCase();
      }
    }

    int left = 0;
    int right = filtered.length - 1;
    while (left < right) {
      if (filtered[left] != filtered[right]) {
        return false;
      }
      left++;
      right--;
    }

    return true;
  }
}
