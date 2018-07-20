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
public class VideoPackageNode 

{
    private VideoPackage videoPackage;
    private VideoPackageNode previousNode;
    private VideoPackageNode nextNode;
    
    public VideoPackageNode(VideoPackage videoPackage, VideoPackageNode previousNode, VideoPackageNode nextNode)
            
    {
        this.videoPackage = videoPackage;
        this.previousNode = previousNode;
        this.nextNode = nextNode;
    }

    public VideoPackage getVideoPackage() 
    
    {
        return videoPackage;
    }

    public void setVideoPackage(VideoPackage videoPackage) 
    
    {
        this.videoPackage = videoPackage;
    }

    public VideoPackageNode getPreviousNode() 
    
    {
        return previousNode;
    }

    public void setPreviousNode(VideoPackageNode previousNode) 
    
    {
        this.previousNode = previousNode;
    }

    public VideoPackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(VideoPackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
    
}
