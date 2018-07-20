/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package distribute;

import java.sql.Timestamp;
import programlist.ProgramList;

/**
 *
 * @author El Jefe
 */
public class Distribute 

{
    protected long distributorID;
    protected String distributorName;
    protected String representativeName;
    protected String businessLogoFileName;
    protected String distributorEmailAddress;
    protected String distributorBusinessAddress;
    protected String distributorCity;
    protected String distributorProvince;
    protected String distributorCountry;
    protected String distributorPostalCode;
    protected String distributorPhoneNumber;
    protected String programDepartment;
    
    public Distribute()
            
    {
        this.distributorID = -1;
        this.distributorName = null;
        this.representativeName = null;
        this.businessLogoFileName = null;
        this.distributorEmailAddress = null;
        this.distributorBusinessAddress = null;
        this.distributorCity = null;
        this.distributorProvince = null;
        this.distributorCountry = null;
        this.distributorPostalCode = null;
        this.distributorPhoneNumber = null;
        this.programDepartment = null;
    }

    public long getDistributorID() 
    
    {
        return distributorID;
    }

    public void setDistributorID(long distributorID) 
    
    {
        this.distributorID = distributorID;
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

    public String getBusinessLogoFileName() 
    
    {
        return businessLogoFileName;
    }

    public void setBusinessLogoFileName(String businessLogoFileName) 
    
    {
        this.businessLogoFileName = businessLogoFileName;
    }

    public String getDistributorEmailAddress() 
    
    {
        return distributorEmailAddress;
    }

    public void setDistributorEmailAddress(String distributorEmailAddress) 
    
    {
        this.distributorEmailAddress = distributorEmailAddress;
    }

    public String getDistributorBusinessAddress() 
    
    {
        return distributorBusinessAddress;
    }

    public void setDistributorBusinessAddress(String distributorBusinessAddress) 
    
    {
        this.distributorBusinessAddress = distributorBusinessAddress;
    }

    public String getDistributorCity() 
    
    {
        return distributorCity;
    }

    public void setDistributorCity(String distributorCity) 
    
    {
        this.distributorCity = distributorCity;
    }

    public String getDistributorProvince() 
    
    {
        return distributorProvince;
    }

    public void setDistributorProvince(String distributorProvince) 
    
    {
        this.distributorProvince = distributorProvince;
    }

    public String getDistributorCountry() 
    
    {
        return distributorCountry;
    }

    public void setDistributorCountry(String distributorCountry) 
    
    {
        this.distributorCountry = distributorCountry;
    }

    public String getDistributorPostalCode() 
    
    {
        return distributorPostalCode;
    }

    public void setDistributorPostalCode(String distributorPostalCode) 
    
    {
        this.distributorPostalCode = distributorPostalCode;
    }

    public String getDistributorPhoneNumber() 
    
    {
        return distributorPhoneNumber;
    }

    public void setDistributorPhoneNumber(String distributorPhoneNumber) 
    
    {
        this.distributorPhoneNumber = distributorPhoneNumber;
    }

    public String getProgramDepartment() 
    
    {
        return programDepartment;
    }

    public void setProgramDepartment(String programDepartment) 
    
    {
        this.programDepartment = programDepartment;
    }
    
}
