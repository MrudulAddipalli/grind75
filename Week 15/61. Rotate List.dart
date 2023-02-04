import '../helper_data_structures.dart/linked_list_base.dart';
// Time Limit Exceeded because of while loop in k
// Approach - 1

// Step 1: store last node from LL
// Step 2: make last node as first node
// Step 3: point node before last node to null

class SolutionMyApproach {
  ListNode? rotateRight(ListNode? head, int k) {
    ListNode? lastNode = head;
    while (k > 0) {
      // Step 1: store last node from LL
      lastNode = head;
      ListNode? prev = head;
      while (lastNode?.next != null) {
        prev = lastNode;
        lastNode = lastNode?.next;
      }

      // Step 3: point node before last node to null
      prev?.next = null;

      // Step 2: make last node as first node
      // making last node and head node
      lastNode?.next = head;

      // here lastNode is hour head
      // hence for further while loop which uses head as lastNode
      // we need to make lastNode as head
      head = lastNode;

      // first cycle completed
      k--;
    }

    return lastNode;
  }
}

// Optimisation
// Check Pattern For below e.g
// Input: head = [0,1,2], k = 4
// Output: [2,0,1]

// K - 1 // 2 - 0 - 1
// K - 2 // 1 - 2 - 0
// K - 3 // 0 - 1 - 2
// K - 4 // 2 - 0 - 1

// At last we can just rotate - [ k - no. of nodes i.e k % len ] times
// for above e.g total no. of rotations = 4 - 3 = 1
// therefore when k = 1, we get our result 2 - 0 - 1

// so this optimisation, we can update k with total no. of rotations i.e k
// and keep further code same,  but to further optimise more,
// we can break list in 2 parts, list 1 , from head to k, and list2 will be from k+1 to last node
// move list2 to head, and list1 to last, mark last node of list to null

// Solution - https://www.youtube.com/watch?v=L4SpbpKUN9A

class SolutionOptimised {
  ListNode? rotateRight(ListNode? head, int k) {
    // base case
    if (head == null || k == 0) return head;

    // find len and also find lastNode in same process
    // len is default by 1, because we already have base case for first node
    int len = 1;
    ListNode? list2lastNode = head;

    while (list2lastNode?.next != null) {
      len++;
      list2lastNode = list2lastNode?.next;
    }

    // pointing last node to head
    list2lastNode?.next = head;

    ListNode? firstListlastNode = head;
    int noOfRotations = len - (k % len);

    while (noOfRotations-- > 1) {
      firstListlastNode = firstListlastNode?.next;
    }

    // Main logic -- making head as list2 first node
    head = firstListlastNode?.next;

    // making firstListlastNode to point to null
    firstListlastNode?.next = null;

    return head;
  }
}

void main() {
  SolutionOptimised sol = SolutionOptimised();

  LinkedList list = LinkedList();
  list.add(0);
  list.add(1);
  list.add(2);
  list.node = sol.rotateRight(list.node, 4);
  list.log();
}
