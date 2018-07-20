/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;



import java.sql.*;
import java.text.DecimalFormat;



/**
 *
 * @author ajirios
 */
public class Bill 

{
    private long articleID;
    private long programID;
    private long packageID;
    private long programDistributorID;
    private String department;
    private String transactionType;
    private String articleName;
    private String programName;
    private String packageName;
    private String articlePoster;
    private String programPoster;
    private String packagePoster;
    private String thumbnail;
    private String articleDistributor;
    private String programDistributor;
    private String packageCarrier;
    private String articleLocality;
    private String programLocality;
    private String packageLocality;
    private String rentalPrice;
    private String purchasePrice;
    private String subtotalPrice;
    private double subtotal; 
    private String gstCost;                        
    private double gst;
    private String pstCost;       
    private double pst;
    private String totalPrice;
    private double total;
    private String message;
    
    private static final String URL = "jdbc:mysql://chillonbase.cq3n4fwskn4i.ca-central-1.rds.amazonaws.com:3306/chillonline";
    private static final String dbUserName = "ajirios";
    private static final String dbPassword = "Empire621";
    
    public Bill(long articleID, String department, String transactionType)
            
    {
        this.articleID = articleID;
        this.programID = articleID;
        this.packageID = 0;
        this.programDistributorID = 0;
        this.department = department;
        this.transactionType = transactionType;
        this.articleName = "";
        this.programName = "";
        this.packageName = "";
        this.articlePoster = "";
        this.programPoster = "";
        this.packagePoster = null;
        this.thumbnail = null;
        this.articleDistributor = "";
        this.programDistributor = "";
        this.packageCarrier = null;
        this.articleLocality = "";
        this.programLocality = "";
        this.packageLocality = null;
        this.rentalPrice = "";
        this.purchasePrice = "";
        this.subtotalPrice = "";
        this.subtotal = 0.00; 
        this.gstCost = "";                        
        this.gst = 0.00;
        this.pstCost = "";       
        this.pst = 0.00;
        this.totalPrice = "";
        this.total = 0.00;
        this.message = "";
        
        constructArticle();
        
    }
    
    private void constructArticle()
            
    {
        constructProgram();
        
        this.articleID = programID;
        this.articleName = programName;
        this.articlePoster = programPoster;
        this.articleLocality = programLocality;
        
        constructDistributor();
        
        this.articleDistributor = programDistributor;
        
    }
    
    private void constructProgram()
            
    {
        Connection programConnection = null;
        PreparedStatement programStatement = null;
        ResultSet programSet = null;
        int count;

        try
        {
            programConnection = DriverManager.getConnection(URL, dbUserName, dbPassword);


            if (department.equals("movie"))
            {
                programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributorID, rentalPrice, purchasePrice, locality FROM movies WHERE movieID=" + programID );
            }

            else if (department.equals("series"))
            {
                programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributorID, rentalPrice, purchasePrice, locality FROM series WHERE seriesID=" + programID );
            }

            else if (department.equals("video"))
            {
                programStatement = programConnection.prepareStatement("SELECT videoID, videoPoster, videoName, thumbnail, distributorID, purchasePrice, locality FROM videos "
                        + "WHERE videoID=" + programID );
            }

            else if (department.equals("music"))
            {
                programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributorID, purchasePrice, locality FROM music WHERE musicID=" + programID );
            }

            else if (department.equals("tv"))
            {
                programStatement = programConnection.prepareStatement("SELECT channelID, channelPoster, channelName, distributorID, rentalPrice, locality FROM tv WHERE channelID=" + programID );
            }

            else if (department.equals("radio"))
            {
                programStatement = programConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributorID, rentalPrice, locality FROM radio WHERE radioID=" + programID );
            }

            else if (department.equals("game"))
            {
                programStatement = programConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributorID, purchasePrice, locality FROM games WHERE gameID=" + programID );
            }


        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            programSet = programStatement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            for (count = 0; (count < 1) && (programSet.next() == true); count++) 

            {

                if (department.equals("movie"))
                {
                    programID = Long.parseLong(programSet.getString("movieID"));
                    programName = programSet.getString("movieName"); 
                    programPoster = programSet.getString("moviePoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    purchasePrice = programSet.getString("purchasePrice");

                    if (this.transactionType.equals("rental"))

                    {
                        totalPrice = rentalPrice;
                        message = "This movie program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                    }

                    else if (this.transactionType.equals("purchase"))

                    {
                        totalPrice = purchasePrice;
                        message = "This movie program will be available in your account until your Chillonline account is closed.";
                    }

                    else

                    {
                        totalPrice = purchasePrice;
                        message = "This movie program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                    }
                    
                }

                else if (department.equals("series"))
                {
                    programID = Long.parseLong(programSet.getString("seriesID"));
                    programName = programSet.getString("seriesName"); 
                    programPoster = programSet.getString("seriesPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice");
                    purchasePrice = programSet.getString("purchasePrice");

                    if (this.transactionType.equals("rental"))

                    {
                        totalPrice = rentalPrice;
                        message = "This TV series program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                    }

                    else if (this.transactionType.equals("purchase"))

                    {
                        totalPrice = purchasePrice;
                        message = "This TV series program will be available in your account until your Chillonline account is closed.";
                    }

                    else

                    {
                        totalPrice = rentalPrice;
                        message = "This TV series program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                    }
                    
                }

                else if (department.equals("video"))
                {
                    programID = Long.parseLong(programSet.getString("videoID"));
                    programName = programSet.getString("videoName"); 
                    programPoster = programSet.getString("videoPoster");
                    thumbnail = programSet.getString("thumbnail");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice"); 
                    totalPrice = purchasePrice;
                    message = "This video program will be available in your account until your Chillonline account is closed.";
                }

                else if (department.equals("music"))
                {
                    programID = Long.parseLong(programSet.getString("musicID"));
                    programName = programSet.getString("musicName"); 
                    programPoster = programSet.getString("musicPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice"); 
                    totalPrice = purchasePrice;
                    message = "This music program will be available in your account until your Chillonline account is closed.";
                }

                else if (department.equals("tv"))
                {
                    programID = Long.parseLong(programSet.getString("channelID"));
                    programName = programSet.getString("channelName"); 
                    programPoster = programSet.getString("channelPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice"); 
                    totalPrice = rentalPrice;
                    message = "This TV channel program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                else if (department.equals("radio"))
                {
                    programID = Long.parseLong(programSet.getString("radioID"));
                    programName = programSet.getString("radioName"); 
                    programPoster = programSet.getString("radioPoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programLocality = programSet.getString("locality");
                    rentalPrice = programSet.getString("rentalPrice"); 
                    totalPrice = rentalPrice;
                    message = "This radio channel program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                else if (department.equals("game"))
                {
                    programID = Long.parseLong(programSet.getString("gameID"));
                    programName = programSet.getString("gameName"); 
                    programPoster = programSet.getString("gamePoster");
                    programDistributorID = Long.parseLong(programSet.getString("distributorID"));
                    programLocality = programSet.getString("locality");
                    purchasePrice = programSet.getString("purchasePrice"); 
                    totalPrice = purchasePrice;
                    message = "This game program will be available in your account until your Chillonline account is closed.";
                }

                DecimalFormat decimalFormat = new DecimalFormat("#0.00");

                subtotal = Double.parseDouble(totalPrice.substring(4));
                subtotalPrice = "USD$" + (decimalFormat.format(subtotal)); 
                gst = Double.parseDouble(totalPrice.substring(4)) * 0.08;  
                gstCost = "USD$" + (decimalFormat.format(gst)); 
                pst = Double.parseDouble(totalPrice.substring(4)) * 0.05;  
                pstCost = "USD$" + (decimalFormat.format(pst)); 
                total = subtotal + gst + pst;
                
                if (this.transactionType.equals("rental"))
                    
                {
                    subtotalPrice = "USD$" + (decimalFormat.format(subtotal)) + " / mo."; 
                    totalPrice = "USD$" + (decimalFormat.format(total)) + " / mo."; 
                }
                
                else if (this.transactionType.equals("purchase"))
                    
                {
                    totalPrice = "USD$" + (decimalFormat.format(total)); 
                }
                
                else
                    
                {
                    totalPrice = "USD$" + (decimalFormat.format(total)); 
                }

            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructDistributor()
            
    {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        int count;

        try
        {
            connection = DriverManager.getConnection(URL, dbUserName, dbPassword);
            statement = connection.prepareStatement("SELECT distributorName FROM distributors WHERE distributorID=" + programDistributorID );
            
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
        {
            resultSet = statement.executeQuery();
        }
        
        catch (SQLException e)
        {
            e.printStackTrace();
        }
        
        try
            
        {

            for (count = 0; (count < 1) && (resultSet.next() == true); count++) 

            {
                
                programDistributor = resultSet.getString("distributorName");
                
            }
        
        }
        
        catch (SQLException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
    private void constructPackage()
            
    {
        
    }

    public long getProgramID() 
    
    {
        return programID;
    }

    public void setProgramID(long programID) 
    
    {
        this.programID = programID;
    }

    public String getDepartment() 
    
    {
        return department;
    }

    public void setDepartment(String department) 
    
    {
        this.department = department;
    }

    public long getProgramDistributorID() 
    
    {
        return programDistributorID;
    }

    public void setProgramDistributorID(long programDistributorID) 
    
    {
        this.programDistributorID = programDistributorID;
    }

    public String getTransactionType() 
    
    {
        return transactionType;
    }

    public void setTransactionType(String transactionType) 
    
    {
        this.transactionType = transactionType;
    }

    public String getProgramName() 
    
    {
        return programName;
    }

    public void setProgramName(String programName) 
    
    {
        this.programName = programName;
    }

    public String getProgramPoster() 
    
    {
        return programPoster;
    }

    public void setProgramPoster(String programPoster) 
    
    {
        this.programPoster = programPoster;
    }

    public String getThumbnail() 
    
    {
        return thumbnail;
    }

    public String getProgramDistributor() 
    
    {
        return programDistributor;
    }

    public void setProgramDistributor(String programDistributor) 
    
    {
        this.programDistributor = programDistributor;
    }

    public String getProgramLocality() 
    
    {
        return programLocality;
    }

    public void setProgramLocality(String programLocality) 
    
    {
        this.programLocality = programLocality;
    }

    public String getSubtotalPrice() 
    
    {
        return subtotalPrice;
    }

    public void setSubtotalPrice(String subtotalPrice) 
    
    {
        this.subtotalPrice = subtotalPrice;
    }

    public double getSubtotal() 
    
    {
        return subtotal;
    }

    public void setSubtotal(double subtotal) 
    
    {
        this.subtotal = subtotal;
    }

    public String getGstCost() 
    
    {
        return gstCost;
    }

    public void setGstCost(String gstCost) 
    
    {
        this.gstCost = gstCost;
    }

    public double getGst() 
    
    {
        return gst;
    }

    public void setGst(double gst) 
    
    {
        this.gst = gst;
    }

    public String getPstCost() 
    
    {
        return pstCost;
    }

    public void setPstCost(String pstCost) 
    
    {
        this.pstCost = pstCost;
    }

    public double getPst() 
    
    {
        return pst;
    }

    public void setPst(double pst) 
    
    {
        this.pst = pst;
    }

    public String getTotalPrice() 
    
    {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice) 
    
    {
        this.totalPrice = totalPrice;
    }

    public double getTotal() 
    
    {
        return total;
    }

    public void setTotal(double total) 
    
    {
        this.total = total;
    }

    public String getMessage() 
    
    {
        return message;
    }

    public void setMessage(String message) 
    
    {
        this.message = message;
    }

    public long getPackageID() 
    
    {
        return packageID;
    }

    public void setPackageID(long packageID) 
    
    {
        this.packageID = packageID;
    }

    public String getPackageName() 
    
    {
        return packageName;
    }

    public void setPackageName(String packageName) 
    
    {
        this.packageName = packageName;
    }

    public String getPackagePoster() 
    
    {
        return packagePoster;
    }

    public void setPackagePoster(String packagePoster) 
    
    {
        this.packagePoster = packagePoster;
    }

    public String getPackageCarrier() 
    
    {
        return packageCarrier;
    }

    public void setPackageCarrier(String packageCarrier) 
    
    {
        this.packageCarrier = packageCarrier;
    }

    public String getPackageLocality() 
    
    {
        return packageLocality;
    }

    public void setPackageLocality(String packageLocality) 
    
    {
        this.packageLocality = packageLocality;
    }

    public long getArticleID() 
    
    {
        return articleID;
    }

    public void setArticleID(long articleID) 
    
    {
        this.articleID = articleID;
    }

    public String getArticleName() 
    
    {
        return articleName;
    }

    public void setArticleName(String articleName) 
    
    {
        this.articleName = articleName;
    }

    public String getArticlePoster() 
    
    {
        return articlePoster;
    }

    public void setArticlePoster(String articlePoster) 
    
    {
        this.articlePoster = articlePoster;
    }

    public String getArticleDistributor() 
    
    {
        return articleDistributor;
    }

    public void setArticleDistributor(String articleDistributor) 
    
    {
        this.articleDistributor = articleDistributor;
    }

    public String getArticleLocality() 
    
    {
        return articleLocality;
    }

    public void setArticleLocality(String articleLocality) 
    
    {
        this.articleLocality = articleLocality;
    }
    
}
