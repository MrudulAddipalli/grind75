// Initial Approach - start from end
class SolutionNotWorking {
  List<int> asteroidCollision(List<int> asteroids) {
    while (asteroids.length >= 0) {
      // Note - 2 <= asteroids.length <= 104
      int lastElement = asteroids.removeLast();
      int secondLastElement = asteroids.removeLast();

      // either is negative [-20, 5] or [5, -20] or [-20, 20]
      // collision will happen
      if ((lastElement > 0 && secondLastElement < 0) ||
          (lastElement < 0 && secondLastElement > 0)) {
        if (size(lastElement) > size(secondLastElement)) {
          asteroids.add(lastElement);
        } else if (size(lastElement) < size(secondLastElement)) {
          asteroids.add(secondLastElement);
        } else {
          // sizes are same both collided
        }
      }
      // both are negative [-20, -5]
      // or
      // both are positive [20, 5]
      // means
      // no collision will happen
      // add both asteroids in original order
      else {
        // order matters
        asteroids.add(secondLastElement);
        asteroids.add(lastElement);
      }
    }
    return asteroids;
  }

  int size(int x) {
    return (x < 0) ? -1 * x : x;
  }
}

// Solution - https://www.youtube.com/watch?v=LN7KjRszjk4
// Time - O(n) - 100%
// Space - O(n) - 100%

class Solution {
  List<int> asteroidCollision(List<int> asteroids) {
    List<int> stack = [];
    for (int asteroid in asteroids) {
      // collision
      while (stack.isNotEmpty && asteroid < 0) {
        int lastElement = stack.elementAt(stack.length - 1);
        if (lastElement > 0) {
          int diff = asteroid + lastElement;
          if (diff < 0) {
            // removing asteroid from stack as current asteroids size is big
            stack.removeLast();
          } else if (diff > 0) {
            // means current asteroid will get destroyed by the asteroid of stack
            // hence making it 0 so that we don't add current asteroid in stack at the end
            asteroid = 0;
          } else {
            // removing asteroid of stack as both the asteroids size are same,
            // hence will not add new asteroid to stack also will remove from stack
            stack.removeLast();
            // hence making it 0 so that we don't add current asteroid in stack at the end
            asteroid = 0;
          }
        } else {
          // to avoid time limit exceed warning
          break;
        }
      }

      // 0 is just a number for handling asteroids in stack to not add when not needed
      if (asteroid != 0) {
        stack.add(asteroid);
      }
    }
    return stack;
  }
}

void main() {
  print("${Solution().asteroidCollision([-2, 10, 12, -5, -10, -20, 50, 10])}");
}
