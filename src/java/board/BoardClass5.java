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
public class BoardClass5 extends Board

{
    
    public BoardClass5(long clientID, String boardName, int boardClass, String description, String publicityMode)
            
    {
        super(clientID, boardName, boardClass, description, publicityMode);
        
        setBoardClass(5);
        setBoardPrice(4499);
    }
    
    public BoardClass5(long boardID)
            
    {
        super(boardID);
        
        setBoardClass(5);
        setBoardPrice(4499);
    }
    
}
