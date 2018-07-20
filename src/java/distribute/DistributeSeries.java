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
public class DistributeSeries extends DistributeProgram 

{
    protected String rentalPrice;
    protected String purchasePrice;
    protected String promoPoster;
    protected String genre;
    protected String runTime;
    
    public DistributeSeries(String programName, String programPoster, String distributor, String locality, String rentalPrice, String purchasePrice)
            
    {
        super(programName, programPoster, distributor, locality);
        this.rentalPrice = rentalPrice;
        this.purchasePrice = purchasePrice;
        this.genre = null;
        this.promoPoster = null;
        this.runTime = null;  
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public void setRentalPrice(String rentalPrice) 
    
    {
        this.rentalPrice = rentalPrice;
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

    public String getGenre() 
    
    {
        return genre;
    }

    public void setGenre(String genre) 
    
    {
        this.genre = genre;
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
