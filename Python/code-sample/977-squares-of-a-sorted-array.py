from typing import List


class Solution:
    def sortedSquares(self, nums: List[int]) -> List[int]:
        return sorted([x ** 2 for x in nums])


if __name__ == '__main__':
    my_solution = Solution()
    cases = []
    cases.append([-4, -1, 0, 3, 10])
    cases.append([-7, -3, 2, 3, 11])

    for i in range(len(cases)):
        print(f"mySolution for case{i} =", my_solution.sortedSquares(cases[i]))
