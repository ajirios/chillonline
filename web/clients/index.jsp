
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="../chilli.png"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal | Chillonline</title>
        <style type="text/css">
            body
            {
                margin: 0;
                background-color: #e63;
                font-family: sans-serif;
            }
            
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
    opacity: 1.0;
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
  
  nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin: 0;
  }

  nav ul li
  {
    float: right;
  }

  nav ul li a:link, nav ul li a:visited
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

  nav ul li a:hover, nav ul li a:active
  {
    color: #add9e6;
    opacity: 1.0;
  }
  
  nav ul li a.current
  {
    color: #add9e6;
  }
  
  nav
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
    opacity: 1.0;
    margin-top: 0px;
    font-size: 12px;
  }
            
            .block
            {
                width: 500px;
                height: 300px;
                margin: 10% auto 10% auto;
                background-color: #fff;
                opacity: 1.0;
            }
            
            .button2 {
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
   font-size: 17px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   margin-right: 0px;
   margin-top: 5px;
   width: 400px;
   }
.button2:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.button2:active {
   border-top-color: #2c7d04;
   background: #2c7d04;
   }
   
   .bol
  {
      float: left;
      margin-top: 10px;
      margin-left: 0px;
      width: 150px;
  }
   
   .titles
  {
      width: 400px;
      height: 200px;
      margin-top: 0px;
      margin-bottom: auto;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
  }
  
  .names
  {
    width: 390px;
    height: 30px;
    padding: 4px;
    margin: 5px 100px 5px auto;
    border-radius: 5px;
    border-color: #eee;
    font-size: 17px;
  }
  
  .create-account
  {
      text-decoration: none;
      font-family: sans-serif;
      color: #e63;
      margin-top: auto;
      margin-bottom: auto;
  }
  
  .forgot-password
  {
      text-decoration: none;
      font-family: sans-serif;
      color: #e63;
      margin-top: 0px;
      text-align: left;
      font-size: 10px;
      width: 400px;
      height: 20px;
  }
  
  .logos
  {
      text-align: center;
      height: 50px;
      width: 500px;
      color: #e63;
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
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 17px;
      color: #fff;
      text-decoration: none;
  }
  
  .bowl
  {
      margin-left: auto;
      margin-right: auto;
      height: 50px;
  }
  
            
        </style>
        
        
    </head>
    <body>
        
        <header>
      
    
      <div class="head">
        
        <a href="../index.jsp"><img class="bol" src="../chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li><a href="../users/index.jsp" class="current">Portal</a></li>
                    <li><a href="../games/index.jsp">Products</a></li>
                    <li><a href="../sounds/index.jsp" >Sounds</a></li>
                    <li><a href="../channels/index.jsp">Channels</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
        
        <div class="block">
            <div class="logos">
               <!-- <img class="bowl" src="../123456.png" alt="bol"> -->
            </div>
        <form action="" method="post">
            <div class="titles">
            <input type="email" class="names" id="useremail" placeholder="Email Address">
            <input type="password" class="names" id="useremail" placeholder="Password">
            <div class="forgot-password"><a class="forgot-password" href="">Forgot password?</a></div>
            <button class="button2"><a href="login.jsp" class="chillonline">Sign In</a></button>
            <p>Not a client? <a class="create-account" href="../index.jsp">Register an account.</a></p>
            </div>
            
        </form>
        
        </div>
        
        
    </body>
</html>
