// Solution - https://www.youtube.com/watch?v=FMwpt_aQOGw&t=1268s

class Solution {
  List<List<String>> accountsMerge(List<List<String>> accounts) {
    Map<String, int> emailToIndexMap = {};

    for (int i = 0; i < accounts.length; i++) {
      List<String> currentAccount = accounts[i];
      // why 1 , emails start from index 1 at 2nd position
      for (int emailIndex = 1;
          emailIndex < currentAccount.length;
          emailIndex++) {
        String email = currentAccount[emailIndex];
        if (emailToIndexMap[email] == null) {
          print("Unique Email $email");
          // email is not added
          emailToIndexMap[email] = i;
        } else {
          // print("Exists $email at i = $i");
          // since we found account that needs to be merged
          // add all emails of this account to already existing acocunt
          int alreadyExistingAccount = emailToIndexMap[email]!;
          // mark all emails with alreadyExistingAccount index

          /// Problem with this
          /// if there are 3 emails , out of which 2nd and 3rd email is already existing
          /// then we are marking all emails the same value
          /// but when we come to 3rd email which should be mapped with user 1 it gets mapped with user 2
          /// because 2nd email got mapped with 1st email
          // for (int emailAddress = 1;
          //     emailAddress < currentAccount.length;
          //     emailAddress++) {
          //   String email = currentAccount[emailAddress];
          //   emailToIndexMap[email] = alreadyExistingAccount;
          // }

          print(
              "Exists $email at i = $i alreadyExistingAccountindex - $alreadyExistingAccount");

          for (int currentEmailToPreviousEmails =
                  currentAccount.length - emailIndex;
              currentEmailToPreviousEmails >= 1;
              currentEmailToPreviousEmails--) {
            String email = currentAccount[currentEmailToPreviousEmails];
            emailToIndexMap[email] = alreadyExistingAccount;
          }
        }
      }
    }

    Map<int, List<String>> indexToEmailMap = {};

    // now we have all emails mapped with user accounts index
    emailToIndexMap.forEach((email, index) {
      if (indexToEmailMap[index] == null) {
        indexToEmailMap[index] = [];
      }
      indexToEmailMap[index]!.add(email);
    });

    List<List<String>> res = [];

    indexToEmailMap.forEach((accountIndex, listOfEmails) {
      // print('${accountIndex}: ${listOfEmails}');
      // 0: [johnsmith@mail.com, john_newyork@mail.com, john0il.com]
      // 2: [mary@mail.com]
      // 3: [johnnybravo@mail.com]
      String userName = accounts[accountIndex][0];
      listOfEmails.sort();
      res.add([userName, ...listOfEmails]);
    });

    return res;
  }
}

void main() {
  List<List<String>> res = Solution().accountsMerge([
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["John", "johnsmith@mail.com", "john00@mail.com"],
    ["Mary", "mary@mail.com"],
    ["John", "johnnybravo@mail.com"]
  ]);

  for (int i = 0; i < res.length; i++) {
    print("res - ${res[i]}\n");
  }
}
