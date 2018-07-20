<%-- 
    Document   : users
    Created on : 22-May-2016, 3:32:07 PM
    Author     : El Jefe
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style type="text/css">
            
              
  header
  {
    background-color: #FFF;
    background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#bababa));
   background: -webkit-linear-gradient(top, #ffffff, #bababa);
   background: -moz-linear-gradient(top, #ffffff, #bababa);
   background: -ms-linear-gradient(top, #ffffff, #bababa);
   background: -o-linear-gradient(top, #ffffff, #bababa);
    margin-left: 0;
    margin-right: 0;
    margin-top: 0;
    height: 50px;
    color: #000;
    opacity: 0.7;
    box-shadow: 0px 2px 5px #AAA;
    text-indent: 30px;
  }
  
  .screen
  {
      margin: 25px auto 25px auto;
                width: 700px;
                height: 350px;
                background-color: #000;
                float: none;
                padding: 20px 20px 20px 20px;
                box-shadow: 0px 5px 6px #999;
  }
  
  .post-field
            {
                margin: 25px auto 25px auto;
                width: 700px;
                height: 250px;
                background-color: #fff;
                float: none;
                padding: 20px 20px 20px 20px;
                box-shadow: 0px 2px 5px #AAA;
                
            }
            
            .argument-field
            {
                margin: 5px 5px 5px 5px;
                width: 690px;
                height: 90px;
                text-align: left;
                
                
            }
            
            .spectator-field
            {
                margin: 5px 5px 5px 5px;
                width: 690px;
                height: 90px;
                
            }
            
            .comments
            {
                width: 200px;
                height: 90px;
                font-size: 12px;
                color: #e63;
                float: left;
            }
            
            .likes
            {
                width: 200px;
                height: 90px;
                font-size: 12px;
                color: #e63;
                float: left;
            }
            
            .dislikes
            {
                width: 200px;
                height: 90px;
                font-size: 12px;
                color: #e63;
                float: left;
            }
            
            .timestamp
            {
                color: #AAA;
                font-size: 12px;
                
            }
            
            .arguer h4 a
            {
                color: #e63;
                text-decoration: none;
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
    height: 2000px;
  }
  
     .logos
  {
      background-color: #333;
      margin-left: 0px;
      margin-right: 0px;
      height: 2000px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 0.8;
      margin-top: -980px;
  }
  
  #logos
  {
      height: 70%;
      opacity: 1.0;
  }
  
  .rimground
  {
    width: 96px;
    height: 100px;
    opacity: 1.0;
    margin-top: 5px;
    margin-bottom: 15px;
    margin-left: 5px;
    margin-right: 5px;
    float: left;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: 10px;
  }
            
            
            
        </style>
        
    </head>
    <body>
        
        <div class="screen">
            <a href="2-0000-0038/index.jsp"><div class="rimground"><img src="2-0000-0038/lessthanperfect.jpg" alt="duckhunt2" id="logos">
      <p>Less Than Perfect</p><p>$23.99</p></div></a>    
  <a href="2-0000-0000/index.jsp"><div class="rimground"><img src="2-0000-0000/aimhigh.jpg" alt="aimhigh" id="logos">
      <p>Aim High</p><p>$3.99</p></div></a>
  <a href="2-0000-0001/index.jsp"><div class="rimground"><img src="2-0000-0001/avengers.jpg" alt="avengers" id="logos">
      <p>Avengers</p><p>$3.99</p></div></a>
  <a href="2-0000-0002/index.jsp"><div class="rimground"><img src="2-0000-0002/battlestargalactica.jpg" alt="battlestargalactica" id="logos">
      <p>Battlestar Galactica</p><p>$3.99</p></div></a>
  <a href="2-0000-0003/index.jsp"><div class="rimground"><img src="2-0000-0003/birthofabeauty.jpg" alt="birthofabeauty" id="logos">
      <p>Birth of a Beauty</p><p>$3.99</p></div></a>
  <a href="2-0000-0004/index.jsp"><div class="rimground"><img src="2-0000-0004/boysoverflowers.jpg" alt="boysoverflowers" id="logos">
      <p>Boys Over Flowers</p><p>$3.99</p></div></a>
  <a href="2-0000-0005/index.jsp"><div class="rimground"><img src="2-0000-0005/cheerup.jpg" alt="cheerup" id="logos">
      <p>Cheer Up!</p><p>$3.99</p></div></a>
  <a href="2-0000-0006/index.jsp"><div class="rimground"><img src="2-0000-0006/chuck.jpg" alt="splash" id="logos">
      <p>Chuck</p><p>Season 1</p><p>$3.99</p></div></a>
  <a href="2-0000-0008/index.jsp"><div class="rimground"><img src="2-0000-0008/chuck2.jpg" alt="splash" id="logos">
      <p>Chuck</p><p>Season 2</p><p>$3.99</p></div></a>
  <a href="2-0000-0009/index.jsp"><div class="rimground"><img src="2-0000-0009/deepbreath.jpg" alt="signals" id="logos">
      <p>Deep Breath</p><p>$3.99</p></div></a>
  <a href="2-0000-0010/index.jsp"><div class="rimground"><img src="2-0000-0010/dhousewife.jpg" alt="sweep" id="logos">
      <p>Desperate Housewives</p><p>$3.99</p></div></a>
  <a href="2-0000-0011/index.jsp"><div class="rimground"><img src="2-0000-0011/dusktilldawn.jpg" alt="think" id="logos">
      <p>Dusk Till Dawn</p><p>$3.99</p></div></a>
  <a href="2-0000-0012/index.jsp"><div class="rimground"><img src="2-0000-0012/empire.jpg" alt="tourism" id="logos">
      <p>Empire</p><p>$3.99</p></div></a>
  <a href="2-0000-0013/index.jsp"><div class="rimground"><img src="2-0000-0013/fangoria.png" alt="tourism" id="logos">
      <p>Fangoria</p><p>$3.99</p></div></a>
  <a href="2-0000-0014/index.jsp"><div class="rimground"><img src="2-0000-0014/fantastic4.jpg" alt="travels" id="logos">
      <p>Fantastic 4</p><p>$3.99</p></div></a>
  <a href="2-0000-0015/index.jsp"><div class="rimground"><img src="2-0000-0015/gameofthrones.jpg" alt="turbine" id="logos">
      <p>Game of Thrones</p><p>Season 6</p><p>$3.99</p></div></a>
        </div>
        
        <%
            for (int i = 0; i < 10; i++)
                
            {
        %>
        
        
        
        
        <div class="post-field">
            
            <div class="arguer"><h4><a href="">Maria Velasquez de Avila</a></h4>
                
                <div class="timestamp">Mar 20, 2016 3:56PM</div><br>
                <div class="timestamp">Santiago, Chile</div>
                    
            </div>
            
            <div class="argument-field">
                
                
                <p>Sincerely, I don't know why Richard and Kahlan can't be together. They're like the best couple in TV history. Cara and Richard are good too but
                OMG Richard are Kahlan are the bomb! I remember the scene when she staked her life for Richard to get him out of the valley of perdition. I was sooo proud
                of her...</p>
                
            </div>
            
            <div class="spectator-field">
                
                <div class="likes">Heat</div>
                <div class="comments">Comments</div>
                
                
            </div>
            
            
        </div>
        
        <%
            }
        %>
        
  
    </body>
</html>
