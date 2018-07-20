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
public class PackageHashTable 

{
    private Package[] packageHashTable;
    private static final int SIZE = 999961;
    
    public PackageHashTable()
            
    {
        this.packageHashTable = new Package[SIZE];
    }

    public Package[] getPackageHashTable() 
    
    {
        return packageHashTable;
    }

    public void setPackageHashTable(Package[] packageHashTable) 
    
    {
        this.packageHashTable = packageHashTable;
    }
    
}
