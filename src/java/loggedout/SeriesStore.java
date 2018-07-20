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
public class SeriesStore 

{
    protected int currentPageNumber;
    protected int numberOfProgramsInStore;
    protected static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    protected int numberOfStorePages;
    protected StorePage[] storePages;
    protected StorePage storePage;
    protected ProgramList programList;
    protected Program[][] programMap;
    
    protected static final String URL = "jdbc:mysql://localhost:3306/chillonline";
    protected static final String dbUserName = "root";
    protected static final String dbPassword = "Empire7";
    
    public SeriesStore(int currentPageNumber)
            
    {
        this.currentPageNumber = currentPageNumber;
        this.programList = new ProgramList();
        this.programList = getProgramList();
        this.numberOfProgramsInStore = this.programList.length();
        double programCountNumerator = (double) numberOfProgramsInStore;
        double stepCountDenominator = (double) NUMBER_OF_PROGRAMS_PER_PAGE;
        this.numberOfStorePages = (int) Math.ceil(programCountNumerator / stepCountDenominator);
        this.programMap = new Program[this.numberOfStorePages][NUMBER_OF_PROGRAMS_PER_PAGE];
        this.storePages = new StorePage[numberOfStorePages];
        initialiseProgramMap();
        initialiseStorePages();
        this.storePage = storePages[currentPageNumber - 1];
    }
    
    private void initialiseProgramMap()
            
    {
        int pageCount;
        int programCount;
        ProgramNode currentNode;
        
        pageCount = 0;
        programCount = 0;
        currentNode = this.programList.getFirstNode();
        
        for (programCount = 0; programCount < this.numberOfStorePages; programCount++)
                
        {
            
            this.storePages[pageCount] = new StorePage(programCount + 1);
            
        }
        
        for (pageCount = 0; pageCount < this.numberOfStorePages; pageCount++)
            
        {
            
            for (programCount = 0; (programCount < NUMBER_OF_PROGRAMS_PER_PAGE) && (currentNode != null) && (currentNode.getProgram() != null); programCount++)
                
            {
                TVSeries series = (TVSeries) currentNode.getProgram();
                this.programMap[pageCount][programCount] = series;
                currentNode = currentNode.getNextNode();
            }
            
        }
    }
    
    private void initialiseStorePages()
            
    {
        int pageCount;
        int programCount;
        ProgramNode currentNode;
        
        pageCount = 0;
        programCount = 0;
        currentNode = this.programList.getFirstNode();
        
        for (programCount = 0; programCount < this.numberOfStorePages; programCount++)
                
        {
            
            this.storePages[pageCount] = new StorePage(programCount + 1);
            
        }
        
        for (pageCount = 0; pageCount < this.numberOfStorePages; pageCount++)
            
        {
            
            for (programCount = 0; (programCount < NUMBER_OF_PROGRAMS_PER_PAGE) && (currentNode != null) && (currentNode.getProgram() != null); programCount++)
                
            {
                TVSeries series = (TVSeries) currentNode.getProgram();
                this.storePages[pageCount].insertProgram(series);
                currentNode = currentNode.getNextNode();
            }
            
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
        String purchasePrice;
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
        purchasePrice = null;
        newProgram = null;
        newProgramList = new ProgramList();
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT seriesID, seriesName, seriesPoster, distributor, locality, rentalPrice, purchasePrice FROM series");
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
                programID = Long.parseLong(resultSet.getString("seriesID"));
                programName = resultSet.getString("seriesName"); 
                programPoster = resultSet.getString("seriesPoster");
                distributor = resultSet.getString("distributor");
                locality = resultSet.getString("locality");
                rentalPrice = resultSet.getString("rentalPrice");
                purchasePrice = resultSet.getString("purchasePrice");
                
                newProgram = new TVSeries(programID, programName, programPoster, distributor, locality, rentalPrice, purchasePrice);
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
