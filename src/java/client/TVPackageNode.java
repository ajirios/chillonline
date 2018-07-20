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
public class TVPackageNode 

{
    private TVPackage tvPackage;
    private TVPackageNode previousNode;
    private TVPackageNode nextNode;
    
    public TVPackageNode(TVPackage tvPackage, TVPackageNode previousNode, TVPackageNode nextNode)
            
    {
        this.tvPackage = tvPackage;
        this.previousNode = previousNode;
        this.nextNode = nextNode;
    }

    public TVPackage getTvPackage() 
    
    {
        return tvPackage;
    }

    public void setTvPackage(TVPackage tvPackage) 
    
    {
        this.tvPackage = tvPackage;
    }

    public TVPackageNode getPreviousNode() 
    
    {
        return previousNode;
    }

    public void setPreviousNode(TVPackageNode previousNode) 
    
    {
        this.previousNode = previousNode;
    }

    public TVPackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(TVPackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
}
