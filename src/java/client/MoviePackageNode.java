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
public class MoviePackageNode 

{
    private MoviePackage moviePackage;
    private MoviePackageNode previousNode;
    private MoviePackageNode nextNode;
    
    public MoviePackageNode(MoviePackage moviePackage, MoviePackageNode previousNode, MoviePackageNode nextNode)
            
    {
        this.moviePackage = moviePackage;
        this.previousNode = previousNode;
        this.nextNode = nextNode;
    }

    public MoviePackage getMoviePackage() 
    
    {
        return moviePackage;
    }

    public void setMoviePackage(MoviePackage moviePackage) 
    
    {
        this.moviePackage = moviePackage;
    }

    public MoviePackageNode getPreviousNode() 
    
    {
        return previousNode;
    }

    public void setPreviousNode(MoviePackageNode previousNode) 
    
    {
        this.previousNode = previousNode;
    }

    public MoviePackageNode getNextNode() 
    
    {
        return nextNode;
    }

    public void setNextNode(MoviePackageNode nextNode) 
    
    {
        this.nextNode = nextNode;
    }
}
