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
public class ProgramHashTable 

{
    private Program[] programHashTable;
    private static final int SIZE = 999961;
    
    public ProgramHashTable()
            
    {
        this.programHashTable = new Program[SIZE];
    }

    public Program[] getProgramHashTable() 
    
    {
        return programHashTable;
    }

    public void setProgramHashTable(Program[] programHashTable) 
    
    {
        this.programHashTable = programHashTable;
    }
    
}
