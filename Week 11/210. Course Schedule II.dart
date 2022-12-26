// Solution - https://www.youtube.com/watch?v=Akt3glAwyfY&t=8s 

// Time Complexity - O(numCourses + prerequisites)
// Space Complexity - O(numCourses)

class Solution {
  List<int> findOrder(int numCourses, List<List<int>> prerequisites) {
    // Adjacency List - Map with values as list
    Map<int, List<int>> prerequisiteMap = {};

    // initialising map for each course
    for (int i = 0; i < numCourses; i++) {
      prerequisiteMap[i] = [];
    }

    // storing all pre requisite for each course in map as list
    for (int i = 0; i < prerequisites.length; i++) {
      List<int> p = prerequisites[i];
      // 0 - course
      // 1 - pre requisite
      int course = p[0];
      int prerequisite = p[1];
      if (prerequisiteMap[course] == null) {
        prerequisiteMap[course] = [];
      }
      prerequisiteMap[course]!.add(prerequisite);
    }

    Set<int> visitedCourses = {};
    Set<int> cyclingCourses = {};
    List<int> output = [];

    dfs(int course) {
      if (cyclingCourses.contains(course)) return false;

      // DFS search breakpoint - no need to check prequisite for current course for alredy visited course
      //  forming loop
      if (visitedCourses.contains(course)) return true;

      // if there is no prerequisites - means course can be completed
      if (prerequisiteMap[course] == []) return true;

      // adding current course for helping in breaking infinite loop
      cyclingCourses.add(course);

      // doing DFS on each pre requisite for current course
      for (int prerequisite in prerequisiteMap[course]!) {
        // Optimisation - if loop is visiting already visited node which we check using set
        // that means this is loop - i.e current course cannot be completed
        // hence returning False
        // if not false not returned
        // that means current course can be completed hence after for loop we return true
        if (dfs(prerequisite) == false) return false;
      }

      // removing from map so that for further course we can
      // visit the node again and check if any loop is found or not
      cyclingCourses.remove(course);

      // lets say we have 0 -> 1 -> 3 -> 2
      // to we need complete 2 then 3 then 1 and then 0
      // we added 2 , 3, 2, 0 respectivly in visitedCourses
      // now we are doing dfs on 3, which has prerequisite 2,
      // where we don't need to dfs on 2, since 2 and 3 are already visisted
      visitedCourses.add(course);

      // taking the course for output
      output.add(course);

      // since we return true when no loop found, hence we can make
      // prerequisite for current course to empty list,
      // which optimises for further course DFS check
      prerequisiteMap[course] = [];

      return true;
    }

    // I thougt of doing dfs on only course 0, as it will be most required course and linked course
    // but we can also has pre requisites like
    // 0 - 1, 0 depends on 1
    // and 3 - 2, 3 depends on 2,
    // that is course 0 can be completed
    // but we may not check for course 3,
    // hence looping through all courses from 0 to (n - 1)
    for (int currentCourse = 0; currentCourse < numCourses; currentCourse++) {
      // Optimisation - if any of the course cannot be completed, return empty list
      if (dfs(currentCourse) == false) return [];
    }

    return output;
  }
}
