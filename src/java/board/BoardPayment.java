/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board;

import stripe.StripeCharge;

/**
 *
 * @author El Jefe
 */
public class BoardPayment 

{
    protected long boardID;
    protected long paymentID;
    protected String paymentTimestamp;
    private int amount;
    private String creditCardNumber;
    private int expiryMonth;
    private int expiryYear;
    private String ccv;
    
    private boolean chargeCompleted;
    
    public BoardPayment(long boardID, int amount, String creditCardNumber, int expiryMonth, int expiryYear, String ccv)
            
    {
        this.boardID = boardID;
        this.paymentID = -1;
        this.paymentTimestamp = null;
        
        this.amount = amount;
        this.creditCardNumber = creditCardNumber;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
        this.ccv = ccv;
        this.chargeCompleted = false;
        
        constructBoardPayment();
    }
    
    private void constructBoardPayment()
            
    {
        StripeCharge boardPaymentCharge;
        
        boardPaymentCharge = new StripeCharge(amount, creditCardNumber, expiryMonth, expiryYear, ccv);
        this.chargeCompleted = boardPaymentCharge.isChargeCompleted();
        
    }

    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public long getPaymentID() 
    
    {
        return paymentID;
    }

    public void setPaymentID(long paymentID) 
    
    {
        this.paymentID = paymentID;
    }

    public String getPaymentTimestamp() 
    
    {
        return paymentTimestamp;
    }

    public void setPaymentTimestamp(String paymentTimestamp) 
    
    {
        this.paymentTimestamp = paymentTimestamp;
    }

    public boolean isChargeCompleted() 
    
    {
        return chargeCompleted;
    }
    
}
