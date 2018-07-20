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
public class LinkedList 

{
    protected Node firstNode;
    protected int size;
    
    public LinkedList()
            
    {
        this.firstNode = null;
    }

    public int getSize() 
    
    {
        return size;
    }

    private void setSize(int size) 
    
    {
        this.size = size;
    }
    
}
