/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package invitations.mail;

/**
 *
 * @author El Jefe
 */
public class Student 

{
    private String firstName;
    private String lastName;
    private String email;
    private String faculty;
    
    public Student(String firstName, String lastName, String email)
            
    {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.faculty = null;
    }

    public String getFirstName() 
    
    {
        return firstName;
    }

    public String getLastName() 
    
    {
        return lastName;
    }

    public String getEmail() 
    
    {
        return email;
    }

    public String getFaculty() 
    
    {
        return faculty;
    }
    
}
