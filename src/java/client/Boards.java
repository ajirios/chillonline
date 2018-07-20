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
public class Boards 

{
    private String email;
    private String password;
    private BoardList createdBoardList;
    private BoardList joinedBoardList;
    private BoardList suggestedBoardList;
    
    public Boards(String email, String password)
            
    {
        this.email = email;
        this.password = password;
    }

    public String getEmail() 
    
    {
        return email;
    }

    public void setEmail(String email) 
    
    {
        this.email = email;
    }

    public String getPassword() 
    
    {
        return password;
    }

    public void setPassword(String password) 
    
    {
        this.password = password;
    }

    public BoardList getCreatedBoardList() 
    
    {
        return createdBoardList;
    }

    public void setCreatedBoardList(BoardList createdBoardList) 
    
    {
        this.createdBoardList = createdBoardList;
    }

    public BoardList getJoinedBoardList() 
    
    {
        return joinedBoardList;
    }

    public void setJoinedBoardList(BoardList joinedBoardList) 
    
    {
        this.joinedBoardList = joinedBoardList;
    }

    public BoardList getSuggestedBoardList() 
    
    {
        return suggestedBoardList;
    }

    public void setSuggestedBoardList(BoardList suggestedBoardList) 
    
    {
        this.suggestedBoardList = suggestedBoardList;
    }
}
