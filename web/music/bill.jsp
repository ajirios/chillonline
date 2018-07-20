

<%-- 
    Document   : bill
    Created on : 8-Oct-2016, 7:49:03 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="loggedout.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.DecimalFormat" %> 
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<title>Bill | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<meta charset="utf-8" /> 
<link rel="stylesheet" type="text/css" href="../bill.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../bill.js"></script>



<body>
  
  <header>
      
    <div class="head">
      
  <a href=""><img class="bol" src="../chillon.png" alt="bol"></a> 
        
    
        
            <nav class="nav">
                
                <ul>
                    <li><a href="../signin.jsp" >Sign In</a></li>
                    <li><a href="../index.jsp" >Register</a></li>
                    <li><a href="../giveaways.jsp" >Store Giveaways</a></li>
                    <li><a href="../store.jsp" id="page">Store</a></li>
                    <li><a href="../packages.jsp" >Packages</a></li>
                    <li><a href="../videos/stream.jsp" >Streaming</a></li>
                    <li><a href="../distribute.jsp" >Distribute</a></li>
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
        
        <%
                        
                            Bill bill;
                            
                            bill = new Bill(someID, type, transaction);
                            

                        %>
                        
        
        <div class=""></div>
        <div class="bill">
            
            <div class=""></div>
            <div class="poster-area">
                
                <img src='<%= bill.getArticlePoster() %>' alt='order' class="poster" >
                
            </div>
            <div class="subtotal-area">
                
                <div class=""></div>
                <div class=""></div>
                <div class="product-id"><span class=""><%= bill.getArticleName() %></span></div>
                <div class="distributor"><span class="">Distributed by <%= bill.getArticleDistributor() + ", " %><%= bill.getArticleLocality() %></span></div> 
                <div class="subtotal"><div class="charge">Subtotal:</div><div class="toll"><%= bill.getSubtotalPrice() %></div></div>
                <div class="gst"><div class="charge">GST/HST:</div><div class="toll"><%= bill.getGstCost() %></div></div>
                <div class="rst"><div class="charge">PST:</div><div class="toll"><%= bill.getPstCost() %></div></div>
                <div class="total"><div class="charge">Total:</div><div class="toll"><%= bill.getTotalPrice() %></div></div>
                <div class="rst"><div class="toll"><%= bill.getMessage() %></div></div>
                <div class=""></div>
                
                
            </div>
            <div class="proceed-area">
                
                <form method="post" action="../clients/receipt.jsp" class="">
                
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

