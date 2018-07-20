/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

/**
 *
 * @author El Jefe
 */
public class TVPackage extends Package

{
    private TVChannelList tvChannelList;
    
    public TVPackage(long carrierID, String packageName)
            
    {
        super(carrierID, packageName);
        this.tvChannelList = new TVChannelList();
    }
    
    public TVChannelList getTvChannelList() 
    
    {
        return tvChannelList;
    }

    public void setTvChannelList(TVChannelList tvChannelList) 
    
    {
        this.tvChannelList = tvChannelList;
    }
    
}
