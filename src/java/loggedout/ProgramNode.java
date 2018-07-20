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
public class ProgramNode 

{
    private Program program;
    private ProgramNode nextNode;
    
    public ProgramNode(Program program, ProgramNode nextNode)
            
    {
        this.program = program;
        this.nextNode = nextNode;
    }

    public Program getProgram() 
    
    {
        return program;
    }

    public void setProgram(Program program) 
    
    {
        this.program = program;
    }

    public ProgramNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(ProgramNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
    
}
