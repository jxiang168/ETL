from typing import List


class Solution:
    class Solution:
        def findNumbers(self, nums: List[int]) -> int:
            return len([x for x in nums if len(str(x)) % 2 == 0])

    def myFindNumbers(self, nums: List[int]) -> int:
        count = 0
        for num in nums:
            if len(str(num)) & 1 == 0:
                count += 1
        return count


if __name__ == '__main__':
    my_solution = Solution()
    cases = []
    cases.append([-4,-1,0,3,10])
    cases.append([-7,-3,2,3,11])

    print( [x**2 for x in [1,2,3] ] )

    print(sorted([3,2,1]))

    for i in range(len(cases)):
        print(f"mySolution for case{i} =", my_solution.findNumbers(cases[i]))
