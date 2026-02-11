from math import floor


class Solution:


    def numberOfStepsLoop(self, num: int) -> int:
        current_num = num
        step_num = 0
        while current_num > 0:
            if current_num % 2 == 1:
                step_num += 1
                current_num -= 1
            else:
                step_num += 1
                current_num = floor(current_num / 2)

        return step_num

    def numberOfStepsRecursive(self, num: int) -> int:
        result = 0
        if (num == 0):
            result = 0
        elif (num % 2 == 1):
            result = self.numberOfSteps(num - 1) + 1
        elif (num % 2 == 0):
            result = self.numberOfSteps(num / 2) + 1
        return result

    def numberOfSteps(self, num: int) -> int:
        if num == 0:
            return 0
        return num.bit_length() - 1 + num.bit_count()


if __name__ == '__main__':
    my_solution = Solution()
    cases = []
    cases.append(0)
    cases.append(1)
    cases.append(2)
    cases.append(14)
    cases.append(8)
    cases.append(123)
    for i in range(len(cases)):
        print(f"mySolution for case{i} =", my_solution.numberOfSteps(cases[i]))
