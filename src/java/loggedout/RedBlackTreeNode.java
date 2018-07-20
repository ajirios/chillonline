/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;

/**
 *
 * @author El Jefe
 */
public class RedBlackTreeNode 

{
    private Object object;
    private RedBlackTreeNode leftNode;
    private RedBlackTreeNode rightNode;
    
    public RedBlackTreeNode(Object object, RedBlackTreeNode leftNode, RedBlackTreeNode rightNode)
            
    {
        this.object = object;
        this.leftNode = leftNode;
        this.rightNode = rightNode;
    }

    public Object getObject() 
    
    {
        return object;
    }

    public void setObject(Object object) 
    
    {
        this.object = object;
    }

    public RedBlackTreeNode getLeftNode() 
    
    {
        return leftNode;
    }

    public void setLeftNode(RedBlackTreeNode leftNode) 
    
    {
        this.leftNode = leftNode;
    }

    public RedBlackTreeNode getRightNode() 
    
    {
        return rightNode;
    }

    public void setRightNode(RedBlackTreeNode rightNode) 
    
    {
        this.rightNode = rightNode;
    }
    
}
