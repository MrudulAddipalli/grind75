# Solution - https://www.youtube.com/watch?v=E8EKDyGtRN0

# Runtime: 488 ms, faster than 53.64 % of Python3 online submissions for Accounts Merge.
# Memory Usage: 20.3 MB, less than 40.95 % of Python3 online submissions for Accounts Merge.

from ast import List
from collections import defaultdict


class Solution:
    def accountsMerge(self, accounts: List[List[str]]) -> List[List[str]]:
        graph = defaultdict(set)
        emailToName = {}

        for acct in accounts:
            name = acct[0]

            # merge all releted emails too each other
            firstEmail = acct[1]
            emailToName[firstEmail] = name

            # mapping first email of current account to remaining emails
            for remainingEmails in acct[2:]:
                # many to 1
                graph[firstEmail].add(remainingEmails)
                # 1 to many
                graph[remainingEmails].add(firstEmail)
                emailToName[remainingEmails] = name

        res = []
        # using set to avoid loop because at end we have many to many relations for the each email
        seen = set()

        # looping all emails
        # looping all keys
        for email in emailToName:
            # not visited
            if email not in seen:
                stack = [email]
                seen.add(email)

                emails = []

                while stack:
                    curEmail = stack.pop()
                    emails.append(curEmail)

                    for linkedEmail in graph[curEmail]:
                        if linkedEmail not in seen:
                            stack.append(linkedEmail)
                            # main condition for avoiding loop
                            seen.add(linkedEmail)

                res.append([emailToName[email]] + sorted(emails))

        return res
