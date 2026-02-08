from typing import List


class Solution:
    # 带中间变量方便理解的解法
    def runningSum2(self, nums: List[int]) -> List[int]:
        sum = 0
        ans = nums.copy()
        for i in range(len(ans)):
            ans[i] += sum
            sum = ans[i]
        return ans

    # mutable的解法，把入参修改了，不太合理
    def runningSumM(self, nums: List[int]) -> List[int]:
        for i in range(1, len(nums)):
            nums[i] += nums[i - 1]
        return nums

    # 最简洁的解法
    def runningSum(self, nums: List[int]) -> List[int]:
        ans = nums.copy()
        for i in range(1, len(ans)):
            ans[i] += ans[i - 1]
        return ans


if __name__ == '__main__':
    theSolution = Solution()
    input1 = [1, 2, 3, 4]
    print("theSolution.runningSum([1,2,3,4]) =", theSolution.runningSum([1, 2, 3, 4]))
    print("theSolution.runningSum([1,1,1,1,1]) =", theSolution.runningSum([1, 1, 1, 1, 1]))
    print("theSolution.runningSum([3,1,2,10,1]) =", theSolution.runningSum([3, 1, 2, 10, 1]))
