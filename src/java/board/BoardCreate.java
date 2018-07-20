/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board;

import account.boards.AccountBoardCreate;
import board.charges.BoardChargeCreate;
import creditcard.CreditCardRetrieve;
import dateline.DateLineConversion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;


/**
 *
 * @author El Jefe
 */
public class BoardCreate 

{
    private long boardID;
    private long clientID;
    private long accountNumber;
    private long numberOfMembers;
    private int boardClass;
    private int boardPrice;
    private String boardName;
    private String description;
    private String boardCover;
    private String registrationDate;
    private String deletionDate;
    private String reservationMode;
    private String purpose;
    private String toll;
    private String ready;
    private String field;
    private String memberType;
    private String teamName;
    private String organizationName;
    private String boardCity;
    private String boardProvince;
    private String boardCountry;
    private String teamLogo;
    private int creationMonth;
    private int creationDay;
    private int creationHour;
    private int creationMinute;
    
    private boolean chargeCompleted;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public BoardCreate(long clientID, int boardClass, String boardName, String description, String boardCover, String reservationMode)
            
    {
        this.clientID = clientID;
        constructAccountNumber();
        CreditCardRetrieve card = new CreditCardRetrieve(this.accountNumber);
        chargeCompleted = false;
        
        if (!boardName.equals(""))

        {

            //check if boards database table is empty
            if (tableIsEmpty() == true)

            {
                //if boards database table is empty, set boardID to 0 
                this.boardID = 0;
            }

            else if (tableIsEmpty() == false)

            {
                //else if boards database table is not null, get the next maximum boardID and set it
                this.boardID = getNextMaximumBoardID();
            }

        }
        
        
        this.boardClass = boardClass;
        BoardPayment boardPayment = null;
        
        setBoardPrice();
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString  = dateFormat.format(calendar.getTime());
        this.creationMonth = Integer.parseInt(dateString.substring(4, 6));
        this.creationDay = Integer.parseInt(dateString.substring(6, 8));
        this.creationHour = Integer.parseInt(dateString.substring(8, 10));
        this.creationMinute = Integer.parseInt(dateString.substring(10, 12));
        
        if (this.boardPrice > 0)
        
        {
            
            DateLineConversion conversion = new DateLineConversion(dateString);
            int chargeMonth = conversion.getMonth();
            int chargeDay = conversion.getDay();
            int chargeHour = Integer.parseInt(dateString.substring(8, 10));
            int chargeMinute = conversion.getMinute();
            
            if (card.getCreditCardNumber() != null && card.getExpiryMonth() != 0 && card.getExpiryYear() != 0 && card.getCcv() != null)
            
            {
                boardPayment = new BoardPayment(boardID, boardPrice, card.getCreditCardNumber(), card.getExpiryMonth(), card.getExpiryYear(), card.getCcv());
                this.chargeCompleted = boardPayment.isChargeCompleted();
                
                if (this.chargeCompleted == false)
                    
                {
                    boardPayment = null;
                }
                
            }
            
            else
                
            {
                boardPayment = null;
            }
            
            if (boardPayment != null)
                
            {
                
                BoardChargeCreate boardChargeCreate = new BoardChargeCreate(this.boardID, this.accountNumber, this.boardPrice, dateString, chargeMonth, chargeDay, chargeHour, chargeMinute);
                
                if (!boardName.equals(""))

                {
                    
                    insertBoard(this.boardID);

                }
                
                this.numberOfMembers = 1;
                this.boardName = boardName;
                this.registrationDate = null;
                this.reservationMode = reservationMode;
                this.boardCover = boardCover;
                this.description = description;
                this.deletionDate = null;
                this.memberType = null;
                this.teamName = null;
                this.organizationName = null;
                this.boardCity = null;
                this.boardProvince = null;
                this.boardCountry = null;
                this.teamLogo = null;
                this.ready = null;
                this.purpose = null;
                this.toll = null;
                this.field = null;

                if (!boardName.equals(""))

                {
                    setClientID(clientID);
                    setNumberOfMembers(numberOfMembers);
                    setBoardClass(boardClass);
                    setBoardName(boardName);
                    setRegistrationDate(dateString);
                    setCreationMonth(this.creationMonth);
                    setCreationDay(this.creationDay);
                    setCreationHour(this.creationHour);
                    setCreationMinute(this.creationMinute);
                    AccountBoardCreate accountBoard = new AccountBoardCreate(this.accountNumber, this.boardID);
                }

                if (!description.equals(""))

                {
                    setDescription(description);
                }

                if (!boardCover.equals(""))

                {
                    setBoardCover(boardCover);
                }

                if (!reservationMode.equals(""))

                {
                    setReservationMode(reservationMode);
                }
                
            }
            
        }
        
        else if (this.boardPrice <= 0)
            
        {
            
            if (!boardName.equals(""))

            {
                
                insertBoard(this.boardID);

            }
            
            this.numberOfMembers = 1;
            this.boardName = boardName;
            this.registrationDate = null;
            this.reservationMode = reservationMode;
            this.boardCover = boardCover;
            this.description = description;
            this.deletionDate = null;
            this.memberType = null;
            this.teamName = null;
            this.organizationName = null;
            this.boardCity = null;
            this.boardProvince = null;
            this.boardCountry = null;
            this.teamLogo = null;
            this.ready = null;
            this.purpose = null;
            this.toll = null;
            this.field = null;

            if (!boardName.equals(""))

            {
                setClientID(clientID);
                setNumberOfMembers(numberOfMembers);
                setBoardClass(boardClass);
                setBoardName(boardName);
                setRegistrationDate(dateString);
                setCreationMonth(this.creationMonth);
                setCreationDay(this.creationDay);
                setCreationHour(this.creationHour);
                setCreationMinute(this.creationMinute);
                AccountBoardCreate accountBoard = new AccountBoardCreate(this.accountNumber, this.boardID);
            }

            if (!description.equals(""))

            {
                setDescription(description);
            }

            if (!boardCover.equals(""))

            {
                setBoardCover(boardCover);
            }

            if (!reservationMode.equals(""))

            {
                setReservationMode(reservationMode);
            }
            
        }
        
        
    }
    
    public BoardCreate(long clientID, int boardClass, String boardName, String description, String boardCover, String reservationMode, String freeOrPaid)
            
    {
        this.clientID = clientID;
        constructAccountNumber();
        CreditCardRetrieve card = new CreditCardRetrieve(this.accountNumber);
        this.chargeCompleted = false;
        
        if (!boardName.equals(""))

        {

            //check if boards database table is empty
            if (tableIsEmpty() == true)

            {
                //if boards database table is empty, set boardID to 0 
                this.boardID = 0;
            }

            else if (tableIsEmpty() == false)

            {
                //else if boards database table is not null, get the next maximum boardID and set it
                this.boardID = getNextMaximumBoardID();
            }

        }
        
        this.boardClass = boardClass;
        BoardPayment boardPayment = null;
        
        setBoardPrice();
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString  = dateFormat.format(calendar.getTime());
        this.creationMonth = Integer.parseInt(dateString.substring(4, 6));
        this.creationDay = Integer.parseInt(dateString.substring(6, 8));
        this.creationHour = Integer.parseInt(dateString.substring(8, 10));
        this.creationMinute = Integer.parseInt(dateString.substring(10, 12));
        
        if (freeOrPaid.equalsIgnoreCase("paid"))
        
        {
            
            if (card.getCreditCardNumber() != null && card.getExpiryMonth() != 0 && card.getExpiryYear() != 0 && card.getCcv() != null)
            
            {
                boardPayment = new BoardPayment(boardID, boardPrice, card.getCreditCardNumber(), card.getExpiryMonth(), card.getExpiryYear(), card.getCcv());
                this.chargeCompleted = boardPayment.isChargeCompleted();
                
                if (this.chargeCompleted == false)
                    
                {
                    boardPayment = null;
                }
                
            }
            
            else
                
            {
                boardPayment = null;
            }
            
            if (boardPayment != null)
                
            {
                DateLineConversion conversion = new DateLineConversion(dateString);
                int chargeMonth = conversion.getMonth();
                int chargeDay = conversion.getDay();
                int chargeHour = Integer.parseInt(dateString.substring(8, 10));
                int chargeMinute = conversion.getMinute();
                
                BoardChargeCreate boardChargeCreate = new BoardChargeCreate(this.boardID, this.accountNumber, this.boardPrice, dateString, chargeMonth, chargeDay, chargeHour, chargeMinute);
                
                
                if (!boardName.equals(""))

                {
                    
                    insertBoard(this.boardID);

                }
                
                this.numberOfMembers = 1;
                this.boardName = boardName;
                this.registrationDate = null;
                this.reservationMode = reservationMode;
                this.boardCover = boardCover;
                this.description = description;
                this.deletionDate = null;
                this.memberType = null;
                this.teamName = null;
                this.organizationName = null;
                this.boardCity = null;
                this.boardProvince = null;
                this.boardCountry = null;
                this.teamLogo = null;
                this.ready = null;
                this.purpose = null;
                this.toll = null;
                this.field = null;

                if (!boardName.equals(""))

                {
                    setClientID(clientID);
                    setNumberOfMembers(numberOfMembers);
                    setBoardClass(boardClass);
                    setBoardName(boardName);
                    setRegistrationDate(dateString);
                    setCreationMonth(this.creationMonth);
                    setCreationDay(this.creationDay);
                    setCreationHour(this.creationHour);
                    setCreationMinute(this.creationMinute);
                    AccountBoardCreate accountBoard = new AccountBoardCreate(this.accountNumber, this.boardID);
                }

                if (!description.equals(""))

                {
                    setDescription(description);
                }

                if (!boardCover.equals(""))

                {
                    setBoardCover(boardCover);
                }

                if (!reservationMode.equals(""))

                {
                    setReservationMode(reservationMode);
                }
                
            }
            
        }
        
        else if (freeOrPaid.equalsIgnoreCase("free"))
            
        {
            
            if (!boardName.equals(""))

            {
                
                insertBoard(this.boardID);

            }
            
            this.numberOfMembers = 1;
            this.boardName = boardName;
            this.registrationDate = null;
            this.reservationMode = reservationMode;
            this.boardCover = boardCover;
            this.description = description;
            this.deletionDate = null;
            this.memberType = null;
            this.teamName = null;
            this.organizationName = null;
            this.boardCity = null;
            this.boardProvince = null;
            this.boardCountry = null;
            this.teamLogo = null;
            this.ready = null;
            this.purpose = null;
            this.toll = null;
            this.field = null;

            if (!boardName.equals(""))

            {
                setClientID(clientID);
                setNumberOfMembers(numberOfMembers);
                setBoardClass(boardClass);
                setBoardName(boardName);
                setRegistrationDate(dateString);
                setCreationMonth(this.creationMonth);
                setCreationDay(this.creationDay);
                setCreationHour(this.creationHour);
                setCreationMinute(this.creationMinute);
                AccountBoardCreate accountBoard = new AccountBoardCreate(this.accountNumber, this.boardID);
            }

            if (!description.equals(""))

            {
                setDescription(description);
            }

            if (!boardCover.equals(""))

            {
                setBoardCover(boardCover);
            }

            if (!reservationMode.equals(""))

            {
                setReservationMode(reservationMode);
            }
            
        }
        
        
    }
    
    public void insertBoard(long boardID)
            
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("INSERT INTO `boards`(boardID) VALUE(" + boardID + ")");
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the result
        try
            
        {
            if (statement != null)
                
            {
            
                result = statement.executeUpdate(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private boolean tableIsEmpty()
            
    {
        boolean tableIsEmpty;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        tableIsEmpty = false;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT boardID FROM boards");
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
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet.next() == true)
                
            {
            
                tableIsEmpty = false;
            
            }
            
            else
                
            {
                
                tableIsEmpty = true;
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return tableIsEmpty;
    }
    
    private long getNextMaximumBoardID()
            
    {
        long nextMaximumBoardID;
        long maximumBoardID;
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        nextMaximumBoardID = 1;
        maximumBoardID = 0;
        connection = null;
        statement = null;
        resultSet = null;
        
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT MAX(boardID) FROM boards");
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
        
        //try getting values from the resultSet
        try
            
        {
            if (resultSet.next() == true)
                
            {
            
                maximumBoardID = Long.parseLong(resultSet.getString("MAX(boardID)")); 
                nextMaximumBoardID = maximumBoardID + 1;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return nextMaximumBoardID;
        
    }

    public long getClientID() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClientIDStatement;
        ResultSet clientIDSet;
        
        //initialise objects for backup
        connection = null;
        setClientIDStatement = null;
        clientIDSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClientIDStatement = connection.prepareStatement("SELECT clientID FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClientIDStatement != null)
                
            {
            
                clientIDSet = setClientIDStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (clientIDSet.next() == true)
                
            {
            
                this.clientID = Long.parseLong(clientIDSet.getString("clientID")); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setClientIDStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setClientIDStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setClientIDStatement = connection.prepareStatement("UPDATE boards set clientID=" + clientID + " WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setClientIDStatement != null)
                
            {
            
                result = setClientIDStatement.executeUpdate(); 
                this.clientID = clientID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public long getNumberOfMembers() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setNumberOfMembersStatement;
        ResultSet numberOfMembersSet;
        
        //initialise objects for backup
        connection = null;
        setNumberOfMembersStatement = null;
        numberOfMembersSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setNumberOfMembersStatement = connection.prepareStatement("SELECT numberOfMembers FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setNumberOfMembersStatement != null)
                
            {
            
                numberOfMembersSet = setNumberOfMembersStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (numberOfMembersSet.next() == true)
                
            {
            
                this.numberOfMembers = Long.parseLong(numberOfMembersSet.getString("numberOfMembers"));
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return numberOfMembers;
    }

    public void setNumberOfMembers(long numberOfMembers) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set numberOfMembers=" + numberOfMembers + " WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.numberOfMembers = numberOfMembers;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructAccountNumber()
            
    {
        Connection connection;
        PreparedStatement statement;
        ResultSet resultSet;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        resultSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("SELECT accountNumber FROM accounts WHERE accountHolderID=" + this.clientID + " AND accountType='client'");
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
            
            if (resultSet != null)
                
                {
                    
                if (resultSet.next() == true)
                    
                {
                    
                    accountNumber = Long.parseLong(resultSet.getString("accountNumber")); 
                    
                }
                
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public int getBoardClass() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardClassStatement;
        ResultSet boardClassSet;
        
        //initialise objects for backup
        connection = null;
        setBoardClassStatement = null;
        boardClassSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardClassStatement = connection.prepareStatement("SELECT boardClass FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardClassStatement != null)
                
            {
            
                boardClassSet = setBoardClassStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (boardClassSet.next() == true)
                
            {
            
                this.boardClass = Integer.parseInt(boardClassSet.getString("boardClass"));
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return boardClass;
    }

    public void setBoardClass(int boardClass) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardClassStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setBoardClassStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardClassStatement = connection.prepareStatement("UPDATE boards set boardClass=" + boardClass + " WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardClassStatement != null)
                
            {
            
                result = setBoardClassStatement.executeUpdate(); 
                this.boardClass = boardClass;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    public int getBoardPrice()
            
    {
        return this.boardPrice;
    }
    
    private void setBoardPrice()
            
    {
        
        if (this.boardClass == 1)
            
        {
            this.boardPrice = 0;
        }
        
        else if (this.boardClass == 2)
            
        {
            this.boardPrice = 999;
        }
        
        else if (this.boardClass == 3)
            
        {
            this.boardPrice = 1499;
        }
        
        else if (this.boardClass == 4)
            
        {
            this.boardPrice = 2499;
        }
        
        else if (this.boardClass == 5)
            
        {
            this.boardPrice = 4999;
        }
        
        else if (this.boardClass == 6)
            
        {
            this.boardPrice = 0;
        }
        
        else if (this.boardClass == 7)
            
        {
            this.boardPrice = 0;
        }
        
    }

    public String getBoardName() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardNameStatement;
        ResultSet boardNameSet;
        
        //initialise objects for backup
        connection = null;
        setBoardNameStatement = null;
        boardNameSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardNameStatement = connection.prepareStatement("SELECT boardName FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardNameStatement != null)
                
            {
            
                boardNameSet = setBoardNameStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (boardNameSet.next() == true)
                
            {
            
                this.boardName = boardNameSet.getString("boardName");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return boardName;
    }

    public void setBoardName(String boardName) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardNameStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setBoardNameStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardNameStatement = connection.prepareStatement("UPDATE boards set boardName='" + boardName + "' WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardNameStatement != null)
                
            {
            
                result = setBoardNameStatement.executeUpdate(); 
                this.boardName = boardName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getDescription() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setDescriptionStatement;
        ResultSet descriptionSet;
        
        //initialise objects for backup
        connection = null;
        setDescriptionStatement = null;
        descriptionSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setDescriptionStatement = connection.prepareStatement("SELECT description FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setDescriptionStatement != null)
                
            {
            
                descriptionSet = setDescriptionStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (descriptionSet.next() == true)
                
            {
            
                this.description = descriptionSet.getString("description");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return description;
    }

    public void setDescription(String description) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setDescriptionStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setDescriptionStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setDescriptionStatement = connection.prepareStatement("UPDATE boards set description='" + description + "' WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setDescriptionStatement != null)
                
            {
            
                result = setDescriptionStatement.executeUpdate(); 
                this.description = description;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public long getBoardID() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardIDStatement;
        ResultSet boardIDSet;
        
        //initialise objects for backup
        connection = null;
        setBoardIDStatement = null;
        boardIDSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardIDStatement = connection.prepareStatement("SELECT boardID FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardIDStatement != null)
                
            {
            
                boardIDSet = setBoardIDStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (boardIDSet.next() == true)
                
            {
            
                this.boardID = Long.parseLong(boardIDSet.getString("boardID"));
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return boardID;
    }

    public void setBoardID(long boardID) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardIDStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setBoardIDStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardIDStatement = connection.prepareStatement("UPDATE boards set boardID=" + boardID + " WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardIDStatement != null)
                
            {
            
                result = setBoardIDStatement.executeUpdate(); 
                this.boardID = boardID;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getBoardCover() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardCoverStatement;
        ResultSet boardCoverSet;
        
        //initialise objects for backup
        connection = null;
        setBoardCoverStatement = null;
        boardCoverSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardCoverStatement = connection.prepareStatement("SELECT boardCover FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardCoverStatement != null)
                
            {
            
                boardCoverSet = setBoardCoverStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (boardCoverSet.next() == true)
                
            {
            
                this.boardCover = boardCoverSet.getString("boardCover");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return boardCover;
    }

    public void setBoardCover(String boardCover) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setBoardCoverStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setBoardCoverStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setBoardCoverStatement = connection.prepareStatement("UPDATE boards set boardCover='" + boardCover + "' WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setBoardCoverStatement != null)
                
            {
            
                result = setBoardCoverStatement.executeUpdate(); 
                this.boardCover = boardCover;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getRegistrationDate() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setRegistrationDateStatement;
        ResultSet registrationDateSet;
        
        //initialise objects for backup
        connection = null;
        setRegistrationDateStatement = null;
        registrationDateSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setRegistrationDateStatement = connection.prepareStatement("SELECT registrationDate FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setRegistrationDateStatement != null)
                
            {
            
                registrationDateSet = setRegistrationDateStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (registrationDateSet.next() == true)
                
            {
            
                this.registrationDate = registrationDateSet.getString("registrationDate");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return registrationDate;
    }

    public void setRegistrationDate(String registrationDate) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setRegistrationDateStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setRegistrationDateStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setRegistrationDateStatement = connection.prepareStatement("UPDATE boards set registrationDate='" + registrationDate + "' WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setRegistrationDateStatement != null)
                
            {
            
                result = setRegistrationDateStatement.executeUpdate(); 
                this.registrationDate = registrationDate;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getDeletionDate() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setDeletionDateStatement;
        ResultSet deletionDateSet;
        
        //initialise objects for backup
        connection = null;
        setDeletionDateStatement = null;
        deletionDateSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setDeletionDateStatement = connection.prepareStatement("SELECT deletionDate FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setDeletionDateStatement != null)
                
            {
            
                deletionDateSet = setDeletionDateStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (deletionDateSet.next() == true)
                
            {
            
                this.deletionDate = deletionDateSet.getString("deletionDate");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return deletionDate;
    }

    public void setDeletionDate(String deletionDate) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setDeletionDateStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setDeletionDateStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setDeletionDateStatement = connection.prepareStatement("UPDATE boards set deletionDate='" + deletionDate + "' WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setDeletionDateStatement != null)
                
            {
            
                result = setDeletionDateStatement.executeUpdate(); 
                this.deletionDate = deletionDate;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public String getReservationMode() 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setReservationModeStatement;
        ResultSet reservationModeSet;
        
        //initialise objects for backup
        connection = null;
        setReservationModeStatement = null;
        reservationModeSet = null;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setReservationModeStatement = connection.prepareStatement("SELECT reservationMode FROM boards WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setReservationModeStatement != null)
                
            {
            
                reservationModeSet = setReservationModeStatement.executeQuery(); 
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try getting the paymentType as String
        try
            
        {
            if (reservationModeSet.next() == true)
                
            {
            
                this.reservationMode = reservationModeSet.getString("reservationMode");
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        return reservationMode;
    }

    public void setReservationMode(String reservationMode) 
    
    {
        //SQL (update creditcards set paymentType="visa';)
        //you need a connection, a preparedstatement, and a result to hold update return value
        Connection connection;
        PreparedStatement setReservationModeStatement;
        int result;
        
        //initialise objects for backup
        connection = null;
        setReservationModeStatement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            setReservationModeStatement = connection.prepareStatement("UPDATE boards set reservationMode='" + reservationMode + "' WHERE boardID=" + this.boardID);
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
        //try collecting the resultset
        try
            
        {
            if (setReservationModeStatement != null)
                
            {
            
                result = setReservationModeStatement.executeUpdate(); 
                this.reservationMode = reservationMode;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setMemberType(String memberType) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set memberType='" + memberType + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.memberType = memberType;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setTeamName(String teamName) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set teamName='" + teamName + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.teamName = teamName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setOrganizationName(String organizationName) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set organizationName='" + organizationName + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.organizationName = organizationName;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setBoardCity(String boardCity) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set boardCity='" + boardCity + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.boardCity = boardCity;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setBoardProvince(String boardProvince) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set boardProvince='" + boardProvince + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.boardProvince = boardProvince;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setBoardCountry(String boardCountry) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set boardCountry='" + boardCountry + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.boardCountry = boardCountry;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setTeamLogo(String teamLogo) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set teamLogo='" + teamLogo + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.teamLogo = teamLogo;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setCreationMonth(int creationMonth) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set creationMonth=" + creationMonth + " WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.creationMonth = creationMonth;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setCreationDay(int creationDay) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set creationDay=" + creationDay + " WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.creationDay = creationDay;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setCreationHour(int creationHour) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set creationHour=" + creationHour + " WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.creationHour = creationHour;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setCreationMinute(int creationMinute) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set creationMinute=" + creationMinute + " WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.creationMinute = creationMinute;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setPurpose(String purpose) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set purpose='" + purpose + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.purpose = purpose;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setToll(String toll) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set toll='" + toll + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.toll = toll;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setReady(String ready) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set ready='" + ready + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.ready = ready;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public void setField(String field) 
    
    {
        Connection connection;
        PreparedStatement statement;
        int result;
        
        //initialise objects for backup
        connection = null;
        statement = null;
        result = -1;
        
        //try setting up all objects perfectly
        try
            
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword); 
            statement = connection.prepareStatement("UPDATE boards set field='" + field + "' WHERE boardID=" + this.boardID);
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
            
                result = statement.executeUpdate(); 
                this.field = field;
            
            }
            
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }

    public boolean isChargeCompleted() 
    
    {
        return chargeCompleted;
    }
    
}
