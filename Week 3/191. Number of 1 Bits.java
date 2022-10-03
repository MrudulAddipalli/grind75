
// https://www.youtube.com/watch?v=5Km3utixwZs
// https://leetcode.com/problems/number-of-1-bits/discuss/2648259/O(k)-time-O(1)-space

// O(n) - n will always be of 32 bits - so O(32) - constant time - O(1)
public class Solution1 {
    // you need to treat n as an unsigned value
    public int hammingWeight(int n) {
        String s = Integer.toBinaryString(n);
        int count = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == '1') {
                count++;
            }
        }
        return count;
    }

}

// Optimisation, only looping for existing 1's and increamenting the weight
public class Solution2 {
    // you need to treat n as an unsigned value
    public int hammingWeight(int n) {
        int weight = 0;
        while (n != 0) {
            // logical and , n = n & (n-1)
            // watch https://www.youtube.com/watch?v=5Km3utixwZs&t=416s
            n &= n - 1;
            weight++;
        }
        return weight;
    }
}
