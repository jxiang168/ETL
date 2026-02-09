from typing import List


class Solution:
    def maximumWealth(self, accounts: List[List[int]]) -> int:
        maxWealth = 0
        for account in accounts:
            maxWealth = max(maxWealth, sum(account))
        return maxWealth


if __name__ == '__main__':
    mySolution = Solution()
    case1 = [[1, 2, 3], [3, 2, 1]]
    case2 = [[1, 5], [7, 3], [3, 5]]
    case3 = [[2, 8, 7], [7, 1, 3], [1, 9, 5]]
    print("mySolution.maximumWealth(case1) =", mySolution.maximumWealth(case1))
    print("mySolution.maximumWealth(case2) =", mySolution.maximumWealth(case2))
    print("mySolution.maximumWealth(case3) =", mySolution.maximumWealth(case3))
