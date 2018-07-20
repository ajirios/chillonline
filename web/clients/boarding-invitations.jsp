<%-- 
    Document   : boarding-invitations
    Created on : 4-Sep-2017, 3:01:53 PM
    Author     : El Jefe
--%>

<%@page import="board.BoardRetrieve"%>
<%@page import="client.ClientRetrieve"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="invitations.mail.InvitationMailSendServlet"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Boarding Invitations | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
    height: 28px;
    padding: 4px;
    margin: 5px auto 5px auto;
    border-radius: 1px;
    border: 0.2px solid #ccc;
    font-size: 12px;
  }
  
  #expiry-month
  {
      width: 94%;
    height: 28px;
    padding: 4px;
    margin: 5px auto 5px auto;
    border-radius: 1px;
    border: 1px solid #777;
    font-size: 12px;
  }
  
  #expiry-year
  {
      width: 94%;
    height: 28px;
    padding: 4px;
    margin: 5px auto 5px auto;
    border-radius: 1px;
    border: 1px solid #777;
    font-size: 12px;
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
      height: 4200px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .main-left
  {
      width: 70%;
      height: 4200px;
      background-color: #FFF;
      float: left;
      border-left: 4px solid #f40; 
  }
  
  .main-right
  {
      width: 29%;
      height: 4200px;
      background-color: #f40;
      float: left;
  }
  
  .explanation
  {
      margin-left: 50px;
      margin-right: 50px;
      margin-top: 70px;
      padding-bottom: 20px;
      height: 4100px;
  }
  
  .explanation-header
  {
      color: #f40;
      font-size: 30px;
  }
  
  #credit-card-display-area
  {
      width: 90%;
      height: 300px;
      margin-top: 40px;
      margin-left: 5%;
      margin-right: 5%;
  }
  
  #credit-card-display
  {
      color: #FFF;
      font-size: 13px;
      height: 30px;
  }
  
  #credit-card-display td
  {
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  
  #logout-button-form
  {
      display: none;
  }
  
  #invitation-mail-send-form table tr td
  {
      height: 70px;
      width: 250px;
      padding-left: 20px;
  }
  
  #invitation-mail-send-form table tr
  {
      height: 70px;
      width: 850px;
      padding-bottom: 30px;
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
        
        long accountNumber = Long.parseLong((String) session.getAttribute("account-number"));
        
        
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

                            <div class="action-container"><a class="action" href="../carriers/terminal.jsp">My Channels</a></div>
                            <div class="action-container"><a class="action" href="../distributors/uploads.jsp">My Distributions</a></div>
                            <div class="action-container"><a class="action" href="account-home.jsp">My Account Settings</a></div>
                            <div class="action-container"><a class="action" href="account-billing.jsp">My Account Billing</a></div>
                            <div class="action-container"><a class="action" href="javascript: submitLogoutForm()">Log Out</a></div>

                        </div>
                    
                    </li>   
                    <li><a class="a" href="../clients/job-boards.jsp" >Job Boards</a></li>
                    <li><a class="a" href="../clients/course-boards.jsp" >Course Boards</a></li>
                    <li><a class="a" href="../clients/leisure-boards.jsp">Leisure Boards</a></li>
                    <li><a class="a" href="../clients/home.jsp">Home</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
        
    
  <div class="divers"></div>
  
  
  
            <%
                
                    long boardID = -1;
                    String hostClientName = null;
                    String senderFirstName = null;
                    String senderClientName = null;
                    String senderGender = null;
                    
                    
                    if (request.getParameter("email-board-id-request") != null)
                    
                    {
                        boardID = Long.parseLong(request.getParameter("email-board-id-request"));
                    }
                    
                    ClientRetrieve client = new ClientRetrieve(accountNumber);
                    senderFirstName = client.getFirstName();
                    senderClientName = client.getClientName();
                    senderGender = client.getGender();
                    
                    BoardRetrieve board = new BoardRetrieve(boardID);
                    hostClientName = board.getCreatorName();
                    
                    if (hostClientName == null)
                    
                    {
                        hostClientName = "Boarding Services";
                    }
                    
                
                %>
                
                
        
    <div class="main">
        <div class="main-left">
            <div class="explanation">
                
                <span class="explanation-header">Invite one or more people to this board</span><br><br><br>
                
                <form id="invitation-mail-send-form" method="post" action="../InvitationMailSendServlet">
                    
                    
                    
                    <input required type="text" class="names" id="sender-client-name" name="sender-client-name" value="<%= senderClientName %>" hidden />
                    <input required type="text" class="names" id="gender" name="gender" value="<%= senderGender %>" hidden />
                    <input required type="text" class="names" id="board-name" name="board-name" value="<%= board.getBoardName() %>" hidden />
                    <input required type="text" class="names" id="host-client-name" name="host-client-name" value="<%= hostClientName %>" hidden />
                    <input required type="text" class="names" id="sender-first-name" name="sender-first-name" value="<%= senderFirstName %>" hidden />
                    <input required type="text" class="names" id="board-count" name="board-count" value="<%= board.getNumberOfMembers() %>" hidden />
                    <input required type="text" class="names" id="access-mode" name="access-mode" value="<%= board.getPublicityMode() %>" hidden />
                    <input required type="text" class="names" id="team-name" name="team-name" value="<%= board.getTeamName() %>" hidden />
                    <input type="text" class="names" id="organization-name" name="organization-name" value="<%= board.getOrganizationName() %>" hidden />
                    <br><br><br><br>
                    
                    
                    
                    <table>
                        
                        <tr>
                            <td><input required class="names" type="text" name="first-name-0" placeholder="Recipient's first name"></td>
                            <td><input required class="names" type="text" name="last-name-0" placeholder="Recipient's last name"></td>
                            <td><input required type="email" class="names" name="email-0" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-1" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-1" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-1" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-2" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-2" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-2" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-3" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-3" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-3" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-4" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-4" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-4" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-5" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-5" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-5" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-6" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-6" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-6" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-7" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-7" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-7" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-8" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-8" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-8" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-9" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-9" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-9" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-10" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-10" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-10" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-11" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-11" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-11" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-12" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-12" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-12" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-13" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-13" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-13" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-14" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-14" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-14" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-15" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-15" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-15" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-16" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-16" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-16" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-17" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-17" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-17" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-18" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-18" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-18" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-19" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-19" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-19" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-20" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-20" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-20" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-21" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-21" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-21" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-22" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-22" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-22" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-23" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-23" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-23" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-24" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-24" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-24" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-25" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-25" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-25" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-26" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-26" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-26" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-27" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-27" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-27" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-28" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-28" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-28" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-29" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-29" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-29" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-30" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-30" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-30" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-31" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-31" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-31" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-32" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-32" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-32" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-33" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-33" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-33" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-34" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-34" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-34" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-35" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-35" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-35" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-36" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-36" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-36" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-37" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-37" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-37" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-38" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-38" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-38" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-39" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-39" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-39" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-40" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-40" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-40" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-41" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-41" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-41" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-42" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-42" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-42" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-43" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-43" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-43" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-44" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-44" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-44" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-45" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-45" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-45" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-46" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-46" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-46" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-47" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-47" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-47" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-48" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-48" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-48" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        <tr>
                            <td><input class="names" type="text" name="first-name-49" placeholder="Recipient's first name"></td>
                            <td><input class="names" type="text" name="last-name-49" placeholder="Recipient's last name"></td>
                            <td><input type="email" class="names" name="email-49" placeholder="Recipient's email address"></td>
                        </tr>
                        
                        
                    </table>
                    <br><br><br><br><br>
                    
                    
                    <input type="submit" class="button2" style="width:100%;" value="Send Invitations"/>
                    
                    
                </form>
                
            </div>
        </div>
        <div class="main-right">
            
            
                <div class="createaccount"><h2>Board Information</h2></div>
                
                <div id="credit-card-display-area">
                    
                    <table>
                        
                        <tr id="credit-card-display">
                            <td>Sender:</td>
                            <td><%= senderClientName %></td>
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Board Name:</td>
                            <td><%= board.getBoardName() %></td>
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Boarding Host:</td>
                                
                            <td><%= hostClientName %></td>
                            
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Board count:</td>
                            <td><%= board.getNumberOfMembers() %> members</td>
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Access mode:</td>
                            <td><%= board.getPublicityMode() %></td>
                        </tr>
                        
                    </table>
                    
                </div>
            
        </div>
    </div>
  

  <div class="divers"></div>
  

</body>
</html>

