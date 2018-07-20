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
public class CityNode 

{
    private City city;
    private CityNode nextNode;
    
    public CityNode(City city, CityNode nextNode)
            
    {
        this.city = city;
        this.nextNode = nextNode;
    }

    public City getCity() 
    
    {
        return city;
    }

    public void setCity(City city) 
    
    {
        this.city = city;
    }

    public CityNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(CityNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
    
}
