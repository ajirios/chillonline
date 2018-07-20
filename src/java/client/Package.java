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
public class Package 

{
    protected long packageID;
    protected long carrierID;
    protected String packageName;
    protected String carrierName;
    protected String rentalPrice;
    protected String packageCover;
    protected String packagePoster;
    protected String carrierPicture;
    protected int numberOfPrograms;
    protected int containerLength;
    
    public Package(long carrierID, String packageName)
            
    {
        this.packageID = 0;
        this.carrierID = carrierID;
        this.packageName = packageName;
        this.carrierName = null;
        this.packagePoster = null;
        this.packageCover = null;
        this.carrierPicture = null;
        this.rentalPrice = null;
        this.numberOfPrograms = 0;
        this.containerLength = 0;
    }

    public long getPackageID() 
    
    {
        return packageID;
    }

    public void setPackageID(long packageID) 
    
    {
        this.packageID = packageID;
    }

    public long getCarrierID() 
    
    {
        return carrierID;
    }

    public void setCarrierID(long carrierID) 
    
    {
        this.carrierID = carrierID;
    }

    public String getPackageName() 
    
    {
        return packageName;
    }

    public void setPackageName(String packageName) 
    
    {
        this.packageName = packageName;
    }

    public String getCarrierName() 
    
    {
        return carrierName;
    }

    public void setCarrierName(String carrierName) 
    
    {
        this.carrierName = carrierName;
    }

    public String getRentalPrice() 
    
    {
        return rentalPrice;
    }

    public void setRentalPrice(String rentalPrice) 
    
    {
        this.rentalPrice = rentalPrice;
    }

    public String getPackageCover() 
    
    {
        return packageCover;
    }

    public void setPackageCover(String packageCover) 
    
    {
        this.packageCover = packageCover;
    }

    public String getPackagePoster() 
    
    {
        return packagePoster;
    }

    public void setPackagePoster(String packagePoster) 
    
    {
        this.packagePoster = packagePoster;
    }

    public String getCarrierPicture() 
    
    {
        return carrierPicture;
    }

    public void setCarrierPicture(String carrierPicture) 
    
    {
        this.carrierPicture = carrierPicture;
    }

    public int getNumberOfPrograms() 
    
    {
        return numberOfPrograms;
    }

    public void setNumberOfPrograms(int numberOfPrograms) 
    
    {
        this.numberOfPrograms = numberOfPrograms;
    }

    public int getContainerLength() 
    
    {
        return containerLength;
    }

    public void setContainerLength(int containerLength) 
    
    {
        this.containerLength = containerLength;
    }
    
}
