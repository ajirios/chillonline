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
            
            
        </style>
        
    </head>
    <body>
        
        <div class="screen">
            
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
