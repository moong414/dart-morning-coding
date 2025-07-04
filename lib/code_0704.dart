void main() {
  //0 이동시키기
  List<int> nums = [0, 1, 0, 3, 12];
  int insertIndex = 0;

  for (int num in nums) {
    if (num != 0) {
      nums[insertIndex] = num;
      insertIndex++;
    }
  }

  //print(insertIndex);

  for (int i = insertIndex; i < nums.length; i++) {
    nums[i] = 0;
  }

  print(nums);
}

//정답=====================================================
void moveZeroes(List<int> nums) {
  int lastNonZeroIndex = 0;

  // [0, 1, 0, 3, 12] index : 0, i : 0
  // i: 1, nums : [1, 1, 0, 3, 12], index: 1
  // i : 2,
  // i: 3, [1, 3, 0, 3, 12], index: 2
  // i: 4, [1, 3, 12, 3, 12], index: 3

  // 모든 비-0 요소를 배열의 앞부분으로 이동
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      nums[lastNonZeroIndex] = nums[i];
      lastNonZeroIndex++;
    }
  }
  // [1,3,12,3,12]

  // i: 4, [1, 3, 12, 0, 0], index: 3

  // 나머지 요소를 0으로 설정
  for (int i = lastNonZeroIndex; i < nums.length; i++) {
    nums[i] = 0;
  }
  // [1,3,12,0,0]
}

void moveZeroes2(List<int> nums) {
  if (nums.length < 2) return;
  int length = nums.length;
  List<int> zeroIndex = [];

  for (int i = 0; i < length; i++) {
    if (nums[i] == 0) {
      zeroIndex.add(i);
    }
  }

  for (int i = 0; i < zeroIndex.length; i++) {
    nums.removeAt(zeroIndex[i] - i);
    nums.add(0);
  }

  return;
}

void moveZeroes3(List<int> nums) {
  int originalLength = nums.length;
  nums.removeWhere((x) => x == 0);
  int zerosToAdd = originalLength - nums.length;
  nums.addAll(List.filled(zerosToAdd, 0));
}

void moveZeroes4(List<int> nums) {
  int lastNonZero = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != 0) {
      int temp = nums[i];
      nums[i] = nums[lastNonZero];
      nums[lastNonZero] = temp;
      lastNonZero++;
    }
  }
}
