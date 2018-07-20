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
public class MusicPackage extends Package

{
    private MusicList musicList;
    
    public MusicPackage(long carrierID, String packageName)
            
    {
        super(carrierID, packageName);
        this.musicList = new MusicList();
    }
    
    public MusicList getMusicList() 
    
    {
        return musicList;
    }

    public void setMusicList(MusicList musicList) 
    
    {
        this.musicList = musicList;
    }
    
}
