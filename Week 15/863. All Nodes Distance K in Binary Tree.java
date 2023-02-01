// Solution - https://www.youtube.com/watch?v=lFW3sbPpMIk

class Solution {
    public List<Integer> distanceK(TreeNode root, TreeNode target, int K) {

        List<Integer> res= new ArrayList<>();
        if(root == null) return res;
        
        HashMap<TreeNode, TreeNode> parentMap = new HashMap<>();

        // map parent and child, where child will be key and parent will value 
        findParent(parentMap, root);

        Queue<TreeNode> q = new LinkedList<>();
        HashSet<TreeNode> visited = new HashSet<>();
        q.add(target);
        
        while(!q.isEmpty()){
            int size= q.size();
            for(int i =0; i <size; i++){
                TreeNode curr = q.poll();
                visited.add(curr);

                // if k is matching keep adding in res, futher code execution of adding nodes in queue
                // does not matter as we break loop
                // by checking k < 0, and we decrement k before checking
                if(K == 0){
                  res.add(curr.val);
                }else{

                // add parent only if exist and not visited
                if(parentMap.containsKey(curr) && !visited.contains(parentMap.get(curr))){
                    q.add(parentMap.get(curr));
                }
                
                // add left child only if exist and not visited
                if(curr.left != null && !visited.contains(curr.left)){
                    q.add(curr.left);      
                }
                
                // add right child only if exist and not visited
                if(curr.right != null && !visited.contains(curr.right)){
                    q.add(curr.right);      
                }
                }

            }

            K--;
            if(K < 0) break;
        }
        return res;
    }
    
    
    private static void findParent(HashMap<TreeNode, TreeNode> hm, TreeNode root){
        if(root == null) return;
        if(root.left != null)
            hm.put(root.left, root);
        
        if(root.right != null)
            hm.put(root.right, root);
    
        findParent(hm, root.left);
        findParent(hm, root.right);
        return;
    }
}