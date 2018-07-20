/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stripe;

import com.stripe.exception.APIConnectionException;
import com.stripe.exception.AuthenticationException;
import com.stripe.exception.CardException;
import com.stripe.exception.InvalidRequestException;
import com.stripe.exception.RateLimitException;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.stripe.net.RequestOptions;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author El Jefe
 */
public class StripeCharge 

{
    private int amount;
    private String creditCardNumber;
    private int expiryMonth;
    private int expiryYear;
    private String ccv;
    
    private boolean chargeCompleted;
    
    public StripeCharge(int amount, String creditCardNumber, int expiryMonth, int expiryYear, String ccv)
            
    {
        this.amount = amount;
        this.creditCardNumber = creditCardNumber;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
        this.ccv = ccv;
        this.chargeCompleted = false;
        
        constructCharge();
        
    }
    
    private void constructCharge()
            
    {
        String testApiKey = "sk_test_fvR8wpEvVNqLvWhZ3LUXDgD9";
        String liveApiKey = "sk_live_XofpDpPentH6l5FFqh8EQYCC";
        
        RequestOptions requestOptions = (new RequestOptions.RequestOptionsBuilder()).setApiKey("sk_live_XofpDpPentH6l5FFqh8EQYCC").build();
        Map<String, Object> chargeMap = new HashMap<String, Object>();
        chargeMap.put("amount", amount);
        chargeMap.put("currency", "usd");
        Map<String, Object> cardMap = new HashMap<String, Object>();
        cardMap.put("number", creditCardNumber);
        cardMap.put("exp_month", expiryMonth);
        cardMap.put("exp_year", expiryYear);
        cardMap.put("description", "Board charge");
        cardMap.put("receipt_email", "service@chilltechnologies.ca");
        cardMap.put("source", "sk_live_XofpDpPentH6l5FFqh8EQYCC");
        chargeMap.put("card", cardMap);
        
        
        try 
        
        {
            Charge charge = Charge.create(chargeMap, requestOptions);
            this.chargeCompleted = true;
        } 
        
        catch (CardException e) 
        
        {
            // Since it's a decline, CardException will be caught
            System.out.println("Status is: " + e.getCode());
            System.out.println("Message is: " + e.getMessage());
        } 

        catch (RateLimitException e) 
        
        {
            // Too many requests made to the API too quickly
            System.out.println("Message is: " + e.getMessage());
        } 
        
        catch (InvalidRequestException e) 
        
        {
          // Invalid parameters were supplied to Stripe's API
            System.out.println("Message is: " + e.getMessage());
        } 
        
        catch (AuthenticationException e) 
        
        {
          // Authentication with Stripe's API failed
          // (maybe you changed API keys recently)
            System.out.println("Message is: " + e.getMessage());
        } 
        
        catch (APIConnectionException e) 
        
        {
          // Network communication with Stripe failed
            System.out.println("Message is: " + e.getMessage());
        } 
        
        catch (StripeException e) 
        
        {
            e.printStackTrace();
        }
        
        catch (Exception e) 
        
        {
          // Something else happened, completely unrelated to Stripe
            System.out.println("Message is: " + e.getMessage());
        }
        
    }

    public boolean isChargeCompleted() 
    
    {
        return chargeCompleted;
    }
    
}
