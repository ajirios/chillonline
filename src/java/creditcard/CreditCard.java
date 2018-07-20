/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package creditcard;

/**
 *
 * @author El Jefe
 */
public class CreditCard 

{
    private long accountNumber;
    private long clientID;
    private long creditCardID;
    private String creditCardNumber;
    private int expiryMonth;
    private int expiryYear;
    private String ccv;
    private String paymentType;
    private String creditCardName;
    
    public CreditCard(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        this.clientID = -1;
        this.creditCardID = -1;
        this.creditCardNumber = null;
        this.expiryMonth = 0;
        this.expiryYear = 0;
        this.ccv = null;
        this.paymentType = null;
        this.creditCardName = null;
    }

    public long getAccountNumber() 
    
    {
        return accountNumber;
    }

    public void setAccountNumber(long accountNumber) 
    
    {
        this.accountNumber = accountNumber;
    }

    public String getCreditCardNumber() 
    
    {
        return creditCardNumber;
    }

    public void setCreditCardNumber(String creditCardNumber) 
    
    {
        this.creditCardNumber = creditCardNumber;
    }

    public int getExpiryMonth() 
    
    {
        return expiryMonth;
    }

    public void setExpiryMonth(int expiryMonth) 
    
    {
        this.expiryMonth = expiryMonth;
    }

    public int getExpiryYear() 
    
    {
        return expiryYear;
    }

    public void setExpiryYear(int expiryYear) 
    
    {
        this.expiryYear = expiryYear;
    }

    public String getCcv() 
    
    {
        return ccv;
    }

    public void setCcv(String ccv) 
    
    {
        this.ccv = ccv;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public long getCreditCardID() 
    
    {
        return creditCardID;
    }

    public void setCreditCardID(long creditCardID) 
    
    {
        this.creditCardID = creditCardID;
    }

    public String getPaymentType() 
    
    {
        return paymentType;
    }

    public void setPaymentType(String paymentType) 
    
    {
        this.paymentType = paymentType;
    }

    public String getCreditCardName() 
    
    {
        return creditCardName;
    }

    public void setCreditCardName(String creditCardName) 
    
    {
        this.creditCardName = creditCardName;
    }
    
}
