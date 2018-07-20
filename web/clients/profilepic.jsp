<%-- 
    Document   : profilepic
    Created on : 22-May-2016, 3:21:05 PM
    Author     : El Jefe
--%>

<%@page import="account.AccountRetrieve"%>
<%@page import="board.client.BoardClientList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">


    #client
    {
        margin: 0 0;
        height: 60px;
        width: 100%;
        background-color: #fff;
        padding: 0;
    }

    #boarder-name
    {
        height: 12px;
        width: 110px;
        font-size: 12px;
        font-weight: normal;
        color: #000;
        padding-top: 24px;
        padding-bottom: 24px;
        padding-left: 10px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }
  
  #boarder-name:after
  {
      content: "";
      position: absolute;
      background: #2ecc71;
      width: 10px;
      height: 10px;
      border-radius: 5px;
      left: 55px;
      float: right;
  }
  
  #client:hover
  {
      background: #F8F8F8;
  }

    body
    {
        background-color: #fff;
        font-family: sans-serif;
        margin: 0 0;
    }

    html 
    {
        overflow: scroll;
        overflow-x: hidden;
        height: 100%;
    }

    ::-webkit-scrollbar 
    {
        width: 6px;  /* remove scrollbar space */
      /*  background: transparent;  /* optional: just make scrollbar invisible */
    }
    /* optional: show position indicator in red */

    ::-webkit-scrollbar-thumb 
    {
        background: #777;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        border-bottom-left-radius: 3px;
        border-bottom-right-radius: 3px;
    }
    
    #circle-holder
    {
        width: 50px;
        height: 50px;
        padding-top: 5px;
        padding-bottom: 5px;
        padding-left: 5px;
        padding-right: 5px;
        float: left;
    }

    .circular 
    {
        width: 40px;
        height: 40px;
        border-radius: 23px;
        -webkit-border-radius: 23px;
        -moz-border-radius: 23px;
        background: url(../male.jpg) no-repeat;
        background-size: contain;
    }
    
    .circular img 
    {
        width: 40px;
        height: 40px;
        border-radius: 23px;
        -webkit-border-radius: 23px;
        -moz-border-radius: 23px;
        background-size: contain;
    }
    
    .clickable-text
    {
        text-decoration: none;
    }
    
    #border-name-style
    {
        text-decoration: none;
    }
    
    
    

</style>

</head>

<body>

<script type="text/javascript">
    
    
    function getBoardIDFromParent()
    {
        var boardID = window.parent.document.getElementById("board-id-span").value;
        document.getElementById("board-id-request").value = boardID;
        document.forms["board-id-request-form"].submit();
    }
    
    function submitConnectionIDRequestForm(accountNumber)
        
    {
        document.getElementById("connection-id-request").value = accountNumber;
        document.forms["connection-id-request-form"].submit(); 
    }
    
    function openClientMessageBox(recipientClientID, recipientClientName)
    
    {
        window.parent.document.getElementById("recipient-client-id").value = recipientClientID;
        window.parent.document.getElementById("recipient-client-name").innerHTML = recipientClientName;
        window.parent.document.getElementById("msg_box").style.display = "block";
        
        
        var senderClientID = window.parent.document.getElementById("sender-client-id").value;
        
        var msgContentDiv = window.parent.document.getElementById("msg_body_content");
        var clearDiv = window.parent.document.createElement("div");
        clearDiv.setAttribute("id", "msg_body_content");
        msgContentDiv.parentNode.replaceChild(clearDiv, msgContentDiv);
        
        
        var xml = new XMLHttpRequest();

          xml.onreadystatechange = function() {

              if (xml.readyState == 4)

              {

                  if (xml.status == 200)

                  {
                      var count = 0;
                      
                      //call message content div again
                      msgContentDiv = window.parent.document.getElementById("msg_body_content");
                      
                      var messages = xml.responseXML.getElementsByTagName("Messages")[0];
                      messages = messages.getElementsByTagName("Message");
                      
                      
                      for (count = 0; count < messages.length; count++)
                          
                        {
                            var message = messages[count];
                            var text = message.getElementsByTagName("Text")[0].firstChild.nodeValue;
                            var senderID = message.getElementsByTagName("Sender")[0].firstChild.nodeValue;
                            var timestamp = message.getElementsByTagName("Timestamp")[0].firstChild.nodeValue;
                            
                            var msgDiv = window.parent.document.createElement("div");
                            
                            if (senderClientID === senderID)
                            
                            {
                                msgDiv.setAttribute("class", "msg_b");
                                var msgbText = window.parent.document.createTextNode(text);
                                msgDiv.appendChild(msgbText);
                            }
                            
                            else if (recipientClientID === senderID)
                            
                            {
                                msgDiv.setAttribute("class", "msg_a");
                                var msgaText = window.parent.document.createTextNode(text);
                                msgDiv.appendChild(msgaText);
                            }
                            
                            else
                            
                            {
                                msgDiv.setAttribute("class", "msg_a");
                                var msgaText = window.parent.document.createTextNode(text);
                                msgDiv.appendChild(msgaText);
                            }
                            
                            
                            
                            msgContentDiv.appendChild(msgDiv);
                            
                        }
                        
                        msgContentDiv.parentNode.replaceChild(msgContentDiv, msgContentDiv);
                      
                  }

              }

          };

          var post = "sender-client-id=" + senderClientID + "&recipient-client-id=" + recipientClientID;

          xml.open("GET", "../MessageListServlet?" + post, true);
          xml.send();
          
          
    }
    
    
    
    
    
    
</script>
        
                
    
    
    
    <%
        long boardID;
        
        if (request.getParameter("board-id-request") != null)
        
        {
            boardID = Long.parseLong(request.getParameter("board-id-request"));
        }
        
        else
            
        {
            boardID = -1;
        }
        
        %>
                    
        
                
                <form hidden id="board-id-request-form" method="post" action="profilepic.jsp">
                    
                    <input type="text" id="board-id-request" name="board-id-request" />
                    <input type="submit" />
                    
                </form>
                
                
                
                <form hidden id="connection-id-request-form" method="post" target="_parent" action="connections.jsp">
                    
                    <input type="text" id="connection-id-request" name="connection-id-request" />
                    <input type="submit" />
                    
                </form>
        
        
                
                <%
                    
                    if (boardID == -1)
                    
                    {
                    
                    %>
        
                <iframe hidden src="" onload="getBoardIDFromParent()"></iframe>
                
                <%
                    
                    }
                    
                    else
                    
                    {
                    
                    %>
    
    
    
    <%
        AccountRetrieve account = null;
        long clientAccountNumber = -1;
        BoardClientList boardClients = new BoardClientList(boardID);
        int count = 0;
        
        for (count = boardClients.getLeftWingStart(); count <= boardClients.getLeftWingEnd(); count++)
        
        {
            
            account = new AccountRetrieve(boardClients.getBoardClient(count).getClientID() ,"client");
            clientAccountNumber = account.getAccountNumberByClientID();
            
        %>
    
            <div id="client">
                
                <%
                    
                    if (boardClients.getBoardClient(count).getProfilePicture() != null)
                    
                    {
                    
                    %>
                
                <div id="circle-holder">
                    
                    <a class="clickable-text" href="javascript:submitConnectionIDRequestForm(<%= clientAccountNumber %>);" >
                        
                        <div class="circular">
                            
                            <img src="<%= boardClients.getBoardClient(count).getProfilePicture() %>" alt="profile" />
                            
                        </div>
                        
                    </a>
                    
                </div>
                
                <%
                    
                    }
                    
                    else
                    
                    {
                    
                    %>
                
                <div id="circle-holder">
                    
                    <a class="clickable-text" href="javascript:submitConnectionIDRequestForm(<%= clientAccountNumber %>);" >
                        
                        <div class="circular">
                            
                            <img src="../male.jpg" alt="profile" />
                            
                        </div>
                        
                    </a>
                    
                </div>
                
                <%
                    
                    }
                    
                    %>
                    
                    
                
                    <a id="border-name-style" href="javascript:openClientMessageBox(<%= boardClients.getBoardClient(count).getClientID() %>, '<%= boardClients.getBoardClient(count).getClientName() %>');">
                        <div id="boarder-name"><span><%= boardClients.getBoardClient(count).getClientName() %></span></div>
                    </a>
                
                    
                
            </div>
    
    <%
        }
        
    }
        
        %>
            

</body>

</html>
