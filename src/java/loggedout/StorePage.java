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
public class StorePage 

{
    private int pageNumber;
    private static final int NUMBER_OF_ALLOWED_PROGRAMS = 18;
    private Program[] programs;
    private ProgramList programList;
    
    public StorePage(int pageNumber)
            
    {
        this.pageNumber = pageNumber;
        this.programs = new Program[NUMBER_OF_ALLOWED_PROGRAMS];
        this.programList = new ProgramList();
    }

    public int getPageNumber() 
    
    {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) 
    
    {
        this.pageNumber = pageNumber;
    }

    public ProgramList getProgramList() 
    
    {
        return programList;
    }

    public void setProgramList(ProgramList programList) 
    
    {
        this.programList = programList;
    }

    public Program[] getPrograms() 
    
    {
        return programs;
    }

    public void setPrograms(Program[] programs) 
    
    {
        this.programs = programs;
    }
    
    public Program getProgram(int count)
            
    {
        return this.programs[count];
    }
    
    public void setProgram(int count, Program program)
            
    {
        this.programs[count] = program;
    }
    
    public void insertProgram(Program program)
            
    {
        this.programList.insert(program);
    }
    
}
