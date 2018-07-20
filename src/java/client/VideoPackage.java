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
public class VideoPackage extends Package

{
    private VideoList videoList;
    
    public VideoPackage(long carrierID, String packageName)
            
    {
        super(carrierID, packageName);
        this.videoList = new VideoList();
    }
    
    public VideoList getVideoList() 
    
    {
        return videoList;
    }

    public void setVideoList(VideoList videoList) 
    
    {
        this.videoList = videoList;
    }
    
}
