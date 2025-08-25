void main() {
  Solution solution = Solution();
  print(
    'result: ${solution.reverseList(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))}',
  );
}

//206. 역방향 연결리스트
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  //정답===================================================================
  ListNode? reverseList(ListNode? head) {
    ListNode? prev = null;
    ListNode? current = head;

    while (current != null) {
      ListNode? nextTemp = current.next; // 다음 노드를 임시 저장
      current.next = prev; // 현재 노드의 방향을 이전 노드로 변경
      prev = current; // 이전 노드를 현재 노드로 이동
      current = nextTemp; // 현재 노드를 다음 노드로 이동
    }

    return prev; // 뒤집힌 리스트의 새로운 헤드
  }
}
