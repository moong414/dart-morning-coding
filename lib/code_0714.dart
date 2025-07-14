void main() {
  List<int> nums1 = [1, 2, 3, 0, 0, 0];
  int m = 3;
  List<int> nums2 = [2, 5, 6];
  int n = 3;
  Solution solution = Solution();
  solution.merge(nums1, m, nums2, n);
}

//88번 병합 정렬된 배열
// 정렬된 배열 nums1과 nums2가 주어지며, nums1은 충분한 공간을 할당받고 있습니다.
// nums1의 초기 크기는 m이고, nums2의 크기는 n입니다.
// 두 배열을 합쳐서 nums1에 정렬된 형태로 저장해야 합니다.
class Solution {
  void merge(List<int> nums1, int m, List<int> nums2, int n) {
    //removeRange는 첫번째 인자부터 마지막 인자의 -1까지를 제거하는 함수
    //n이 3이면 3부터~마지막까지 제거
    nums1.removeRange(m, nums1.length);
    nums2.removeRange(n, nums2.length);

    nums1.addAll(nums2);
    nums1.sort();

    print(nums1);
  }

  //정답================================================================
  void merge2(List<int> nums1, int m, List<int> nums2, int n) {
    int i = m - 1; // nums1의 마지막 유효 요소 인덱스
    int j = n - 1; // nums2의 마지막 요소 인덱스
    int k = m + n - 1; // nums1의 마지막 인덱스

    while (i >= 0 && j >= 0) {
      if (nums1[i] > nums2[j]) {
        nums1[k--] = nums1[i--]; // nums1의 요소를 사용
      } else {
        nums1[k--] = nums2[j--]; // nums2의 요소를 사용
      }
    }

    // nums2에 남은 요소가 있는 경우 복사
    while (j >= 0) {
      nums1[k--] = nums2[j--];
    }
  }
}
