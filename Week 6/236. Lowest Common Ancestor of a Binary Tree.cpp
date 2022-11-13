// Solution - https://www.youtube.com/watch?v=_-QHfMDde90

// Runtime: 31 ms, faster than 61.87% of C++ online submissions for Lowest Common Ancestor of a Binary Tree.
// Memory Usage: 14.3 MB, less than 24.26% of C++ online submissions for Lowest Common Ancestor of a Binary Tree.

// Time - O(n) for traversing all nodes
// Space - O(1)

struct TreeNode
{
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(NULL), right(NULL) {}
};

class Solution
{
public:
    TreeNode *lowestCommonAncestor(TreeNode *root, TreeNode *p, TreeNode *q)
    {
        if (root == NULL || root == p || root == q)
            return root; // if current node is same as 'p' OR 'q'.

        TreeNode *left = lowestCommonAncestor(root->left, p, q);
        TreeNode *right = lowestCommonAncestor(root->right, p, q);

        if (left == NULL)
        {
            return right;
        }
        else if (right == NULL)
        {
            return left;
        }
        else
        {
            return root;
        }
    }
};