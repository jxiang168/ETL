from typing import List


class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        pass
        accum = 0
        maxim = 0
        for num in nums:
            accum += num
            if num == 0:
                maxim = max(accum,maxim)
                accum = 0
        maxim = max(accum, maxim)
        return maxim



if __name__ == '__main__':
    my_solution = Solution()
    cases = []
    cases.append([1,1,0,1,1,1])
    cases.append([1,0,1,1,0,1])

    for i in range(len(cases)):
        print(f"mySolution for case{i} =", my_solution.findMaxConsecutiveOnes(cases[i]))
