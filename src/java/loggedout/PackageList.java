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
public class PackageList 

{
    private PackageNode firstNode;
    
    public PackageList()
            
    {
        firstNode = null;
    }
    
    public void insert(Package pack)
            
    {
        PackageNode newNode = new PackageNode(pack, firstNode);
        firstNode = newNode;
    }
    
    public PackageNode searchByPackageID(long packageID)
            
    {
        
        
        return null;
    }
    
    public PackageNode searchByPackageName(String packageName)
            
    {
        
        
        return null;
    }
    
    public void delete(long packageID)
            
    {
        
    }
    
    public void sortByPackageID()
            
    {
        
    }
    
    public void sortByPackageName()
            
    {
        
    }
    
    public void sortByDistributionDate()
            
    {
        
    }
    
    public void reverse()
            
    {
        
    }
    
}
