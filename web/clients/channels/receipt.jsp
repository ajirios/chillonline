<%-- 
    Document   : receipt
    Created on : 28-Oct-2016, 6:00:47 AM
    Author     : El Jefe
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="log.*" %>
<%@page import="loggedout.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Receipt | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../../chilli.png"/>
<meta charset="utf-8" /> 
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style type="text/css">
    
    
    header
  {
    background-color: #FFF;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
   background: -webkit-linear-gradient(top, #000, #bababa);
   background: -moz-linear-gradient(top, #000, #bababa);
   background: -ms-linear-gradient(top, #000, #bababa);
   background: -o-linear-gradient(top, #000, #bababa);
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    height: 50px;
    color: #000;
    box-shadow: 0px 2px 5px #AAA;
    text-indent: 30px;
  }
  
  .head
  {
      width: 90%;
      height: 50px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 0;
  }
  
  body
  {
    margin: 0;
    background-color: #EEE;
    font-family: sans-serif;
  }
  
  .nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin: 0;
  }

  .nav ul li
  {
    float: right;
  }

  .nav ul li .a:link, .nav ul li .a:visited
  {
    display: block;
    background-color: #fff;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
    background: -webkit-linear-gradient(top, #000, #bababa);
    background: -moz-linear-gradient(top, #000, #bababa);
    background: -ms-linear-gradient(top, #000, #bababa);
    background: -o-linear-gradient(top, #000, #bababa);
    opacity: 0.8;
    text-align: right;
    padding-top: 18px;
    padding-bottom: 18px;
    padding-left: 20px;
    padding-right: 20px;
    text-decoration: none;
    color: #fff;
    font-family: /*"Josefin Slab", Arial, Helvetica, Pacifico, Rockwell,*/ sans-serif;
    font-size: 12px;
  }

  .nav ul li .a:hover, .nav ul li .a:active
  {
    color: #add9e6;
    opacity: 1.0;
  }
  
  .nav ul li .a.current
  {
    color: #add9e6;
  }
      
  .sept
  {
    background-color: #FFF;
    margin-right: 0;
    margin-top: 0;
    margin-left: 500px;
    height: 505px;
    color: #000;
    opacity: 0.7;
    box-shadow: 0px 2px 5px #AAA;
  }
  
  .nav
  {
      
    float: right;
      
  }
  
  footer
  {
    background-color: #FFF;
    margin-left: 0;
    margin-right: 0;
    margin-bottom: 0;
    height: 300px;
    box-shadow: 0px 2px 5px #AAA;
    opacity: 0.7;
    margin-top: 100px;
    font-size: 12px;
  }
  
  .bol
  {
      float: left;
      margin-top: 10px;
      margin-left: 0px;
      width: 150px;
  }
  
  .footnotes
{
    float: left;
    font-size: 12px;
    height: 230px;
    width: 200px;
    text-align: left;
}

.notes
{
    text-decoration: none;
    color: #000;
}

.notes:hover
{
    color: #e63;
}

.copyright
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
}

.store
  {
      width: 99%;
      height: 3300px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 10px;
  }
  
  .bill
  {
      width: 90%;
      height: 400px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 50px;
      background-color: #FFF;
  }
  
  .counter-area
  {
      width: 100%;
      height: 400px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 20px;
      background-color: #f40;
      color: #FFF;
  }
  
  .advertised-area
  {
      width: 100%;
      height: 1400px;
      margin-left: auto;
      margin-right: auto;
      background-color: #ccc;
  }
  
  .wall-heading
  {
      text-align: center;
      font-size: 70px;
  }
  
  .wall-heading-area
  {
      width: 90%;
      height: 200px;
      margin-left: auto;
      margin-right: auto;
      padding-top: 50px;
  }
  
  .wall-text
  {
      text-align: center;
      font-size: 30px;
  }
  
  .wall-text-area
  {
      width: 90%;
      height: 200px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .proceed-area
  {
      float: left;
      padding-bottom: 20px;
      padding-top: 20px;
      padding-left: 2%;
      padding-right: 2%;
      width: 28%;
      height: 260px;
  }
  
  .poster-area
  {
      float: left;
      padding-bottom: 20px;
      padding-top: 20px;
      padding-left: 2%;
      padding-right: 2%;
      width: 18%;
      height: 260px;
  }
  
  .poster
  {
      width: 80%;
      box-shadow: 0px 1px 4px #AAA;
  }
  
  .subtotal-area
  {
      float: left;
      padding-bottom: 20px;
      padding-top: 20px;
      padding-left: 2%;
      padding-right: 2%;
      width: 38%;
      height: 260px;
  }
  
  .checkout-button
  {
      border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   padding: 7.5px 25px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 13px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   width: 100%;
  }
  
  .checkout-button:hover 
  {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
   
.checkout-button:active 
{
   border-top-color: #2c7d04;
   background: #2c7d04;
   }
   
   .sign-name-area
   {
       width: 100%;
       height: 60px;
       padding-top: 10px;
   }
   
   .sign-word-area
   {
       width: 100%;
       height: 60px;
       padding-top: 10px;
   }
   
   .signature-name
   {
       width: 98%;
       height: 35px;
       font-size: 15px;
   }
   
   .signature-password
   {
       width: 98%;
       height: 35px;
       font-size: 15px;
   }
   
   .product-id
   {
       width: 100%;
       height: 30px;
       padding-top: 10px;
       color: #f40;
       font-size: 25px;
   }
   
   .distributor
   {
       width: 100%;
       height: 30px;
       padding-top: 10px;
       color: #555;
       font-size: 13px;
   }
   
   .subtotal
   {
       width: 100%;
       height: 30px;
       padding-top: 2px;
       padding-bottom: 3px;
       font-size: 19px;
   }
   
   .gst
   {
       width: 100%;
       height: 30px;
       padding-top: 2px;
       font-size: 13px;
   }
   
   .pst
   {
       width: 100%;
       height: 30px;
       padding-top: 2px;
       font-size: 13px;
   }
   
   .rst
   {
       width: 100%;
       height: 30px;
       padding-top: 2px;
       font-size: 13px;
   }
   
   .total
   {
       width: 100%;
       height: 30px;
       padding-top: 2px;
       font-size: 20px;
   }
   
   .charge
   {
       width: 30%;
       height: 30px;
       float: left;
       font-weight: bold;
   }
   
   .toll
   {
       width: 70%;
       height: 30px;
       color: #555;
   }
   
   .sign-style
   {
       text-decoration: none;
       color: #FFF;
   }
  
   #my-account
  {
      display: none;
      overflow: no-content;
      position: fixed;
      width: 190px;
      height: 250px;
      background-color: #FFF;
      border: 2px solid #f00;
      box-shadow: 0 1px 4px #333;
  }
  
  nav ul li .a:hover ~#my-account
  {
      display: block;
  }
  
  #my-account:hover
  {
      display: block;
  }
  
  .action-container
  {
      width: 160px;
      height: 35px;
      background-color: #f40;
      padding-top: 15px;
      padding-left: 15px;
      padding-right: 15px;
      float: right;
  }
  
  .action
  {
      color: #fff;
      font-size: 13px;
      text-decoration: none;
  }
  
  


    
    
</style>
<script type="text/javascript">
  

    function submitLogoutForm()
        
    {
        document.forms["logout-button-form"].submit(); 
    }

  
</script>

</head>

<body>
    
    
    
    <%
        
        if (session.getAttribute("account-number") == null)
        
        {
            response.sendRedirect("../../signin.jsp");
        }
        
        
        
        %>
        
        
        
        <form hidden name="logout-button-form" id="logout-button-form" action="../../Logout">
            
            <button>Logout</button>
            
        </form>
        
  
  <header>
      
    <div class="head">
      
    <a href=""><img class="bol" src="../../chillon.png" alt="bol"></a> 
        
    
        
            <nav class="nav">
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="../account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="../account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="../account-hold.jsp">Hold My Account</a></div>
                            <div class="action-container"><a class="action" href="../account-close.jsp">Close My Account</a></div>
                            <div class="action-container"><a class="action" href="javascript: submitLogoutForm()">Log Out</a></div>

                        </div>
                    
                    </li>   
                    <li><a class="a" href="../../clients/giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="../../clients/store.jsp" >Store</a></li>
                    <li><a class="a" href="../../clients/packages.jsp" >Packages</a></li>
                    <li><a class="a" href="../../clients/videos/stream.jsp" >Streaming</a></li>
                    <li><a class="a" href="../../clients/boards.jsp" >Boards</a></li>
                    <li><a class="a" href="../../clients/home.jsp" >Home</a></li>
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
                
                <form method="post" action="../../clients/home.jsp" class="">
                
                    <div class=""></div><br>
                    
                    
                    <div class=""><i class="material-icons" style="font-size:60px;color:green;">check_circle</i></div>
                    
                    <div class="rst"><div class="toll">Congratulations! Your transaction has been successfully processed and your purchase has been added to your 
                            account.</div></div><br><br><br>
                    <button class="checkout-button">Go Home</button><br><br>
                
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
                
                <span class="wall-text">Experience Canada's newest multimedia distribution network at its finest. We distribute media content to a host of companies and individuals 
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
        
        

</body>
</html>

