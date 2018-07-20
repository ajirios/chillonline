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
public class Region 

{
    private long regionID;
    private String regionName;
    
    public Region(String regionName)
            
    {
        this.regionID = 0;
        this.regionName = regionName;
    }

    public long getRegionID() 
    
    {
        return regionID;
    }

    public void setRegionID(long regionID) 
    
    {
        this.regionID = regionID;
    }

    public String getRegionName() 
    
    {
        return regionName;
    }

    public void setRegionName(String regionName) 
    
    {
        this.regionName = regionName;
    }
    
}
