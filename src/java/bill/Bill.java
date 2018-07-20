/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bill;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

/**
 *
 * @author El Jefe
 */
public class Bill 

{
    private long articleID;
    private long programID;
    private long packageID;
    private String department;
    private String articleName;
    private String programName;
    private String packageName;
    private String articlePoster;
    private String programPoster;
    private String packagePoster;
    private String articleDistributor;
    private String programDistributor;
    private String packageCarrier;
    private String articleLocality;
    private String programLocality;
    private String packageLocality;
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
    
    public Bill(long articleID, String department)
            
    {
        this.articleID = articleID;
        this.programID = articleID;
        this.packageID = 0;
        this.department = department;
        this.articleName = "";
        this.programName = "";
        this.packageName = "";
        this.articlePoster = "";
        this.programPoster = "";
        this.packagePoster = null;
        this.articleDistributor = "";
        this.programDistributor = "";
        this.packageCarrier = null;
        this.articleLocality = "";
        this.programLocality = "";
        this.packageLocality = null;
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
        this.articleDistributor = programDistributor;
        this.articleLocality = programLocality;
        
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
                programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, purchasePrice, locality FROM movies WHERE movieID=" + programID );
            }

            else if (department.equals("series"))
            {
                programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, rentalPrice, purchasePrice, locality FROM series WHERE seriesID=" + programID );
            }

            else if (department.equals("video"))
            {
                programStatement = programConnection.prepareStatement("SELECT videoID, videoPoster, videoName, distributor, purchasePrice, locality FROM videos WHERE videoID=" + programID );
            }

            else if (department.equals("music"))
            {
                programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributor, purchasePrice, locality FROM music WHERE musicID=" + programID );
            }

            else if (department.equals("tv"))
            {
                programStatement = programConnection.prepareStatement("SELECT channelID, channelPoster, channelName, rentalPrice, locality FROM tv WHERE channelID=" + programID );
            }

            else if (department.equals("radio"))
            {
                programStatement = programConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributor, rentalPrice, locality FROM radio WHERE radioID=" + programID );
            }

            else if (department.equals("game"))
            {
                programStatement = programConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributor, purchasePrice, locality FROM games WHERE gameID=" + programID );
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
                    programDistributor = programSet.getString("distributor");
                    programLocality = programSet.getString("locality");
                    totalPrice = programSet.getString("rentalPrice");
                    message = "This movie program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                else if (department.equals("series"))
                {
                    programID = Long.parseLong(programSet.getString("seriesID"));
                    programName = programSet.getString("seriesName"); 
                    programPoster = programSet.getString("seriesPoster");
                    programDistributor = programSet.getString("distributor");
                    programLocality = programSet.getString("locality");
                    totalPrice = programSet.getString("rentalPrice"); 
                    message = "This TV series program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                else if (department.equals("video"))
                {
                    programID = Long.parseLong(programSet.getString("videoID"));
                    programName = programSet.getString("videoName"); 
                    programPoster = programSet.getString("videoPoster");
                    programDistributor = programSet.getString("distributor");
                    programLocality = programSet.getString("locality");
                    totalPrice = programSet.getString("purchasePrice"); 
                    message = "This video program will be available in your account indefinitely until you close your account.";
                }

                else if (department.equals("music"))
                {
                    programID = Long.parseLong(programSet.getString("musicID"));
                    programName = programSet.getString("musicName"); 
                    programPoster = programSet.getString("musicPoster");
                    programDistributor = programSet.getString("distributor");
                    programLocality = programSet.getString("locality");
                    totalPrice = programSet.getString("rentalPrice"); 
                    message = "This music program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                else if (department.equals("tv"))
                {
                    programID = Long.parseLong(programSet.getString("channelID"));
                    programName = programSet.getString("channelName"); 
                    programPoster = programSet.getString("channelPoster");
                    programLocality = programSet.getString("locality");
                    totalPrice = programSet.getString("rentalPrice"); 
                    message = "This TV channel program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                else if (department.equals("radio"))
                {
                    programID = Long.parseLong(programSet.getString("radioID"));
                    programName = programSet.getString("radioName"); 
                    programPoster = programSet.getString("radioPoster");
                    programDistributor = programSet.getString("distributor");
                    programLocality = programSet.getString("locality");
                    totalPrice = programSet.getString("rentalPrice"); 
                    message = "This radio channel program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                else if (department.equals("game"))
                {
                    programID = Long.parseLong(programSet.getString("gameID"));
                    programName = programSet.getString("gameName"); 
                    programPoster = programSet.getString("gamePoster");
                    programDistributor = programSet.getString("distributor");
                    programLocality = programSet.getString("locality");
                    totalPrice = programSet.getString("rentalPrice"); 
                    message = "This game program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                }

                DecimalFormat decimalFormat = new DecimalFormat("#0.00");

                subtotal = Double.parseDouble(totalPrice.substring(4));
                subtotalPrice = "USD$" + (decimalFormat.format(subtotal)); 
                gst = Double.parseDouble(totalPrice.substring(4)) * 0.08;  
                gstCost = "USD$" + (decimalFormat.format(gst)); 
                pst = Double.parseDouble(totalPrice.substring(4)) * 0.05;  
                pstCost = "USD$" + (decimalFormat.format(pst)); 
                total = subtotal + gst + pst;
                totalPrice = "USD$" + (decimalFormat.format(total)); 

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
