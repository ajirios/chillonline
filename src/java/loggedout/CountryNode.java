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
public class CountryNode 

{
    private Country country;
    private CountryNode nextNode;
    
    public CountryNode(Country country, CountryNode nextNode)
            
    {
        this.country = country;
        this.nextNode = nextNode;
    }

    public Country getCountry() 
    
    {
        return country;
    }

    public void setCountry(Country country) 
    
    {
        this.country = country;
    }

    public CountryNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(CountryNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
    
}
