<%-- 
    Document   : account-billing
    Created on : 31-Oct-2016, 2:46:13 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="creditcard.*" %>
<%@page import="client.AccountBilling" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>My Account Billing | Chillonline</title>
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
    border: 1px solid #777;
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
      height: 700px;
      margin-left: auto;
      margin-right: auto;
  }
  
  .main-left
  {
      width: 70%;
      height: 700px;
      background-color: #FFF;
      float: left;
      border-left: 4px solid #f40; 
  }
  
  .main-right
  {
      width: 29%;
      height: 700px;
      background-color: #f40;
      float: left;
  }
  
  .explanation
  {
      margin-left: 50px;
      margin-right: 50px;
      padding-top: 50px;
      padding-bottom: 20px;
      height: 700px;
  }
  
  .explanation-header
  {
      color: #f40;
      font-size: 30px;
  }
  
  #credit-card-display-area
  {
      width: 90%;
      height: 500px;
      margin-top: 40px;
      margin-left: 5%;
      margin-right: 5%;
  }
  
  #credit-card-display
  {
      color: #FFF;
      font-size: 13px;
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
            <div class="explanation">
                
                <span class="explanation-header">My Account Billing Information</span><br><br><br>
                
                <form method="post" action="account-billing.jsp">
                    
                    <div>
                    <i class="fa fa-cc-visa" style="font-size:36px"></i> &nbsp; 
                    <label for="visa">VISA</label>
                    <input required type="radio" id="visa" name="payment-type" value="visa">
                    &nbsp; &nbsp; &nbsp; &nbsp;
                    <i class="fa fa-cc-mastercard" style="font-size:36px"></i> &nbsp; 
                    <label for="mastercard">MasterCard</label>
                    <input required type="radio" id="mastercard" name="payment-type" value="mastercard"></div><br><br>
                    <div>Name On Card*: <input required type="text" class="names" id="first_name" name="credit-card-name" placeholder="Name On Card"></div><br>
                    <div>Credit Card Number*: <input required class="names" id="first_name" type="text" name="credit-card-number"  pattern="{16}" placeholder="XXXX XXXX XXXX XXXX"></div><br>
                    <div>Expiry Month*: 
                        
                        <select required id="expiry-month" name="expiry-month">
                            <option value="">Select month</option>
                            <option value="1">01</option>
                            <option value="2">02</option>
                            <option value="3">03</option>
                            <option value="4">04</option>
                            <option value="5">05</option>
                            <option value="6">06</option>
                            <option value="7">07</option>
                            <option value="8">08</option>
                            <option value="9">09</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                        </select>
                        
                    </div><br>
                    <div>Expiry Year*: 
                        
                        <select required id="expiry-year" name="expiry-year">
                            <option value="">Select year</option>
                            <option value="2017">2017</option>
                            <option value="2018">2018</option>
                            <option value="2019">2019</option>
                            <option value="2020">2020</option>
                            <option value="2021">2021</option>
                            <option value="2022">2022</option>
                            <option value="2023">2023</option>
                            <option value="2024">2024</option>
                            <option value="2025">2025</option>
                            <option value="2026">2026</option>
                            <option value="2027">2027</option>
                            <option value="2028">2028</option>
                            <option value="2029">2029</option>
                            <option value="2030">2030</option>
                            <option value="2031">2031</option>
                            <option value="2032">2032</option>
                            <option value="2033">2033</option>
                            <option value="2034">2034</option>
                            <option value="2035">2035</option>
                            <option value="2036">2036</option>
                            <option value="2037">2037</option>
                            <option value="2038">2038</option>
                            <option value="2039">2039</option>
                            <option value="2040">2040</option>
                        </select>
                        
                    </div><br>
                    <div>Credit Card Verification Number*: <input required class="names" id="first_name" type="text" name="ccv" pattern="{3}" placeholder="CCV"></div>
                    <br>

                    <button class="button2">Submit</button>

                </form>
                
            </div>
        </div>
        <div class="main-right">
            
            <%
                
                String paymentType = "";
                String creditCardNumber = "";
                String nameOnCard = "";
                int expiryMonth = 0;
                int expiryYear = 0;
                String ccv = "";
                String ccnDisplay = "";
                String ccvDisplay = "";
                

                if (request.getParameter("payment-type") != null)
                
                {
                    
                    if (request.getParameter("payment-type").equalsIgnoreCase("visa"))
                        
                    {
                        paymentType = "VISA";
                    }
                    
                    if (request.getParameter("payment-type").equalsIgnoreCase("mastercard"))
                        
                    {
                        paymentType = "MasterCard";
                    }
                    
                }
                
                if (request.getParameter("credit-card-name") != null)
                
                {
                    nameOnCard = request.getParameter("credit-card-name");
                }
                
                if (request.getParameter("credit-card-number") != null)
                
                {
                    creditCardNumber = request.getParameter("credit-card-number");
                }
                
                if (request.getParameter("expiry-month") != null)
                
                {
                    expiryMonth = Integer.parseInt(request.getParameter("expiry-month"));
                }
                
                if (request.getParameter("expiry-year") != null)
                
                {
                    expiryYear = Integer.parseInt(request.getParameter("expiry-year"));
                }
                
                if (request.getParameter("ccv") != null)
                
                {
                    ccv = request.getParameter("ccv");
                }
                

                
                %>
                
                
                
                <%
                
                    
                CreditCardSearch creditCardSearch = new CreditCardSearch(accountNumber);
                boolean exists = creditCardSearch.search();
                
                if (exists == false)
                
                {
                    
                    if ((!creditCardNumber.equals("")) && (expiryMonth != 0) && (expiryYear != 0) && (!ccv.equals("")))
                        
                    {
                        CreditCardCreate create = new CreditCardCreate(accountNumber, creditCardNumber, expiryMonth, expiryYear, ccv, nameOnCard, paymentType);
                        CreditCardRetrieve retrieve = new CreditCardRetrieve(accountNumber);
                        
                        paymentType = retrieve.getPaymentType();
                        nameOnCard = retrieve.getCreditCardName();
                        creditCardNumber = retrieve.getCreditCardNumber();
                        expiryMonth = retrieve.getExpiryMonth();
                        expiryYear = retrieve.getExpiryYear();
                        ccv = retrieve.getCcv();
                        
                        ccnDisplay = "XXXX XXXX XXXX XX" + creditCardNumber.substring(14);
                        ccvDisplay = "XX" + ccv.substring(2);
                    }
                    
                }
                
                else
                    
                {
                    
                    if ((!creditCardNumber.equals("")) && (expiryMonth != 0) && (expiryYear != 0) && (!ccv.equals("")))
                        
                    {
                        CreditCardUpdate update = new CreditCardUpdate(accountNumber);
                        
                        update.setPaymentType(paymentType);
                        update.setCreditCardName(nameOnCard);
                        update.setCreditCardNumber(creditCardNumber);
                        update.setExpiryMonth(expiryMonth);
                        update.setExpiryYear(expiryYear);
                        update.setCcv(ccv);
                        
                        ccnDisplay = "XXXX XXXX XXXX XX" + creditCardNumber.substring(14);
                        ccvDisplay = "XX" + ccv.substring(2);
                    }
                    
                    else
                        
                    {
                        CreditCardRetrieve retrieve = new CreditCardRetrieve(accountNumber);
                        
                        paymentType = retrieve.getPaymentType();
                        nameOnCard = retrieve.getCreditCardName();
                        creditCardNumber = retrieve.getCreditCardNumber();
                        expiryMonth = retrieve.getExpiryMonth();
                        expiryYear = retrieve.getExpiryYear();
                        ccv = retrieve.getCcv();
                        
                        ccnDisplay = "XXXX XXXX XXXX XX" + creditCardNumber.substring(14);
                        ccvDisplay = "XX" + ccv.substring(2);
                    }
                    
                }

                
                %>
            
                <div class="createaccount"><h2>Credit Card Information</h2></div>
                
                <div id="credit-card-display-area">
                    
                    <table>
                        
                        <tr id="credit-card-display">
                            <td>Credit Card Holder Name:</td>
                            <td><%= nameOnCard %></td>
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Credit Card Type:</td>
                            <td><%= paymentType %></td>
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Credit Card Number:</td>
                            <td><%= ccnDisplay %></td>
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Expiry Date:</td>
                            
                            <%
                                if (expiryMonth != 0 && expiryYear != 0)
                                
                                {
                                
                                %>
                            
                            <td><%= expiryMonth %>, <%= expiryYear %></td>
                            
                            <%
                                }
                                
                                else
                                
                                {
                                
                                %>
                            
                            <td></td>
                            
                            <%
                                }
                                
                                %>
                            
                        </tr>
                        
                        <tr id="credit-card-display">
                            <td>Credit Card Verification:</td>
                            <td><%= ccvDisplay %></td>
                        </tr>
                        
                    </table>
                    
                </div>
            
        </div>
    </div>
  

  

</body>
</html>
