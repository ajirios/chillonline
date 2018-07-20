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
public class RadioPackageNode 

{
    private RadioPackage radioPackage;
    private RadioPackageNode previousNode;
    private RadioPackageNode nextNode;
    
    public RadioPackageNode(RadioPackage radioPackage, RadioPackageNode previousNode, RadioPackageNode nextNode)
            
    {
        this.radioPackage = radioPackage;
        this.previousNode = previousNode;
        this.nextNode = nextNode;
    }

    public RadioPackage getRadioPackage() 
    
    {
        return radioPackage;
    }

    public void setRadioPackage(RadioPackage radioPackage) 
    
    {
        this.radioPackage = radioPackage;
    }

    public RadioPackageNode getPreviousNode() 
    
    {
        return previousNode;
    }

    public void setPreviousNode(RadioPackageNode previousNode) 
    
    {
        this.previousNode = previousNode;
    }

    public RadioPackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(RadioPackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
}
