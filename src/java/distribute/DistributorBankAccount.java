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
public class DistributorBankAccount 

{
    private long distributorID;
    private String bankName;
    private String branchAddress;
    private String city;
    private String province;
    private String country;
    private String postalCode;
    private String phoneNumber;
    private String institutionNumber;
    private String branchTransitNumber;
    private String accountNumber;
    
    public DistributorBankAccount(long distributorID)
            
    {
        this.distributorID = distributorID;
        this.bankName = null;
        this.branchAddress = null;
        this.city = null;
        this.province = null;
        this.country = null;
        this.postalCode = null;
        this.phoneNumber = null;
        this.institutionNumber = null;
        this.branchTransitNumber = null;
        this.accountNumber = null;
    }

    public long getDistributorID() 
    
    {
        return distributorID;
    }

    public void setDistributorID(long distributorID) 
    
    {
        this.distributorID = distributorID;
    }

    public String getBankName() 
    
    {
        return bankName;
    }

    public void setBankName(String bankName) 
    
    {
        this.bankName = bankName;
    }

    public String getBranchAddress() 
    
    {
        return branchAddress;
    }

    public void setBranchAddress(String branchAddress) 
    
    {
        this.branchAddress = branchAddress;
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

    public String getInstitutionNumber() 
    
    {
        return institutionNumber;
    }

    public void setInstitutionNumber(String institutionNumber) 
    
    {
        this.institutionNumber = institutionNumber;
    }

    public String getBranchTransitNumber() 
    
    {
        return branchTransitNumber;
    }

    public void setBranchTransitNumber(String branchTransitNumber) 
    
    {
        this.branchTransitNumber = branchTransitNumber;
    }

    public String getAccountNumber() 
    
    {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) 
    
    {
        this.accountNumber = accountNumber;
    }
    
}
