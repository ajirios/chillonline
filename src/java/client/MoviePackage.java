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
public class MoviePackage extends Package

{
    private MovieList movieList;
    
    public MoviePackage(long carrierID, String packageName)
            
    {
        super(carrierID, packageName);
        this.movieList = new MovieList();
        this.containerLength = ((int) movieList.length() / 6) * 210;
    }
    
    public MovieList getMovieList() 
    
    {
        return movieList;
    }

    public void setMovieList(MovieList movieList) 
    
    {
        this.movieList = movieList;
    }
    
}
