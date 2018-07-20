/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package programs;

/**
 *
 * @author El Jefe
 */
public class Game extends Program

{
    private String purchasePrice;
    
    public Game(long programID, String programName, String programPoster, String distributor, String locality, String purchasePrice)
            
    {
        super(programID, programName, programPoster, distributor, locality);
        this.purchasePrice = purchasePrice;
    }

    public String getPurchasePrice() 
    
    {
        return purchasePrice;
    }

    public void setPurchasePrice(String purchasePrice) 
    
    {
        this.purchasePrice = purchasePrice;
    }
    
}
