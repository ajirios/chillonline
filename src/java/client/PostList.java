/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

/**
 *
 * @author El Jefe
 */
public class PostList 

{
    private PostNode firstNode;
    
    public PostList()
            
    {
        this.firstNode = null;
    }

    public PostNode getFirstNode() 
    
    {
        return firstNode;
    }

    public void setFirstNode(PostNode firstNode) 
    
    {
        this.firstNode = firstNode;
    }
    
    
    
}
