void main() {
  Solution solution = Solution();
  List<int> nums1 = [1, 2, 3, 3];
  List<int> nums2 = [1, 1, 2, 2];

  print(solution.findDifference(nums1, nums2));
}

//2215. 두 배열의 차이점 찾기

class Solution {
  //내가 쓴 답
  List<List<int>> findDifference(List<int> nums1, List<int> nums2) {
    List<List<int>> resultList = [];

    //중복된 수 넣는 셋
    Set<int> minus = {};

    //배열 비교하기
    for (int i = 0; i < nums1.length; i++) {
      for (int j = 0; j < nums2.length; j++) {
        if (nums1[i] == nums2[j]) {
          //j는 nums2의 모든 요소가 들어옴, 요소가 같으면 minus에 넣기
          minus.add(nums1[i]);
        }
      }
    }

    for (int num in minus) {
      nums1.removeWhere((e) => e == num);
      nums2.removeWhere((e) => e == num);
    }

    resultList.add(nums1.toSet().toList());
    resultList.add(nums2.toSet().toList());

    return resultList;
  }

  //정답======================================
  List<List<int>> findDifference2(List<int> nums1, List<int> nums2) {
    // 고유한 원소로만 이루어진 집합을 생성
    Set<int> set1 = nums1.toSet();
    Set<int> set2 = nums2.toSet();

    // nums1에만 있는 원소 찾기
    List<int> answer1 = set1.difference(set2).toList();

    // nums2에만 있는 원소 찾기
    List<int> answer2 = set2.difference(set1).toList();

    return [answer1, answer2];
  }
}
