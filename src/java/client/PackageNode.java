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
public class PackageNode 

{
    private Package pack;
    private PackageNode nextNode;
    
    public PackageNode(Package pack, PackageNode nextNode)
            
    {
        this.pack = pack;
        this.nextNode = nextNode;
    }

    public Package getPack() 
    
    {
        return pack;
    }

    public void setPack(Package pack) 
    
    {
        this.pack = pack;
    }

    public PackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(PackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
    
}
