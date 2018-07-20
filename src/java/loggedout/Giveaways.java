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
public class Giveaways 

{
    private int numberOfProgramsInGiveaways;
    private static final int NUMBER_OF_PROGRAMS_PER_STEP = 18;
    private static int numberOfGiveawaysSteps;
    private GiveawaysStep[] giveawaysSteps;
    private ProgramList programList;
    
    public Giveaways(int numberOfProgramsInGiveaways)
            
    {
        this.numberOfProgramsInGiveaways = numberOfProgramsInGiveaways;
        double programCountNumerator = (double) numberOfProgramsInGiveaways;
        double stepCountDenominator = (double) NUMBER_OF_PROGRAMS_PER_STEP;
        this.numberOfGiveawaysSteps = (int) Math.ceil(programCountNumerator / stepCountDenominator);
        giveawaysSteps = new GiveawaysStep[numberOfGiveawaysSteps];
        this.programList = new ProgramList();
    }

    public ProgramList getProgramList() 
    
    {
        return programList;
    }

    public void setProgramList(ProgramList programList) 
    
    {
        this.programList = programList;
    }

    public int getNumberOfProgramsInGiveaways() 
    
    {
        return numberOfProgramsInGiveaways;
    }

    public void setNumberOfProgramsInGiveaways(int numberOfProgramsInGiveaways) 
    
    {
        this.numberOfProgramsInGiveaways = numberOfProgramsInGiveaways;
    }

    public static int getNumberOfGiveawaysSteps() 
    
    {
        return numberOfGiveawaysSteps;
    }

    public static void setNumberOfGiveawaysSteps(int numberOfGiveawaysSteps) 
    
    {
        Giveaways.numberOfGiveawaysSteps = numberOfGiveawaysSteps;
    }

    public GiveawaysStep[] getGiveawaysSteps() 
    
    {
        return giveawaysSteps;
    }

    public void setGiveawaysSteps(GiveawaysStep[] giveawaysSteps) 
    
    {
        this.giveawaysSteps = giveawaysSteps;
    }
}
