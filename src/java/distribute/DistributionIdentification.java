/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package distribute;

/**
 *
 * @author El Jefe
 */
public class DistributionIdentification 

{
    private String distributorName;
    private String representativeName;
    private String distributorLogo;
    private String emailAddress;
    private String officeAddress;
    private String city;
    private String province;
    private String country;
    private String postalCode;
    private String phoneNumber;
    private String contentType;
    
    public DistributionIdentification(String distributorName, String distributorLogo, String emailAddress, String officeAddress, String city, String province, String country)
            
    {
        this.distributorName = distributorName;
        this.representativeName = null;
        this.distributorLogo = distributorLogo;
        this.emailAddress = emailAddress;
        this.officeAddress = officeAddress;
        this.city = city;
        this.province = province;
        this.country = country;
        this.postalCode = null;
        this.phoneNumber = null;
        this.contentType = null;
    }

    public String getDistributorName() 
    
    {
        return distributorName;
    }

    public void setDistributorName(String distributorName) 
    
    {
        this.distributorName = distributorName;
    }

    public String getRepresentativeName() 
    
    {
        return representativeName;
    }

    public void setRepresentativeName(String representativeName) 
    
    {
        this.representativeName = representativeName;
    }

    public String getDistributorLogo() 
    
    {
        return distributorLogo;
    }

    public void setDistributorLogo(String distributorLogo) 
    
    {
        this.distributorLogo = distributorLogo;
    }

    public String getEmailAddress() 
    
    {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) 
    
    {
        this.emailAddress = emailAddress;
    }

    public String getOfficeAddress() 
    
    {
        return officeAddress;
    }

    public void setOfficeAddress(String officeAddress) 
    
    {
        this.officeAddress = officeAddress;
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

    public String getPostalCode() 
    
    {
        return postalCode;
    }

    public void setPostalCode(String postalCode) 
    
    {
        this.postalCode = postalCode;
    }

    public String getPhoneNumber() 
    
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) 
    
    {
        this.phoneNumber = phoneNumber;
    }

    public String getContentType() 
    
    {
        return contentType;
    }

    public void setContentType(String contentType) 
    
    {
        this.contentType = contentType;
    }
    
}
