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
public class CarriersStep 

{
    private int stepID;
    private static final int NUMBER_OF_ALLOWED_PACKAGES = 7;
    private Package[] packages;
    
    public CarriersStep(int stepID)
            
    {
        this.stepID = stepID;
        this.packages = new Package[NUMBER_OF_ALLOWED_PACKAGES];
    }

    public int getStepID() 
    
    {
        return stepID;
    }

    public void setStepID(int stepID) 
    
    {
        this.stepID = stepID;
    }

    public Package[] getPackages() 
    
    {
        return packages;
    }

    public void setPackages(Package[] packages) 
    
    {
        this.packages = packages;
    }
    
}
