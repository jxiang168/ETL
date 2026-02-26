# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
from typing import Optional


class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next

    def __str__(self):
        return '{val:' + str(self.val) + ',next:' + str(self.next) + '}'


class Solution:
    def middleNode(self, head: Optional[ListNode]) -> Optional[ListNode]:
        last = head
        half = head
        counter = 1
        while last is not None:
            last = last.next
            if counter & 1 == 0:
                half = half.next
            counter += 1
        return half


if __name__ == '__main__':
    my_solution = Solution()
    cases = []
    a = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))
    print("a =", a)
    cases.append(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5))))))
    cases.append(ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, ListNode(6)))))))
    cases.append(ListNode(1, ListNode(2, ListNode(3))))

    for i in range(len(cases)):
        print(f"mySolution for case{i} =", my_solution.middleNode(cases[i]))
