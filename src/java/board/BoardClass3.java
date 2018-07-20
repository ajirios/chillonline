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
public class BoardClass3 extends Board

{
    
    public BoardClass3(long clientID, String boardName, int boardClass, String description, String publicityMode)
            
    {
        super(clientID, boardName, boardClass, description, publicityMode);
        
        setBoardClass(3);
        setBoardPrice(899);
    }
    
    public BoardClass3(long boardID)
            
    {
        super(boardID);
        
        setBoardClass(3);
        setBoardPrice(899);
    }
    
}
