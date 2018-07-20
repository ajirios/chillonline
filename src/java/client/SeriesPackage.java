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
public class SeriesPackage extends Package

{
    private TVSeriesList seriesList;
    
    public SeriesPackage(long carrierID, String packageName)
            
    {
        super(carrierID, packageName);
        this.seriesList = new TVSeriesList();
    }
    
    public TVSeriesList getSeriesList() 
    
    {
        return seriesList;
    }

    public void setSeriesList(TVSeriesList seriesList) 
    
    {
        this.seriesList = seriesList;
    }
    
}
