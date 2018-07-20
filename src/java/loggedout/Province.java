/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;

/**
 *
 * @author El Jefe
 */
public class Province 

{
    private long provinceID;
    private String provinceName;
    private long countryID;
    private String countryName;
    
    public Province(String provinceName, String countryName)
            
    {
        this.provinceName = provinceName;
        this.countryName = countryName;
    }

    public long getProvinceID() 
    
    {
        return provinceID;
    }

    public void setProvinceID(long provinceID) 
    
    {
        this.provinceID = provinceID;
    }

    public String getProvinceName() 
    
    {
        return provinceName;
    }

    public void setProvinceName(String provinceName) 
    
    {
        this.provinceName = provinceName;
    }

    public long getCountryID() 
    
    {
        return countryID;
    }

    public void setCountryID(long countryID) 
    
    {
        this.countryID = countryID;
    }

    public String getCountryName() 
    
    {
        return countryName;
    }

    public void setCountryName(String countryName) 
    
    {
        this.countryName = countryName;
    }
}
