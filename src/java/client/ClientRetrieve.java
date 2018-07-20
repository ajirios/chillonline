/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import account.AccountRetrieve;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class ClientRetrieve 

{
    private long accountNumber;
    private long clientID;
    private String firstName;
    private String lastName;
    private String middleName;
    private String clientName;
    private int nameStyle;
    private String organization;
    private String city;
    private String province;
    private String country;
    private String gender;
    private String emailAddress;
    private String password;
    private String phoneNumber;
    private String profilePicture;
    private String wallPaper;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public ClientRetrieve(long accountNumber)
            
    {
        this.accountNumber = accountNumber;
        this.firstName = null;
        this.lastName = null;
        this.middleName = null;
        this.clientName = null;
        this.nameStyle = 1;
        this.organization = null;
        this.city = null;
        this.province = null;
        this.country = null;
        this.gender = null;
        this.emailAddress = null;
        this.password = null;
        this.phoneNumber = null;
        this.profilePicture = null;
        this.wallPaper = null;
        
        AccountRetrieve account = new AccountRetrieve(accountNumber);
        
        this.clientID = account.getAccountHolderIDByAccountNumber();
        
        if (this.clientID != -1)
            
        {
            constructClientByAccountNumber();
        }
        
    }
    
    public ClientRetrieve(long clientID, String accountType)
            
    {
        this.clientID = clientID;
        AccountRetrieve account = new AccountRetrieve(clientID, accountType);
        this.accountNumber = account.getAccountNumberByClientID();
        this.firstName = null;
        this.lastName = null;
        this.middleName = null;
        this.clientName = null;
        this.nameStyle = 1;
        this.organization = null;
        this.city = null;
        this.province = null;
        this.country = null;
        this.gender = null;
        this.emailAddress = null;
        this.password = null;
        this.phoneNumber = null;
        this.profilePicture = null;
        this.wallPaper = null;
        
        constructClientByAccountNumber();
        
    }
    
    private void constructClientByAccountNumber()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT firstName, lastName, middleName, clientName, organization, emailAddress, city, province, country, "
                    + "gender, wallPoster, profilePicture, phoneNumber, nameStyle, password FROM `clients` WHERE clientID=" + this.clientID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet != null)
                
            {
                
                if (resultSet.next() == true)

                {

                    this.firstName = resultSet.getString("firstName"); 
                    this.lastName = resultSet.getString("lastName");
                    this.middleName = resultSet.getString("middleName");
                    this.clientName = resultSet.getString("clientName");
                    
                    if (resultSet.getString("nameStyle") != null)
                        
                    {
                        this.nameStyle = Integer.parseInt(resultSet.getString("nameStyle"));
                    }
                    
                    if (resultSet.getString("organization") != null)
                        
                    {
                        this.organization = resultSet.getString("organization");
                    }
                    
                    this.city = resultSet.getString("city");
                    this.province = resultSet.getString("province");
                    this.country = resultSet.getString("country");
                    this.gender = resultSet.getString("gender");
                    this.emailAddress = resultSet.getString("emailAddress");
                    this.password = resultSet.getString("password");
                    this.phoneNumber = resultSet.getString("phoneNumber");
                    this.profilePicture = resultSet.getString("profilePicture");
                    this.wallPaper = resultSet.getString("wallPoster");

                }

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

    public long getClientID() 
    
    {
        return clientID;
    }

    public String getFirstName() 
    
    {
        return firstName;
    }

    public String getLastName() 
    
    {
        return lastName;
    }

    public String getMiddleName() 
    
    {
        return middleName;
    }

    public String getClientName() 
    
    {
        return clientName;
    }

    public int getNameStyle() 
    
    {
        return nameStyle;
    }

    public String getCity() 
    
    {
        return city;
    }

    public String getProvince() 
    
    {
        return province;
    }

    public String getCountry() 
    
    {
        return country;
    }

    public String getGender() 
    
    {
        return gender;
    }

    public String getEmailAddress() 
    
    {
        return emailAddress;
    }

    public String getPassword() 
    
    {
        return password;
    }

    public String getPhoneNumber() 
    
    {
        return phoneNumber;
    }

    public String getProfilePicture() 
    
    {
        return profilePicture;
    }

    public String getWallPaper() 
    
    {
        return wallPaper;
    }

    public String getOrganization() 
    
    {
        return organization;
    }
    
}
