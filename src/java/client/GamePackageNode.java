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
public class GamePackageNode 

{
    private GamePackage gamePackage;
    private GamePackageNode previousNode;
    private GamePackageNode nextNode;
    
    public GamePackageNode(GamePackage gamePackage, GamePackageNode previousNode, GamePackageNode nextNode)
            
    {
        this.gamePackage = gamePackage;
        this.previousNode = previousNode;
        this.nextNode = nextNode;
    }

    public GamePackage getGamePackage() 
    
    {
        return gamePackage;
    }

    public void setGamePackage(GamePackage gamePackage) 
    
    {
        this.gamePackage = gamePackage;
    }

    public GamePackageNode getPreviousNode() 
    
    {
        return previousNode;
    }

    public void setPreviousNode(GamePackageNode previousNode) 
    
    {
        this.previousNode = previousNode;
    }

    public GamePackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(GamePackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
}
