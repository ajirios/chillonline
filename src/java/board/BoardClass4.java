/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board;

/**
 *
 * @author El Jefe
 */
public class BoardClass4 extends Board

{
    
    public BoardClass4(long clientID, String boardName, int boardClass, String description, String publicityMode)
            
    {
        super(clientID, boardName, boardClass, description, publicityMode);
        
        setBoardClass(4);
        setBoardPrice(1299);
    }
    
    public BoardClass4(long boardID)
            
    {
        super(boardID);
        
        setBoardClass(4);
        setBoardPrice(1299);
    }
    
}
