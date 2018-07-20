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
public class ProgramList 

{
    private ProgramNode firstNode;
    
    public ProgramList()
            
    {
        this.firstNode = null;
    }
    
    public void insert(Program program)
            
    {
        ProgramNode newNode = new ProgramNode(program, firstNode);
        firstNode = newNode;
    }
    
    public ProgramNode searchByProgramID(long programID)
            
    {
        ProgramNode currentNode;
        
        currentNode = firstNode;
        
        while ((currentNode != null) && (currentNode.getProgram().getProgramID() != programID))
            
        {
            currentNode = currentNode.getNextNode();
        }
        
        if ((currentNode != null) && (currentNode.getProgram().getProgramID() != programID))
            
        {
            currentNode = null;
        }
        
        return currentNode;
    }
    
    public ProgramNode searchByProgramName(String programName)
            
    {
        ProgramNode currentNode;
        
        currentNode = firstNode;
        
        while ((currentNode != null) && (!currentNode.getProgram().getProgramName().equalsIgnoreCase(programName)))
            
        {
            currentNode = currentNode.getNextNode();
        }
        
        if ((currentNode != null) && (!currentNode.getProgram().getProgramName().equalsIgnoreCase(programName)))
            
        {
            currentNode = null;
        }
        
        return currentNode;
    }
    
    public void delete(long programID)
            
    {
        ProgramNode previousNode;
        ProgramNode currentNode;
        
        previousNode = null;
        currentNode = firstNode;
        
        while ((currentNode != null) && (currentNode.getProgram().getProgramID() != programID))
            
        {
            previousNode = currentNode;
            currentNode = currentNode.getNextNode();
        }
        
        if (currentNode != null)
            
        {
            if (previousNode != null)
                
            {
                previousNode.setNextNode(currentNode.getNextNode());
            }
            
            else
                
            {
                firstNode = currentNode.getNextNode();
            }
            
        }
        
    }
    
    public int length()
            
    {
        int length;
        
        length = 0;
        
        return length;
        
    }
    
    public void sortByProgramID()
            
    {
        
    }
    
    public void sortByProgramName()
            
    {
        
    }
    
    public void sortByDistributionDate()
            
    {
        
    }
    
    public void reverse()
            
    {
        
    }
    
}
