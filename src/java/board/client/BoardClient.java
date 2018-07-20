/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board.client;


import client.PostList;

/**
 *
 * @author El Jefe
 */
public class BoardClient 

{
    private long boardID;
    private long clientID;
    private String firstName;
    private String lastName;
    private String middleName;
    private String clientName;
    private String city;
    private String province;
    private String country;
    private String gender;
    private String phoneNumber;
    private PostList postList;
    private String profilePicture;
    
    public BoardClient(long boardID, long clientID)
            
    {
        this.boardID = boardID;
        this.clientID = clientID;
        this.firstName = null;
        this.lastName = null;
        this.middleName = null;
        this.clientName = null;
        this.city = null;
        this.province = null;
        this.country = null;
        this.gender = null;
        this.phoneNumber = null;
        this.profilePicture = null;
        this.postList = null;
    }
    
    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public String getFirstName() 
    
    {
        return firstName;
    }

    public void setFirstName(String firstName) 
    
    {
        this.firstName = firstName;
    }

    public String getLastName() 
    
    {
        return lastName;
    }

    public void setLastName(String lastName) 
    
    {
        this.lastName = lastName;
    }

    public String getMiddleName() 
    
    {
        return middleName;
    }

    public void setMiddleName(String middleName) 
    
    {
        this.middleName = middleName;
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

    public String getPhoneNumber() 
    
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) 
    
    {
        this.phoneNumber = phoneNumber;
    }

    public PostList getPostList() 
    
    {
        return postList;
    }

    public void setPostList(PostList postList) 
    
    {
        this.postList = postList;
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
