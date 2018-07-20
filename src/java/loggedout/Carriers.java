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
public class Carriers 

{
    private int numberOfPackagesInCarriers;
    private static final int NUMBER_OF_PACKAGES_PER_CARRIER = 7;
    private static int numberOfCarriersSteps;
    private CarriersStep[] carriersSteps;
    private PackageList packageList;
    
    public Carriers(int numberOfPackagesInCarriers)
            
    {
        this.numberOfPackagesInCarriers = numberOfPackagesInCarriers;
        double packageCountNumerator = (double) numberOfPackagesInCarriers;
        double stepCountDenominator = (double) NUMBER_OF_PACKAGES_PER_CARRIER;
        this.numberOfCarriersSteps = (int) Math.ceil(packageCountNumerator / stepCountDenominator);
        this.carriersSteps = new CarriersStep[numberOfCarriersSteps];
        this.packageList = new PackageList();
    }

    public PackageList getPackageList() 
    
    {
        return packageList;
    }

    public void setPackageList(PackageList packageList) 
    
    {
        this.packageList = packageList;
    }

    public int getNumberOfPackagesInCarriers() 
    
    {
        return numberOfPackagesInCarriers;
    }

    public void setNumberOfPackagesInCarriers(int numberOfPackagesInCarriers) 
    
    {
        this.numberOfPackagesInCarriers = numberOfPackagesInCarriers;
    }

    public static int getNumberOfCarriersSteps() 
    
    {
        return numberOfCarriersSteps;
    }

    public static void setNumberOfCarriersSteps(int numberOfCarriersSteps) 
    
    {
        Carriers.numberOfCarriersSteps = numberOfCarriersSteps;
    }

    public CarriersStep[] getCarriersSteps() 
    
    {
        return carriersSteps;
    }

    public void setCarriersSteps(CarriersStep[] carriersSteps) 
    
    {
        this.carriersSteps = carriersSteps;
    }
}
