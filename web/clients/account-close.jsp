<%-- 
    Document   : account-close
    Created on : 31-Oct-2016, 2:47:09 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="client.AccountClose" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Close My Account | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<meta charset="utf-8" /> 
<style type="text/css">
  @font-face {
    font-family: 'Pacifico'; /*a name to be used later*/
    src: url('Pacifico.ttf'); /*URL to font*/
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
  
  nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin-right: 0;
    margin-top: 0;
    margin-bottom: 0;
    margin-left: 0;
  }

  nav ul li
  {
    float: right;
  }

  nav ul li .a:link, nav ul li .a:visited
  {
    display: block;
    background-color: #fff;
    background: -webkit-gradient(linear, left top, left bottom, from(#000), to(#bababa));
    background: -webkit-linear-gradient(top, #000, #bababa);
    background: -moz-linear-gradient(top, #000, #bababa);
    background: -ms-linear-gradient(top, #000, #bababa);
    background: -o-linear-gradient(top, #000, #bababa);
    opacity: 1.0;
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

  nav ul li .a:hover, nav ul li .a:active
  {
    color: #e63;
    opacity: 1.0;
  }
  
  .chillonline
  {
      font-family: sans-serif, 'Pacifico';
      font-size: 17px;
      color: #fff;
      text-decoration: none;
      float: left;
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
  
  .sept2
  {
    background-color: #c00;
    margin-right: 0;
    margin-top: 0;
    width: 70%;
    height: 200px;
    color: #000;
    float: right;
  }
  
  nav
  
  {
      
    margin-right: 0px;
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
  
  .logos
  {
      background-color: #333;
      margin-left: 10px;
      margin-right: 10px;
      height: 200px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 0.8;
      margin-top: -500px;
  }
  
  #logos
  {
      height: 50%;
      opacity: 1.0;
  }
  
  .button {
   border-top: 1px solid #d4003c;
   background: #780000;
   background: -webkit-gradient(linear, left top, left bottom, from(#b00000), to(#780000));
   background: -webkit-linear-gradient(top, #b00000, #780000);
   background: -moz-linear-gradient(top, #b00000, #780000);
   background: -ms-linear-gradient(top, #b00000, #780000);
   background: -o-linear-gradient(top, #b00000, #780000);
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
   font-family: 'Lucida Grande', Helvetica, Arial, Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border-top-color: #c90000;
   background: #c90000;
   color: #f2efef;
   }
.button:active {
   border-top-color: #a30a11;
   background: #a30a11;
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
   }
.button2:hover {
   border-top-color: #2c7d04;
   background: #2c7d04;
   color: #f2efef;
   }
.button2:active {
   border-top-color: #2c3d00;
   background: #2c3d00;
   }
  
  .rimground
  {
    width: 100px;
    height: 150px;
    opacity: 1.0;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 5px;
    margin-right: 5px;
    float: left;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: 10px;
  }
    
  .bol
  {
      float: left;
      margin-top: 10px;
      margin-left: 0px;
      width: 150px;
  }
  
  #container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 70px;
      width: 90%;
      height: 1650px;
  }

.moviediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

.seriediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

.grey
{
    margin: 25px auto 25px auto;
    height: 50px;
    background-color: #eee;
}

.musicdiv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

.gamediv
{
    margin: 25px auto 25px auto;
    height: 300px;
    background-color: #e63;
}

  .divers
  {
      margin-left: 0;
      margin-right: 0;
      margin-top: 0;
      height: 50px;
  }
  
  .right
  {
      margin-left: 0;
      margin-top: 0px;
      height: 200px;
      width: 30%;
      background-color: #e63;
      float: left;
  }
  
  .createaccount
  {
      color: #FFF;
      width: 90%;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
      padding-top: 50px;
  }
  
  .titles
  {
      width: 90%;
      height: 300px;
      margin-top: 20px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .names
  {
    width: 94%;
    height: 30px;
    padding: 4px;
    margin: 5px auto 5px auto;
    border-radius: 10px;
    font-size: 13px;
  }
  
  .boxes
  {
      width: 200px;
      height: 300px;
      margin-top: 20px;
      margin-left: 20px;
      background-color: #e45;
  }

.copyright
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
}

.click-agreement
{
    color: #fff;
    font-size: 9px;
}

.disclaimer
{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
    width: 1000px;
    font-size: 7px;
    text-decoration: none;
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
  
  #epic
  {
      margin-left: 0px;
  }
  
  .headtext
  {
      font-size: 25px;
      margin-top: 50px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
      width: 500px;
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
  
  .main
  {
      width: 96%;
      height: 1800px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 50px;
  }
  
  .main-left
  {
      width: 70%;
      height: 1800px;
      background-color: #FFF;
      float: left;
      border-left: 4px solid #f40; 
  }
  
  .main-right
  {
      width: 29%;
      height: 1800px;
      background-color: #f40;
      float: left;
  }
  
  .explanation
  {
      margin-left: 50px;
      margin-right: 50px;
      padding-top: 50px;
      padding-bottom: 50px;
      height: 900px;
  }
  
  .explanation-header
  {
      color: #f40;
      font-size: 30px;
  }
  
  .names
  {
      border: 1px solid #AAA;
      border-radius: 1px;
  }
  
  #logout-button-form
  {
      display: none;
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
        
        
        
        <form name="logout-button-form" id="logout-button-form" action="../Logout">
            
            <button>Logout</button>
            
        </form>
        
  
  <header>
      
    
      <div class="head">
        
          <a href=""><img class="bol" src="../chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="account-hold.jsp">Hold My Account</a></div>
                            <div class="action-container"><a class="action" href="account-close.jsp">Close My Account</a></div>
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
                    <li><a class="a" href="../clients/home.jsp">Home</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
        
    
  <div class="divers"></div>
        
    <div class="main">
        <div class="main-left">
            
            
            <br><br><div style='margin-left:50px;'><h2>Coming soon.</h2></div>
                
            
            <div class="explanation" hidden>
                <form method="post" action="account-close.jsp">
                <span class="explanation-header">Close My Account Permanently</span>
                <br><br>
                <div><h3>Reason for closing your account</h3></div>
                <input required type="radio" id="gender" name="reason" value="1">I am spending too much time on Chillonline.<br>
                <input required type="radio" id="gender" name="reason" value="2">I am too addicted.<br>
                <input required type="radio" id="gender" name="reason" value="3">Chillonline is currently reducing my self-esteem.<br>
                <input required type="radio" id="gender" name="reason" value="4">I want to spend more time on improving my career.<br>
                <input required type="radio" id="gender" name="reason" value="5">I don't like the people I am connected to.<br>
                <input required type="radio" id="gender" name="reason" value="6">I need my information to be more private.<br>
                <input required type="radio" id="gender" name="reason" value="7">I want to spend more time in the real world.<br><br><br>
                <div><h3>How does this service compare to others in your experience?</h3></div>
                <input required type="radio" id="gender" name="feedback" value="1">Very Poor.<br>
                <input required type="radio" id="gender" name="feedback" value="2">Poor.<br>
                <input required type="radio" id="gender" name="feedback" value="3">Okay.<br>
                <input required type="radio" id="gender" name="feedback" value="4">Good.<br>
                <input required type="radio" id="gender" name="feedback" value="5">Excellent.<br><br><br>
                <div><h3>Security Question 1: What is your favourite movie?</h3></div>
                <div>Answer Key*: <input required type="text" class="names" id="first_name" name="answer1" placeholder="Answer Key"></div>
                <br>
                <div><h3>Security Question 2: What is your favourite television series?</h3></div>
                <div>Answer Key*: <input required type="text" class="names" id="first_name" name="answer2" placeholder="Answer Key"></div>
                <br>
                <div><h3>Security Question 3: What is your favourite song?</h3></div>
                <div>Answer Key*: <input required type="text" class="names" id="first_name" name="answer3" placeholder="Answer Key"></div>
                <br>
                <div><h3>Security Question 4: What is your favourite television channel?</h3></div>
                <div>Answer Key*: <input required type="text" class="names" id="first_name" name="answer4" placeholder="Answer Key"></div>
                <br>
                <div><h3>Security Question 5: What is your favourite game?</h3></div>
                <div>Answer Key*: <input required type="text" class="names" id="first_name" name="answer5" placeholder="Answer Key"></div>
                <br>
                <div><h3>Enter your sign in password to terminate your account.</h3></div>
                <div>Password*: <input required type="password" class="names" id="first_name" name="password" placeholder="Password"></div>
                <br><br>
                
                <button class="button2"><span class="chillonline">Submit</span></button>
                </form>
            </div>
        </div>
        <div class="main-right">
            
            <%
                
                long clientID = 0;
                String password = "";
                String closingReason = "";
                String closingFeedback = "";
                String securityAnswer1 = "";
                String securityAnswer2 = "";
                String securityAnswer3 = "";
                String securityAnswer4 = "";
                String securityAnswer5 = "";
                
                if (request.getParameter("password") != null)
                
                {
                    password = request.getParameter("password");
                }
                
                if (request.getParameter("reason") != null)
                
                {
                    if (request.getParameter("reason").equals("1"))
                
                    {
                        closingReason = "I am spending too much time on Chillonline.";
                    }

                    if (request.getParameter("reason").equals("2"))

                    {
                        closingReason = "I am too addicted.";
                    }

                    if (request.getParameter("reason").equals("3"))

                    {
                        closingReason = "Chillonline is currently reducing my self-esteem.";
                    }
                    
                    if (request.getParameter("reason").equals("4"))

                    {
                        closingReason = "I want to spend more time on improving my career.";
                    }

                    if (request.getParameter("reason").equals("5"))

                    {
                        closingReason = "I don't like the people I am connected to.";
                    }
                    
                    if (request.getParameter("reason").equals("6"))

                    {
                        closingReason = "I need my information to be more private.";
                    }

                    if (request.getParameter("reason").equals("7"))

                    {
                        closingReason = "I want to spend more time in the real world.";
                    }
                }
                
                if (request.getParameter("feedback") != null)
                
                {
                    if (request.getParameter("feedback").equals("1"))

                    {
                        closingFeedback = "Very Poor";
                    }

                    if (request.getParameter("feedback").equals("2"))

                    {
                        closingFeedback = "Poor";
                    }

                    if (request.getParameter("feedback").equals("3"))

                    {
                        closingFeedback = "Okay";
                    }
                    
                    if (request.getParameter("feedback").equals("4"))

                    {
                        closingFeedback = "Good";
                    }

                    if (request.getParameter("feedback").equals("5"))

                    {
                        closingFeedback = "Excellent";
                    }
                }
                
                if (request.getParameter("answer1") != null)
                
                {
                    securityAnswer1 = request.getParameter("answer1");
                }
                
                if (request.getParameter("answer2") != null)
                
                {
                    securityAnswer2 = request.getParameter("answer2");
                }
                
                if (request.getParameter("answer3") != null)
                
                {
                    securityAnswer3 = request.getParameter("answer3");
                }
                
                if (request.getParameter("answer4") != null)
                
                {
                    securityAnswer4 = request.getParameter("answer4");
                }
                
                if (request.getParameter("answer5") != null)
                
                {
                    securityAnswer5 = request.getParameter("answer5");
                }
                
                AccountClose closing = new AccountClose(clientID, password, closingReason, closingFeedback, securityAnswer1, securityAnswer2, securityAnswer3, securityAnswer4, securityAnswer5);
                
                
                
                
                %>
            
        </div>
    </div>
  

  

</body>
</html>
