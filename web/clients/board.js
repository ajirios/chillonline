/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(document).ready(function() {
    
    $('.chat_head').click(function() {
        
        $('.chat_body').slideToggle('slow');
        
    });
    
    $('.msg_head').click(function() {
        
        $('.msg_wrap').slideToggle('slow');
        
    });
    
    $('.close').click(function() {
        
        $('.msg_box').hide();
        
    });
    
    $('.user').click(function() {
        
        $('.msg_wrap').show();
        $('.msg_box').show();
        
    });
    
    $('textarea').keypress(function(e) {
        
        if (e.keyCode == 13)
            
        {
            
            if ($(this).index() == 0)
                
            {
                var msg = $(this).val();
                $("<div class='msg_b'>" + msg + "</div>").insertBefore('.msg_hidden');
                $('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
                $('textarea').val('');
                
                
                var senderClientID = document.getElementById("sender-client-id").value;
                var recipientClientID = document.getElementById("recipient-client-id").value;
                

                var xml = new XMLHttpRequest();

                  xml.onreadystatechange = function() {

                      if (xml.readyState == 4)
                      
                      {

                          if (xml.status == 200)

                          {
                              
                              var message = xml.responseXML.getElementsByTagName("message")[0].firstChild.nodeValue;
                              //document.getElementById("movie-request-board-post-peppers").innerHTML = numberOfPeppers;

                          }

                      }

                  };

                  var post = "sender-client-id=" + senderClientID + "&recipient-client-id=" + recipientClientID + "&message=" + msg;

                  xml.open("GET", "../MessageServlet?" + post, true);
                  xml.send();

                
            }
            
        }
        
    });
    
});


  


