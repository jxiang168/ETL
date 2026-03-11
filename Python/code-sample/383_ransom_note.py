from collections import Counter


class Solution:

    def canConstruct(self, ransomNote, magazine):
        st1, st2 = Counter(ransomNote), Counter(magazine)
        print("(st1 & st2) =", (st1 & st2))
        if st1 & st2 == st1:
            return True
        return False

    def imple_canConstruct(self, ransomNote: str, magazine: str) -> bool:
        ransomNoteDict = {}
        for char in ransomNote:
            ransomNoteDict[char] = ransomNoteDict.get(char, 0) + 1

        magazineDict = {}
        for char in magazine:
            magazineDict[char] = magazineDict.get(char, 0) + 1

        print("Counter(magazine) =", Counter(magazine))

        # print("ransomNoteDict =", ransomNoteDict)
        # print("magazineDict =", magazineDict)

        for key, value in ransomNoteDict.items():
            if magazineDict.get(key, 0) < value:
                return False

        return True


if __name__ == '__main__':
    my_solution = Solution()
    cases = []
    cases.append({"ransomNote": "a", "magazine": "b"})
    cases.append({"ransomNote": "aa", "magazine": "ab"})
    cases.append({"ransomNote": "aa", "magazine": "aaab"})

    for i in range(len(cases)):
        print(f"mySolution for case{i} =", my_solution.canConstruct(**cases[i]))
