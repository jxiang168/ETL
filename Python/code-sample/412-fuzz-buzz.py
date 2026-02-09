from typing import List


class Solution:
    def fizzBuzz(self, n: int) -> List[str]:
        result = []
        for i in range(1, n + 1):
            if i % 15 == 0:
                result.append("FizzBuzz")
            elif i % 3 == 0:
                result.append("Fizz")
            elif i % 5 == 0:
                result.append("Buzz")
            else:
                result.append(str(i))
        return result


if __name__ == '__main__':
    my_solution = Solution()
    cases = []
    cases.append(3)
    cases.append(5)
    cases.append(15)
    for i in range(len(cases)):
        print("mySolution for case${i} =", my_solution.fizzBuzz(cases[i]))
