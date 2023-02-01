// Solution - https://www.youtube.com/watch?v=71xQSBWUupU

class Solution {
    public int findCheapestPrice(int n, int[][] flights, int src, int dst, int K) {
        // Creating Adjustency List, from each source to destination, where List contains
        // [ Destination , Cost To Reach Destination ]
        Map < Integer, List < int[] >> map = new HashMap < > ();
        for (int[] f: flights) {
            map.putIfAbsent(f[0], new ArrayList < > ());
            map.get(f[0]).add(new int[] {
                f[1], f[2]
            });
        }

        // Defining Custom Comparator
        // where Queue will store, Destination, Cost Till Destination, Remaining Moves
        PriorityQueue < int[] > q = new PriorityQueue < > (new Comparator < int[] > () {
            @Override
            public int compare(int[] o1, int[] o2) {
                return Integer.compare(o1[1], o2[1]);
            }
        });

        // adding first node for start point,
        // src is our Destination,
        // 0 is cost to reach that Destination, since our source and destination are same hence cost is 0 to reach our Destination
        // K is remaining moves, since we haven't started trip
        q.offer(new int[] {
            src,
            0,
            K
        });

        while (!q.isEmpty()) {
            int[] c = q.poll();
            int curr = c[0];
            int cost = c[1];
            int stop = c[2];


            // Base Case
            // which are we directly send cost as result,
            // because we already have comparator operator used in PriorityQueue
            if (curr == dst)
                return cost;

            // Base Case
            if (stop >= 0) {

                // No routes or flights available which goes to other places whose start point is curr
                if (!map.containsKey(curr))
                    continue;

                // Check for all routes whose start is curr
                for (int[] next: map.get(curr)) {
                    q.add(new int[] {
                        next[0], cost + next[1], stop - 1
                    });
                }
            }
        }
        return -1;
    }
}