from dataclasses import dataclass
from typing import Optional

# Definition for a binary tree node.
"""
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right

    def __str__(self):
        return f"val:{self.val}, left:{self.left}, right:{self.right}"
"""


@dataclass
class TreeNode:
    val: int
    left: TreeNode = None
    right: TreeNode = None


class Solution:
    def checkTree(self, root: Optional[TreeNode]) -> bool:
        return root.val == (root.left.val + root.right.val)


if __name__ == '__main__':
    solution = Solution()
    tree = TreeNode(10, TreeNode(4), TreeNode(6))
    print("tree = ", tree)
    print("solution.checkTree(tree) = ", solution.checkTree(tree))

    tree = TreeNode(5, TreeNode(3), TreeNode(1))
    print("tree = ", tree)
    print("solution.checkTree(tree) = ", solution.checkTree(tree))
