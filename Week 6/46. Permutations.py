# Solution - https://www.youtube.com/watch?v=s7AvT7cGdSo&t=4s


# [1,2,3]
# class Solution {
#   List<List<int>> permute(List<int> nums) {
#     List<List<int>> res = [];

#     if (nums.length == 1) return [nums];

#     for (int i = 0; i < nums.length; i++) {
#       int n = nums.removeAt(0);
#       List<List<int>> perms = this.permute(nums);

#       for (int i = 0; i < perms.length; i++) {
#         perms[i].add(n);
#       }

#       res.addAll(perms);
#       nums.add(n);
#     }

#     return res;
#   }
# }


from ast import List

# Runtime: 43 ms, faster than 92.12 % of Python3 online submissions for Permutations.
# Memory Usage: 14 MB, less than 84.67 % of Python3 online submissions for Permutations.


class Solution:
    def permute(self, nums: List[int]) -> List[List[int]]:
        result = []

        if (len(nums) == 1):
            print("since len(nums) is 1 hence returning {}".format(nums))
            return [nums[:]]  # Similar to ---> return [nums.copy()]

        for i in range(len(nums)):
            print("current nums {}".format(nums))
            n = nums.pop(0)
            print("popping {}".format(n))
            perms = self.permute(nums)

            print("all perms before -- {}".format(perms))

            for perm in perms:
                perm.append(n)

            print("all perms after -- {}".format(perms))

            print("result before extend-- {}".format(result))

            result.extend(perms)

            print("result after extend-- {}".format(result))

            print("n is -- {}".format(n))

            print("nums before appending n -- {}".format(nums))

            nums.append(n)

            print("nums after appending n -- {}".format(nums))

        return result


# Output

# current nums [1, 2, 3]
# popping 1
# current nums [2, 3]
# popping 2
# since len(nums) is 1 hence returning [3]
# all perms before -- [[3]]
# all perms after -- [[3, 2]]
# result before extend-- []
# result after extend-- [[3, 2]]
# n is -- 2
# nums before appending n -- [3]
# nums after appending n -- [3, 2]
# current nums [3, 2]
# popping 3
# since len(nums) is 1 hence returning [2]
# all perms before -- [[2]]
# all perms after -- [[2, 3]]
# result before extend-- [[3, 2]]
# result after extend-- [[3, 2], [2, 3]]
# n is -- 3
# nums before appending n -- [2]
# nums after appending n -- [2, 3]
# all perms before -- [[3, 2], [2, 3]]
# all perms after -- [[3, 2, 1], [2, 3, 1]]
# result before extend-- []
# result after extend-- [[3, 2, 1], [2, 3, 1]]
# n is -- 1
# nums before appending n -- [2, 3]
# nums after appending n -- [2, 3, 1]
# current nums [2, 3, 1]
# popping 2
# current nums [3, 1]
# popping 3
# since len(nums) is 1 hence returning [1]
# all perms before -- [[1]]
# all perms after -- [[1, 3]]
# result before extend-- []
# result after extend-- [[1, 3]]
# n is -- 3
# nums before appending n -- [1]
# nums after appending n -- [1, 3]
# current nums [1, 3]
# popping 1
# since len(nums) is 1 hence returning [3]
# all perms before -- [[3]]
# all perms after -- [[3, 1]]
# result before extend-- [[1, 3]]
# result after extend-- [[1, 3], [3, 1]]
# n is -- 1
# nums before appending n -- [3]
# nums after appending n -- [3, 1]
# all perms before -- [[1, 3], [3, 1]]
# all perms after -- [[1, 3, 2], [3, 1, 2]]
# result before extend-- [[3, 2, 1], [2, 3, 1]]
# result after extend-- [[3, 2, 1], [2, 3, 1], [1, 3, 2], [3, 1, 2]]
# n is -- 2
# nums before appending n -- [3, 1]
# nums after appending n -- [3, 1, 2]
# current nums [3, 1, 2]
# popping 3
# current nums [1, 2]
# popping 1
# since len(nums) is 1 hence returning [2]
# all perms before -- [[2]]
# all perms after -- [[2, 1]]
# result before extend-- []
# result after extend-- [[2, 1]]
# n is -- 1
# nums before appending n -- [2]
# nums after appending n -- [2, 1]
# current nums [2, 1]
# popping 2
# since len(nums) is 1 hence returning [1]
# all perms before -- [[1]]
# all perms after -- [[1, 2]]
# result before extend-- [[2, 1]]
# result after extend-- [[2, 1], [1, 2]]
# n is -- 2
# nums before appending n -- [1]
# nums after appending n -- [1, 2]
# all perms before -- [[2, 1], [1, 2]]
# all perms after -- [[2, 1, 3], [1, 2, 3]]
# result before extend-- [[3, 2, 1], [2, 3, 1], [1, 3, 2], [3, 1, 2]]
# result after extend-- [[3, 2, 1], [2, 3, 1], [1, 3, 2], [3, 1, 2], [2, 1, 3], [1, 2, 3]]
# n is -- 3
# nums before appending n -- [1, 2]
# nums after appending n -- [1, 2, 3]
