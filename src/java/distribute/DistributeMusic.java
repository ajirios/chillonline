/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package distribute;

/**
 *
 * @author El Jefe
 */
public class DistributeMusic extends DistributeProgram 

{
    private String purchasePrice;
    private String promoPoster;
    private String runTime;
    
    public DistributeMusic(String programName, String programPoster, String distributor, String locality, String purchasePrice)
            
    {
        super(programName, programPoster, distributor, locality);
        this.purchasePrice = purchasePrice;
        this.promoPoster = null;
        this.runTime = null;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public void setPurchasePrice(String purchasePrice) 
    
    {
        this.purchasePrice = purchasePrice;
    }

    public String getPromoPoster() 
    
    {
        return promoPoster;
    }

    public void setPromoPoster(String promoPoster) 
    
    {
        this.promoPoster = promoPoster;
    }

    public String getRunTime() 
    
    {
        return runTime;
    }

    public void setRunTime(String runTime) 
    
    {
        this.runTime = runTime;
    }
    
}
