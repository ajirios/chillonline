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
public class GamePackage extends Package

{
    private GameList gameList;
    
    public GamePackage(long carrierID, String packageName)
            
    {
        super(carrierID, packageName);
        this.gameList = new GameList();
    }
    
    public GameList getGameList() 
    
    {
        return gameList;
    }

    public void setGameList(GameList gameList) 
    
    {
        this.gameList = gameList;
    }
    
}
