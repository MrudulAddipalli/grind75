import '../helper_data_structures.dart/linked_list_base.dart';


/// Time Limit Exceeded
/// Time Complexity - O(n)
/// Space Complexity - O(1) - single string used
class Solution2 {
  bool isPalindrome(ListNode? head) {
    // check for edge case
    if (head?.next == null) {
      // means only head is present
      return true;
    }

    String palindrom = "";
    while (head != null) {
      palindrom = palindrom + head.val.toString();
      head = head.next;
    }
    return check(palindrom);
  }

  bool check(String s) {
    // tried this , and also tried custom s.lenght / 2 for loop check , 
    // with s[i] != s[len-1-i], both gave Time Limit Exceeded
    return s == s.split("").reversed.join('');
  }
}



// Runtime: 826 ms, faster than 6.98% of Dart online submissions for Palindrome Linked List.
// Memory Usage: 195.4 MB, less than 65.12% of Dart online submissions for Palindrome Linked List.
// https://www.youtube.com/watch?v=yOzXms1J6Nk

// Optimised Solution
/// Time Complexity - O(n) 
/// [ same Time Complexoty then why above solution didn't - 
///  Dart gave time issue, with Python it was passing with 65% faster than other's
/// ]
/// Space Complexity - O(1)
class Solution {

  bool isPalindrome(ListNode? head) {
    ListNode? slow = head, fast = head;

    // when fast reaches end, our slow will be in middle
    while(slow!=null && fast!=null && fast.next!=null){
      slow = slow.next;
      fast = fast.next?.next;
    }
    
    // refer - Week 2/206. Reverse Linked List/iterative.dart
    // now reverse linked from where slow if pointing, slow is currently pointing to middle of linked list
    ListNode? temp = null, prev = null;
    while(slow!=null){
      temp = slow.next;
      slow.next = prev;
      prev = slow;
      slow = temp;
    }

    // now our prev is pointing to head of reversed linked list, which is reversed from middle of linked list
    // so now start from head and end to compare palindrome, 
    // head is main head, end is our updated prev


    ListNode? left = head, right = prev;
    while (right != null) {
      // when prev is null means we have reached middle of linked list
      if(left?.val != right!.val){
        return false;
      }
      left = left?.next;
      right = right.next;
    }
    return true;
  }
}

void main() {
  LinkedList list1 = LinkedList();
  list1.add(1);
  list1.add(2);
  list1.add(2);
  list1.add(1);
  print("Final Result - ${Solution().isPalindrome(list1.node)}");
}
