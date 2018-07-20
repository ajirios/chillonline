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
public class MusicPackageNode 

{
    private MusicPackage musicPackage;
    private MusicPackageNode previousNode;
    private MusicPackageNode nextNode;
    
    public MusicPackageNode(MusicPackage musicPackage, MusicPackageNode previousNode, MusicPackageNode nextNode)
            
    {
        this.musicPackage = musicPackage;
        this.previousNode = previousNode;
        this.nextNode = nextNode;
    }

    public MusicPackage getMusicPackage() 
    
    {
        return musicPackage;
    }

    public void setMusicPackage(MusicPackage musicPackage) 
    
    {
        this.musicPackage = musicPackage;
    }

    public MusicPackageNode getPreviousNode() 
    
    {
        return previousNode;
    }

    public void setPreviousNode(MusicPackageNode previousNode) 
    
    {
        this.previousNode = previousNode;
    }

    public MusicPackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(MusicPackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
}
