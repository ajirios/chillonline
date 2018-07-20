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
public class ProgramList 

{
    private ProgramNode firstNode;
    private int length;
    
    public ProgramList()
            
    {
        this.firstNode = null;
        this.length = 0;
    }

    public ProgramNode getFirstNode() 
    
    {
        return firstNode;
    }

    public void setFirstNode(ProgramNode firstNode) 
    
    {
        this.firstNode = firstNode;
    }
    
    public void insert(Program program)
            
    {
        ProgramNode newNode = new ProgramNode(program, firstNode);
        firstNode = newNode;
        length++;
    }
    
    public int length()
            
    {
        
        return this.length; 
        
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
