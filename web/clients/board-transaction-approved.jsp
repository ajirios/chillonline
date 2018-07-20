<%-- 
    Document   : board-transaction-approved
    Created on : 11-Aug-2017, 11:47:14 AM
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
<title>Board Transaction Approved | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
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
      padding-left: 22%;
      padding-right: 22%;
      text-align: center;
      width: 58%;
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
            response.sendRedirect("../signin.jsp");
        }
        
        
        
        %>
        
        
        
        <form hidden name="logout-button-form" id="logout-button-form" action="../Logout">
            
            <button>Logout</button>
            
        </form>
        
  
  <header>
      
    <div class="head">
      
    <a href=""><img class="bol" src="../chillon.png" alt="bol"></a> 
        
    
        
            <nav class="nav">
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="../carriers/terminal.jsp">My Channels</a></div>
                            <div class="action-container"><a class="action" href="../distributors/uploads.jsp">My Distributions</a></div>
                            <div class="action-container"><a class="action" href="account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="javascript: submitLogoutForm()">Log Out</a></div>

                        </div>
                    
                    </li>   
                    <!--
                    <li><a class="a" href="../clients/giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="../clients/store.jsp" >Store</a></li>
                    <li><a class="a" href="../clients/packages.jsp" >Packages</a></li>
                    -->
                    <li><a class="a" href="../clients/job-boards.jsp" >Job Boards</a></li>
                    <li><a class="a" href="../clients/course-boards.jsp" >Course Boards</a></li>
                    <li><a class="a" href="../clients/leisure-boards.jsp">Leisure Boards</a></li>
                    <li><a class="a" href="../clients/home.jsp" >Home</a></li>
                </ul>
                    
            </nav>
      
    </div>      
          
  </header>
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
    
    
    
    <%
        
        
        
        %>
        
        <%
                        
                        

                        %>
                        
        
        <div class=""></div>
        <div class="bill">
            
            <div class=""></div>
            
            
            
            <div class="proceed-area">
                
                <form method="post" action="../clients/course-boards.jsp" class="">
                
                    <div class=""></div><br><br><br>
                    
                    
                    <div class=""><i class="material-icons" style="font-size:90px;color:green;">check_circle</i></div>
                    
                    <div><div>Your new board has been successfully created and has been added to your 
                            account.</div></div><br><br>
                    <button class="checkout-button">Go to Boards</button><br><br>
                
                </form>
                
            </div>
            
        </div>
        
        
        

</body>
</html>


