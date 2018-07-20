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
public class HashFarm 

{
    private final static int FARM_SIZE = 2147483647;
    private RedBlackTree[] hashFarmArray;
    
    public HashFarm()
            
    {
        this.hashFarmArray = new RedBlackTree[FARM_SIZE];
    }
    
    private int hashIndices(String peg)
            
    {
        int hashSize;
        int solution;
        int index;
        
        hashSize = 13;
        solution = 0;
        
        for (index = 0; index < peg.length() - 1; index++)
            
        {
            solution += (solution * hashSize) + peg.charAt(index + 1);
            solution = solution % FARM_SIZE;
        }
        
        return solution;
    }

    public static int getFARM_SIZE() 
    
    {
        return FARM_SIZE;
    }

    public RedBlackTree[] getHashFarmArray() 
    
    {
        return hashFarmArray;
    }
    
    public void insert(Program peg)
            
    {
        
    }
    
    public void delete(String peg)
            
    {
        
    }
    
    public Program search(String peg)
            
    {
        return null;
    }
    
}
