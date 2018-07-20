/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

/**
 *
 * @author El Jefe
 */
public class Carriers 

{
    private String email;
    private String password;
    private PackageList packageList;
    
    public Carriers(String email, String password)
            
    {
        this.email = email;
        this.password = password;
        this.packageList = null;
    }

    public String getEmail() 
    
    {
        return email;
    }

    public void setEmail(String email) 
    
    {
        this.email = email;
    }

    public String getPassword() 
    
    {
        return password;
    }

    public void setPassword(String password) 
    
    {
        this.password = password;
    }

    public PackageList getPackageList() 
    
    {
        return packageList;
    }

    public void setPackageList(PackageList packageList) 
    
    {
        this.packageList = packageList;
    }
    
}
