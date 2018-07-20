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
public class RadioPackage extends Package

{
    private RadioChannelList radioChannelList;
    
    public RadioPackage(long carrierID, String packageName)
            
    {
        super(carrierID, packageName);
        this.radioChannelList = new RadioChannelList();
    }
    
    public RadioChannelList getRadioChannelList() 
    
    {
        return radioChannelList;
    }

    public void setRadioChannelList(RadioChannelList radioChannelList) 
    
    {
        this.radioChannelList = radioChannelList;
    }
    
}
