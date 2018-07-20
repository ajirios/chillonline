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
public class SeriesPackageNode 

{
    private SeriesPackage seriesPackage;
    private SeriesPackageNode previousNode;
    private SeriesPackageNode nextNode;
    
    public SeriesPackageNode(SeriesPackage seriesPackage, SeriesPackageNode previousNode, SeriesPackageNode nextNode)
            
    {
        this.seriesPackage = seriesPackage;
        this.previousNode = previousNode;
        this.nextNode = nextNode;
    }

    public SeriesPackage getSeriesPackage() 
    
    {
        return seriesPackage;
    }

    public void setSeriesPackage(SeriesPackage seriesPackage) 
    
    {
        this.seriesPackage = seriesPackage;
    }

    public SeriesPackageNode getPreviousNode() 
    
    {
        return previousNode;
    }

    public void setPreviousNode(SeriesPackageNode previousNode) 
    
    {
        this.previousNode = previousNode;
    }

    public SeriesPackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(SeriesPackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
}
