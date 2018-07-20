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
public class BoardClass2 extends Board

{
    
    public BoardClass2(long clientID, String boardName, int boardClass, String description, String publicityMode)
            
    {
        super(clientID, boardName, boardClass, description, publicityMode);
        
        setBoardClass(2);
        setBoardPrice(599);
    }
    
    public BoardClass2(long boardID)
            
    {
        super(boardID);
        
        setBoardClass(2);
        setBoardPrice(599);
    }
    
}
