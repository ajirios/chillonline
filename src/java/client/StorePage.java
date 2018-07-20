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
public class StorePage 

{
    private int pageNumber;
    private static final int NUMBER_OF_ALLOWED_PROGRAMS = 18;
    private Program[] programs;
    
    public StorePage(int pageNumber)
            
    {
        this.pageNumber = pageNumber + 1;
        this.programs = new Program[NUMBER_OF_ALLOWED_PROGRAMS];
    }

    public int getPageNumber() 
    
    {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) 
    
    {
        this.pageNumber = pageNumber;
    }

    public Program[] getPrograms() 
    
    {
        return programs;
    }

    public void setPrograms(Program[] programs) 
    
    {
        this.programs = programs;
    }

    
    
}
