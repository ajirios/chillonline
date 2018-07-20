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
import static loggedout.SeriesStore.URL;

/**
 *
 * @author El Jefe
 */
public class HorrorSeriesStore extends SeriesStore

{
    public HorrorSeriesStore(int currentPageNumber)
            
    {
        super(currentPageNumber);
    }

    @Override
    public void setProgramList(ProgramList programList) 
    
    {
        super.setProgramList(programList); //To change body of generated methods, choose Tools | Templates.
    }
    
    @Override
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
            statement = connection.prepareStatement("SELECT seriesID, seriesName, seriesPoster, distributor, locality, rentalPrice, purchasePrice FROM series "
                    + "WHERE genre='horror'");
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
        
        setProgramList(newProgramList);
        
        return super.getProgramList();
    }
    
}
