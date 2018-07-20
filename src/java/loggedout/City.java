/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;

import board.Board;


/**
 *
 * @author El Jefe
 */
public class City 

{
    private long cityID;
    private String cityName;
    private long boardID;
    private String boardName;
    private static final int BOARD_CLASS = 1;
    private long provinceID;
    private String provinceName;
    private long countryID;
    private String countryName;
    private Board board;
    
    public City(String cityName, String provinceName, String countryName)
            
    {
        this.cityName = cityName;
        this.provinceName = provinceName;
        this.countryName = countryName;
        this.boardName = "Neighbourhood of " + this.cityName;
        this.board = null;
    }

    public long getCityID() 
    
    {
        return cityID;
    }

    public void setCityID(long cityID) 
    
    {
        this.cityID = cityID;
    }

    public String getCityName() 
    
    {
        return cityName;
    }

    public void setCityName(String cityName) 
    
    {
        this.cityName = cityName;
    }

    public long getBoardID() 
    
    {
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        this.boardID = boardID;
    }

    public String getBoardName() 
    
    {
        return boardName;
    }

    public void setBoardName(String boardName) 
    
    {
        this.boardName = boardName;
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

    public Board getBoard() 
    
    {
        return board;
    }

    public void setBoard(Board board) 
    
    {
        this.board = board;
    }
    
}
