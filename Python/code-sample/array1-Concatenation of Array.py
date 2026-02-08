from typing import List


class Solution:
    # easiest
    def getConcatenation(self, nums: List[int]) -> List[int]:
        return nums * 2

    # most readability
    def getConcatenationReadability(self, nums: List[int]) -> List[int]:
        nums.extend(nums)
        return nums


if __name__ == '__main__':
    solution = Solution()
    param = [1, 2, 3]
    ans = solution.getConcatenationReadability(param)
    print("ans=", ans)
