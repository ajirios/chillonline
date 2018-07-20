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
public class Checkout 

{
    private String email;
    private String password;
    private long programID;
    private Program program;
    
    public Checkout(String email, String password, long programID)
            
    {
        this.email = email;
        this.password = password;
        this.programID = programID;
        this.program = null;
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

    public long getProgramID() 
    
    {
        return programID;
    }

    public void setProgramID(long programID) 
    
    {
        this.programID = programID;
    }

    public Program getProgram() 
    
    {
        return program;
    }

    public void setProgram(Program program) 
    
    {
        this.program = program;
    }
    
}
