/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package linkedlist;

/**
 *
 * @author El Jefe
 */
public class Node 

{
    protected Object object;
    protected Node nextNode;
    
    public Node(Object object, Node nextNode)
            
    {
        this.object = object;
        this.nextNode = nextNode;
    }

    public Object getObject() 
    
    {
        return object;
    }

    public void setObject(Object object) 
    
    {
        this.object = object;
    }

    public Node getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(Node nextNode) 
    
    {
        this.nextNode = nextNode;
    }
    
}
