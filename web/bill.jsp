

<%-- 
    Document   : bill
    Created on : 8-Oct-2016, 7:49:03 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DecimalFormat" %> 
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<title>Bill | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="chilli.png"/>
<meta charset="utf-8" /> 
<link rel="stylesheet" type="text/css" href="bill.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="bill.js"></script>



<body>
  
  <header>
      
    <div class="head">
      
  <a href=""><img class="bol" src="chillon.png" alt="bol"></a> 
        
    
        
            <nav class="nav">
                
                <ul>
                    <li><a href="signin.jsp" >Sign In</a></li>
                    <li><a href="register.jsp" >Register</a></li>
                    <li><a href="giveaways.jsp" >Store Giveaways</a></li>
                    <li><a href="store.jsp" >Store</a></li>
                    <li><a href="index.jsp" >Packages</a></li>
                    <li><a href="stream.jsp" >Streaming</a></li>
                    <li><a href="distribute.jsp" >Distribute</a></li>
                </ul>
                    
            </nav>
      
    </div>      
          
  </header>
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
    
    
    
    <%
            int someID = 3;
            String packageID = "";  
            String type = "";
            String transaction = "";

try
    { 
            type = request.getParameter("department");
            transaction = request.getParameter("business");
            packageID = request.getParameter("packageID"); 
            someID = Integer.parseInt(packageID);
            } 
            catch(Exception e) 
            { 
            e.printStackTrace(); 
    }
        
        
        
        %>
        
        <%!
            
public class Package
{

String URL = "jdbc:mysql://localhost:3306/chillonline";
String userName = "root";
String password = "Empire7";

Connection programConnection = null;
PreparedStatement programStatement = null;
ResultSet programSet = null;
int packageID;

public Package(int id, String department)
{
    
    packageID = id;
    
    try
    {
        programConnection = DriverManager.getConnection(URL, userName, password);
        

        if (department.equals("movie"))
        {
            programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, locality FROM movies WHERE movieID=" + packageID );
        }

        else if (department.equals("series"))
        {
            programStatement = programConnection.prepareStatement("SELECT seriesID, seriesPoster, seriesName, distributor, rentalPrice, purchasePrice, locality FROM series WHERE seriesID=" + packageID );
        }

        else if (department.equals("video"))
        {
            programStatement = programConnection.prepareStatement("SELECT movieID, moviePoster, movieName, distributor, rentalPrice, locality FROM movies WHERE movieID=" + packageID );
        }

        else if (department.equals("music"))
        {
            programStatement = programConnection.prepareStatement("SELECT musicID, musicPoster, musicName, distributor, rentalPrice, locality FROM music WHERE musicID=" + packageID );
        }

        else if (department.equals("tv"))
        {
            programStatement = programConnection.prepareStatement("SELECT channelID, channelPoster, channelName, rentalPrice, locality FROM tv WHERE channelID=" + packageID );
        }

        else if (department.equals("radio"))
        {
            programStatement = programConnection.prepareStatement("SELECT radioID, radioPoster, radioName, distributor, rentalPrice, locality FROM radio WHERE radioID=" + packageID );
        }

        else if (department.equals("game"))
        {
            programStatement = programConnection.prepareStatement("SELECT gameID, gamePoster, gameName, distributor, rentalPrice, locality FROM games WHERE gameID=" + packageID );
        }


    }
    catch (SQLException e)
    {
        e.printStackTrace();
    }

}

public ResultSet getProgram()
{
    try
    {
        programSet = programStatement.executeQuery();
    }
    catch (SQLException e)
    {
        e.printStackTrace();
    }

    return programSet;

}

public void setProgramID(int id)
{
    this.packageID = id;
}

}
                
                %>
            
            <%
                    
                    Package program = new Package(someID, type);   
                    ResultSet programsSet = program.getProgram(); 
                    
                    
                    %>
                    
                    <%
                        int count;
                        String programID = ""; 
                        String programName = "";
                        String programPoster = "";
                        String programDistributor = "";
                        String programLocality = "";
                        String programRentalPrice = "";
                        double subtotal = 0.00; 
                        String gstCost = "";                        
                        double gst = 0.00;
                        String pstCost = "";       
                        double pst = 0.00;
                        String totalPrice = "";
                        double total = 0.00;
                        String message = "";
                        
                        for (count = 0; (count < 1) && (programsSet.next() == true); count++) {
                            
                            
                            
                            if (type.equals("movie"))
                            {
                                programID = programsSet.getString("movieID");
                                programName = programsSet.getString("movieName"); 
                                programPoster = programsSet.getString("moviePoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice");
                                message = "This movie program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                            }

                            else if (type.equals("series"))
                            {
                                programID = programsSet.getString("seriesID");
                                programName = programsSet.getString("seriesName"); 
                                programPoster = programsSet.getString("seriesPoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                                message = "This TV series program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                            }

                            else if (type.equals("video"))
                            {
                                programID = programsSet.getString("movieID");
                                programName = programsSet.getString("movieName"); 
                                programPoster = programsSet.getString("moviePoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                                message = "This video program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                            }

                            else if (type.equals("music"))
                            {
                                programID = programsSet.getString("musicID");
                                programName = programsSet.getString("musicName"); 
                                programPoster = programsSet.getString("musicPoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                                message = "This music program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                            }

                            else if (type.equals("tv"))
                            {
                                programID = programsSet.getString("channelID");
                                programName = programsSet.getString("channelName"); 
                                programPoster = programsSet.getString("channelPoster");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                                message = "This TV channel program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                            }

                            else if (type.equals("radio"))
                            {
                                programID = programsSet.getString("radioID");
                                programName = programsSet.getString("radioName"); 
                                programPoster = programsSet.getString("radioPoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                                message = "This radio channel program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                            }

                            else if (type.equals("game"))
                            {
                                programID = programsSet.getString("gameID");
                                programName = programsSet.getString("gameName"); 
                                programPoster = programsSet.getString("gamePoster");
                                programDistributor = programsSet.getString("distributor");
                                programLocality = programsSet.getString("locality");
                                programRentalPrice = programsSet.getString("rentalPrice"); 
                                message = "This game program will be available in your account for one month, and will be automatically renewed every month until cancellation.";
                            }
                            
                            DecimalFormat decimalFormat = new DecimalFormat("#0.00");
                            
                            subtotal = Double.parseDouble(programRentalPrice.substring(4));
                            gst = Double.parseDouble(programRentalPrice.substring(4)) * 0.08;  
                            gstCost = "USD$" + (decimalFormat.format(gst)); 
                            pst = Double.parseDouble(programRentalPrice.substring(4)) * 0.05;  
                            pstCost = "USD$" + (decimalFormat.format(pst)); 
                            total = subtotal + gst + pst;
                            totalPrice = "USD$" + (decimalFormat.format(total)); 


                        %>
                        
        
        <div class=""></div>
        <div class="bill">
            
            <div class=""></div>
            <div class="poster-area">
                
                <img src='<%= programPoster %>' alt='order' class="poster" >
                
            </div>
            <div class="subtotal-area">
                
                <div class=""></div>
                <div class=""></div>
                <div class="product-id"><span class=""><%= programName %></span></div>
                <div class="distributor"><span class=""><%= programDistributor + ", " %><%= programLocality %></span></div> 
                <div class="subtotal"><div class="charge">Subtotal:</div><div class="toll"><%= programRentalPrice %> / mo.</div></div>
                <div class="gst"><div class="charge">GST/HST:</div><div class="toll"><%= gstCost %></div></div>
                <div class="rst"><div class="charge">PST:</div><div class="toll"><%= pstCost %></div></div>
                <div class="total"><div class="charge">Total:</div><div class="toll"><%= totalPrice %> / mo.</div></div>
                <div class="rst"><div class="toll"><%= message %></div></div>
                <div class=""></div>
                
                
            </div>
            <div class="proceed-area">
                
                <form method="post" action="clients/receipt.jsp" class="">
                
                    <div class=""></div>
                    <div class="sign-name-area">
                        
                        <input required="" class="signature-name" type="email" name="email_address" placeholder="Email address">
                        
                    </div>
                    <div class="sign-word-area">
                        
                        <input required class="signature-password" type="password" name="password" placeholder="Password">
                        
                    </div>
                    <div class=""></div>
                    <button class="checkout-button">Sign In to Add to your Account</button><br><br>
                    <div class="rst"><div class="toll">By clicking on the above button, I hereby agree that this content will be added to my account 
                        in accordance with the Terms of Service.</div></div>
                
                </form>
                
            </div>
            
        </div>
        <div class="counter-area">
            
            <div class=""></div>
            <div class="wall-heading-area">
                
                <span class="wall-heading">Canada's newest multimedia distribution network</span>
                
            </div>
            <div class=""></div>
            <div class="wall-text-area">
                
                <span class="wall-text">Experience Canada's newest multimedia distribution network at its finest. We distribute media content to a host of individuals 
                    who are more than happy to be entertained by our unique peppy spirit!
                </span>
                
            </div>
            <div class=""></div>
            
        </div>
        <div class="advertised-area">
            
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            
        </div>
        <div class=""></div>
        
        <%
                            }
                            %>
        
                            
  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Users</h4>
          <a class="notes" href=""><p>Channels</p></a>
          <a class="notes" href=""><p>Series</p></a>
          <a class="notes" href=""><p>Movies</p></a>
          <a class="notes" href=""><p>Videos</p></a>
          <a class="notes" href=""><p>Music</p></a>
          <a class="notes" href=""><p>Games</p></a>
        </div>
      <div class="footnotes"><h4>Distributors</h4>
          <a class="notes" href=""><p>Channels</p></a>
          <a class="notes" href=""><p>Series</p></a>
          <a class="notes" href=""><p>Movies</p></a>
          <a class="notes" href=""><p>Videos</p></a>
          <a class="notes" href=""><p>Music</p></a>
          <a class="notes" href=""><p>Games</p></a>
      </div>
      <div class="footnotes"><h4>Legal</h4>
          <a class="notes" href="terms.jsp"><p>Terms of Service</p></a>
          <a class="notes" href="privacy_policy.jsp"><p>Privacy Policy</p></a>
          <a class="notes" href="eula.jsp"><p>EULA</p></a>
          <a class="notes" href="distribution-agreement.jsp"><p>Distribution Agreement</p></a>
      </div>
      <div class="footnotes"><h4>About</h4>
          <a class="notes" href=""><p>Founder</p></a>
          <a class="notes" href=""><p>Investors</p></a>
          <a class="notes" href=""><p>Mission</p></a>
          <a class="notes" href=""><p>Vendors</p></a>
      </div>
      <div class="footnotes"><h4>Contact</h4>
          <a class="notes" href=""><p>Head Office</p></a>
          <a class="notes" href=""><p>Jobs</p></a>
          <a class="notes" href=""><p>Phone</p></a>
          <a class="notes" href=""><p>Email</p></a>
      </div>
        <hr>
        <p>&copy; 2017. Chill Technologies, Inc. All Rights Reserved.</p>
        <p>Developed by @ajirios | Jeffrey Ajiri Osauzo.</p>
    </div>
    
    
  </footer>

</body>
</html>

