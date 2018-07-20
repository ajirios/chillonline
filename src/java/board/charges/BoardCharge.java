/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.charges;

/**
 *
 * @author El Jefe
 */
public class BoardCharge 

{
    private long boardID;
    private long accountNumber;
    private long chargeID;
    private long longitudinalChargeDate;
    private String chargeDate;
    
    public BoardCharge(long chargeID, long boardID, long accountNumber, String chargeDate, long longitudinalChargeDate)
            
    {
        this.boardID = boardID;
        this.accountNumber = accountNumber;
        this.chargeDate = chargeDate;
        this.longitudinalChargeDate = longitudinalChargeDate;
        this.chargeID = chargeID;
    }
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public long getAccountNumber() 
    
    {
        return accountNumber;
    }

    public void setAccountNumber(long accountNumber) 
    
    {
        this.accountNumber = accountNumber;
    }

    public long getChargeID() 
    
    {
        return chargeID;
    }

    public void setChargeID(long chargeID) 
    
    {
        this.chargeID = chargeID;
    }

    public long getLongitudinalChargeDate() 
    
    {
        return longitudinalChargeDate;
    }

    public void setLongitudinalChargeDate(long longitudinalChargeDate) 
    
    {
        this.longitudinalChargeDate = longitudinalChargeDate;
    }

    public String getChargeDate() 
    
    {
        return chargeDate;
    }

    public void setChargeDate(String chargeDate) 
    
    {
        this.chargeDate = chargeDate;
    }
    
}
