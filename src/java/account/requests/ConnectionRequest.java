/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.requests;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class ConnectionRequest 

{
    private long accountNumber;
    private long clientID;
    private long clientAccountNumber;
    private String firstName;
    private String clientName;
    private String city;
    private String province;
    private String country;
    private String gender;
    private String emailAddress;
    private String phoneNumber;
    private String wallPaper;
    private String profilePicture;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";
    
    public ConnectionRequest(long accountNumber, long clientID, String firstName, String clientName, String city, String province, String country, String gender, String emailAddress, String phoneNumber, String wallPaper, String profilePicture)
            
    {
        this.accountNumber = accountNumber;
        this.clientID = clientID;
        this.clientAccountNumber = -1;
        this.firstName = firstName;
        this.clientName = clientName;
        this.city = city;
        this.province = province;
        this.country = country;
        this.gender = gender;
        this.emailAddress = emailAddress;
        this.phoneNumber = phoneNumber;
        this.wallPaper = wallPaper;
        this.profilePicture = profilePicture;
        
        constructConnection();
        
    }
    
    private void constructConnection()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        
        try
        {
            connection = DriverManager.getConnection(URL, userName, password);
            statement = connection.prepareStatement("SELECT accountNumber FROM accounts WHERE accountHolderID=" + this.clientID + " AND accountType='client'");
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {
            if (resultSet != null)
                
                {

                if (resultSet.next() == true) 
                    
                {
                    
                    this.clientAccountNumber = Long.parseLong(resultSet.getString("accountNumber")); 
                    
                }
                
            }
            
            else
                
            {
                
                this.clientAccountNumber = -1;
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public long getAccountNumber() 
    
    {
        return accountNumber;
    }
    
    public void setAccountNumber(long accountNumber) 
    
    {
        this.accountNumber = accountNumber;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public long getClientAccountNumber() 
    
    {
        return clientAccountNumber;
    }

    public void setClientAccountNumber(long clientAccountNumber) 
    
    {
        this.clientAccountNumber = clientAccountNumber;
    }

    public String getFirstName() 
    
    {
        return firstName;
    }

    public void setFirstName(String firstName) 
    
    {
        this.firstName = firstName;
    }

    public String getClientName() 
    
    {
        return clientName;
    }

    public void setClientName(String clientName) 
    
    {
        this.clientName = clientName;
    }

    public String getCity() 
    
    {
        return city;
    }

    public void setCity(String city) 
    
    {
        this.city = city;
    }

    public String getProvince() 
    
    {
        return province;
    }

    public void setProvince(String province) 
    
    {
        this.province = province;
    }

    public String getCountry() 
    
    {
        return country;
    }

    public void setCountry(String country) 
    
    {
        this.country = country;
    }

    public String getGender() 
    
    {
        return gender;
    }

    public void setGender(String gender) 
    
    {
        this.gender = gender;
    }

    public String getEmailAddress() 
    
    {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) 
    
    {
        this.emailAddress = emailAddress;
    }

    public String getPhoneNumber() 
    
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) 
    
    {
        this.phoneNumber = phoneNumber;
    }

    public String getWallPaper() 
    
    {
        return wallPaper;
    }

    public void setWallPaper(String wallPaper) 
    
    {
        this.wallPaper = wallPaper;
    }

    public String getProfilePicture() 
    
    {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) 
    
    {
        this.profilePicture = profilePicture;
    }
    
}
