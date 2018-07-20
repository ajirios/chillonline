/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author El Jefe
 */
public class TVChannelsStore 

{
    private int currentPageNumber;
    private int numberOfProgramsInStore;
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int numberOfStorePages;
    private StorePage[] storePages;
    private StorePage storePage;
    private ProgramList programList;
    
    private static final String URL = "jdbc:mysql://localhost:3306/chillonline";
    private static final String dbUserName = "root";
    private static final String dbPassword = "Empire7";
    
    public TVChannelsStore(int currentPageNumber)
            
    {
        this.currentPageNumber = currentPageNumber;
        this.programList = new ProgramList();
        this.numberOfProgramsInStore = this.programList.length();
        double programCountNumerator = (double) numberOfProgramsInStore;
        double stepCountDenominator = (double) NUMBER_OF_PROGRAMS_PER_PAGE;
        this.numberOfStorePages = (int) Math.ceil(programCountNumerator / stepCountDenominator);
        this.storePages = new StorePage[numberOfStorePages];
        initialiseStorePages();
        this.storePage = storePages[currentPageNumber - 1];
    }
    
    private void initialiseStorePages()
            
    {
        int pageCount;
        int programCount;
        ProgramNode currentNode;
        StorePage currentStorePage;
        Program[] currentPrograms;
        
        pageCount = 0;
        programCount = 0;
        currentNode = this.programList.getFirstNode();
        currentStorePage = null;
        currentPrograms = new Program[NUMBER_OF_PROGRAMS_PER_PAGE];
        
        for (pageCount = 0; pageCount < this.numberOfStorePages; pageCount++)
            
        {
            currentStorePage = this.storePages[pageCount];
            
            for (programCount = 0; (programCount < NUMBER_OF_PROGRAMS_PER_PAGE) && (currentNode != null); programCount++)
                
            {
                
                currentPrograms[programCount] = currentNode.getProgram();
                currentNode = currentNode.getNextNode();
                
            }
            
            currentStorePage.setPrograms(currentPrograms);
            
        }
        
    }

    public int getCurrentPageNumber() 
    
    {
        return currentPageNumber;
    }

    public void setCurrentPageNumber(int currentPageNumber) 
    
    {
        this.currentPageNumber = currentPageNumber;
    }

    public int getNumberOfProgramsInStore() 
    
    {
        return numberOfProgramsInStore;
    }

    public void setNumberOfProgramsInStore(int numberOfProgramsInStore) 
    
    {
        this.numberOfProgramsInStore = numberOfProgramsInStore;
    }

    public int getNumberOfStorePages() 
    
    {
        return numberOfStorePages;
    }

    public void setNumberOfStorePages(int numberOfStorePages) 
    
    {
        this.numberOfStorePages = numberOfStorePages;
    }

    public StorePage[] getStorePages() 
    
    {
        return storePages;
    }

    public void setStorePages(StorePage[] storePages) 
    
    {
        this.storePages = storePages;
    }

    public StorePage getStorePage() 
    
    {
        return storePage;
    }

    public void setStorePage(StorePage storePage) 
    
    {
        this.storePage = storePage;
    }

    public ProgramList getProgramList()
            
    {
        long programID;
        String programName;
        String programPoster;
        String distributor;
        String locality;
        String rentalPrice;
        Program newProgram;
        ProgramList newProgramList;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        programID = -1;
        programName = null; 
        programPoster = null;
        distributor = null;
        locality = null;
        rentalPrice = null;
        newProgram = null;
        newProgramList = new ProgramList();
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT channelID, channelName, channelPoster, distributor, locality, rentalPrice FROM tv");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (statement != null)
                
            {
            
                resultSet = statement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            while (resultSet.next() == true)
                
            {
                programID = Long.parseLong(resultSet.getString("channelID"));
                programName = resultSet.getString("channelName"); 
                programPoster = resultSet.getString("channelPoster");
                distributor = resultSet.getString("distributor");
                locality = resultSet.getString("locality");
                rentalPrice = resultSet.getString("rentalPrice");
                
                newProgram = new TVChannel(programID, programName, programPoster, distributor, locality, rentalPrice);
                newProgramList.insert(newProgram);
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        this.programList = newProgramList;
        
        return programList;
    }

    public void setProgramList(ProgramList programList) 
    
    {
        this.programList = programList;
    }
    
}
