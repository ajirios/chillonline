/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stream;

import client.RadioChannel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author El Jefe
 */
public class RadioChannelStream 

{
    private long programID;
    private RadioChannel radioChannel;
    private RadioChannel[] otherRadioChannels;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String userName = "ajirios";
    private static final String password = "Empire621";

    Connection videosConnection = null;
    PreparedStatement videosStatement = null;
    ResultSet videoSet = null;
    
    private static final int NUMBER_OF_PROGRAMS_PER_PAGE = 18;
    private int size;
    
    public RadioChannelStream(long programID)
            
    {
        this.programID = programID;
        this.radioChannel = null;
        this.otherRadioChannels = null;
    }
    
}
