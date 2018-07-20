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
public class Country 

{
    private long countryID;
    private String countryName;
    
    public Country(String countryName)
            
    {
        this.countryName = countryName;
    }

    public long getCountryID() 
    
    {
        return countryID;
    }

    public void setCountryID(long countryID) 
    
    {
        this.countryID = countryID;
    }

    public String getCountryName() 
    
    {
        return countryName;
    }

    public void setCountryName(String countryName) 
    
    {
        this.countryName = countryName;
    }
}
