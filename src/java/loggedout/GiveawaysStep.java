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
public class GiveawaysStep 

{
    private int stepID;
    private static final int NUMBER_OF_ALLOWED_PROGRAMS = 18;
    private Program[] programs;
    
    public GiveawaysStep(int stepID)
            
    {
        this.stepID = stepID;
        this.programs = new Program[NUMBER_OF_ALLOWED_PROGRAMS];
    }

    public int getStepID() 
    
    {
        return stepID;
    }

    public void setStepID(int stepID) 
    
    {
        this.stepID = stepID;
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
