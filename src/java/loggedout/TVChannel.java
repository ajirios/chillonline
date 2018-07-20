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
public class TVChannel extends Program

{
    private String rentalPrice;
    private String promoPoster;
    
    public TVChannel(long programID, String programName, String programPoster, String distributor, String locality, String rentalPrice)
            
    {
        super(programID, programName, programPoster, distributor, locality);
        this.rentalPrice = rentalPrice;
        this.promoPoster = null;
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public void setRentalPrice(String rentalPrice) 
    
    {
        this.rentalPrice = rentalPrice;
    }

    public String getPromoPoster() 
    
    {
        return promoPoster;
    }

    public void setPromoPoster(String promoPoster) 
    
    {
        this.promoPoster = promoPoster;
    }
}
