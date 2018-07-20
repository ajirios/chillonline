<%-- 
    Document   : public
    Created on : 19-Nov-2016, 1:12:08 PM
    Author     : El Jefe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Streaming | Chillonline</title>
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
      height: 500px;
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
      width: 400px;
      margin-left: auto;
      margin-right: auto;
      text-align: center;
  }
  
  .titles
  {
      width: 410px;
      height: 300px;
      margin-top: 20px;
      margin-left: 65px;
  }
  
  .names
  {
    width: 300px;
    height: 30px;
    padding: 4px;
    margin: 5px 100px 5px auto;
    border-radius: 10px;
    font-size: 15px;
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
  
  .announcement
  {
      width: 96%;
      height: 30px;
      color: #FFF;
      font-size: 20px;
      text-align: center;
      background-color: #f50;
      padding-top: 10px;
      padding-left: 20px;
      padding-right: 20px;
      padding-bottom: 10px;
      margin-top: 40px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
  }
  
  .noannouncement
  {
      width: 96%;
      height: 15px;
      color: #FFF;
      font-size: 20px;
      text-align: center;
      background-color: #f50;
      padding-top: 5px;
      padding-left: 2px;
      padding-right: 2px;
      padding-bottom: 5px;
      margin-top: 5px;
      margin-left: auto;
      margin-right: auto;
      margin-bottom: 0px;
  }
  
  .dept-nav
  {
    margin-left: 1%;
    margin-right: 1%;
    background-color: #fff;
  }
  
  .dept-nav-place
  {
      
  }

    .dept-nav ul
  {
    list-style-type: none;
    overflow: auto;
    margin-left: 0px;
    margin-right: 0px;
  }

  .dept-nav ul li
  {
    width: 100%;
    margin-left: 0px;
    margin-right: 0px;
  }

  .dept-nav ul li a:link, .dept-nav ul li a:visited
  {
    display: block;
    background-color: #fff;
    text-align: left;
    padding-top: 7.5px;
    padding-bottom: 7.5px;
    padding-left: auto;
    padding-right: auto;
    margin-left: 0px;
    margin-right: 0px;
    text-decoration: none;
    color: #f40;
    font-family: /*"Josefin Slab", Arial, Helvetica, Pacifico, Rockwell,*/ sans-serif;
    font-size: 16px;
  }

  .dept-nav ul li a:hover, .dept-nav ul li a:active
  {
    color: #f50;
    background-color: #eee;
    opacity: 1.0;
  }
  
  .dept-nav ul li a.current
  {
    color: #fff;
    background-color: #f50;
  }
  
  .checkout-information
  {
      width: 19%;
      height: 3000px;
      background-color: #FFF;
      float: left;
  }
  
  .checkout-content
  {
      width: 60%;
      height: 3000px;
      margin-left: 0.5%;
      margin-right: 0.5%;
      float: left;
  }
  
  .checkout-processor
  {
      width: 19%;
      height: 3000px;
      background-color: #FFF;
      float: left;
  }
  
  .checkout-poster
  {
      width: 94%;
      margin-left: auto;
      margin-right: auto;
  }
  
  .checkout-space
  {
      width: 100%;
      height: 10px;
  }
  
  .cover-poster
  {
      width: 96%;
      box-shadow: 0 1px 4px #777;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 4px;
      padding-top: 4px;
  }
  
  .product-id
  {
      font-size: 19px;
      width: 96%;
      height: 40px;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 2%;
      margin-right: 2%;
  }
  
  .product-description
  {
      font-size: 13px;
      color: #555;
      margin-left: 5%;
      margin-right: 5%;
  }
  
  .episodes
  {
      font-size: 11px;
      color: #555;
      margin-left: 5%;
      margin-right: 5%;
      text-decoration: none;
  }
  
  .episode
  {
      width: 100%;
      height: 200px;
      background-color: #fff;
      margin-bottom: 5px;
  }
  
  .title
  {
      color: #f40;
      font-size: 13px;
      font-weight: bold;
  }
  
  .distributor
  {
      color: #f40;
  }
  
  .views
  {
      color: #f40;
  }
  
  .clickable-text
  {
      text-decoration: none;
  }
  
  .upper-interactions
  {
      width: 100%;
      height: 65px;
      background-color: #fff;
      box-shadow: 0 1px 0px #aaa;
      margin-bottom: 1px;
  }
  
  .lower-interactions
  {
      width: 100%;
      height: 35px;
      background-color: #fff;
      margin-bottom: 10px;
  }
  
  .upper-interactions-left
  {
      width: 68%;
      height: 55px;
      float: left;
      background-color: #fff;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .upper-interactions-right
  {
      width: 28%;
      height: 55px;
      float: left;
      background-color: #fff;
      margin-top: 5px;
      margin-bottom: 5px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .lower-interactions-left
  {
      width: 68%;
      height: 30px;
      float: left;
      background-color: #fff;
      margin-top: 2.5px;
      margin-bottom: 2.5px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .lower-interactions-right
  {
      width: 28%;
      height: 30px;
      float: left;
      background-color: #fff;
      margin-top: 2.5px;
      margin-bottom: 2.5px;
      margin-left: 1%;
      margin-right: 1%;
  }
  
  .content-comments
  {
      width: 100%;
      height: 2500px;
      background-color: #fff;
      margin-top: 10px;
  }
    
  .distributor-logo-area
  {
      float: left;
      width: 50px;
      height: 50px;
      border-radius: 25px;
      background-image: url("../disney.jpg");
      background-size: contain;
  }
  
  .distributor-name-area
  {
      float: left;
      padding: 15px 15px 15px 15px;
      font-size: 24px;
  }
  
  .views2
  {
      float: left;
      padding: 15px 15px 15px 15px;
      font-size: 20px;
  }
  
  .post
  {
      width: 96%;
      height: 300px;
      padding-top: 10px;
      padding-left: 2%;
      padding-right: 2%;
      padding-bottom: 10px;
  }
  
  .commenter-area
  {
      width: 100%;
      height: 100px;
  }
  
  .commenter
  {
      width: 65%;
      height: 100px;
      float: left;
  }
  
  #comment-time
  {
      width: 20%;
      height: 100px;
      float: left;
  }
  
  #commenter-address
  {
      width: 100%;
      height: 50px;
  }
  
  #commenter-name
  {
      width: 100%;
      height: 50px;
  }
  
  #commenter-pic-area
  {
      width: 15%;
      height: 100px;
      float: left;
  }
  
  #commenter-pic
  {
      width: 100px;
      height: 100px;
      border-radius: 50px;
      background: url("clients/imageme2.jpg");
      background-size: contain;
  }
  
  #original-comment-area
  {
      width: 100%;
      height: 150px;
  }
  
  #original-comment
  {
      
  }
  
  .interact-area
  {
      width: 20%;
      height: 50px;
      float: right;
  }
  
  .interact-review-area
  {
      width: 30%;
      height: 50px;
      float: left;
  }
  
  .interactions-area
  {
      width: 100%;
      height: 50px;
  }
  
  .likes
  {
      width: 30%;
      height: 50px;
      float: left;
  }
  
  .replies
  {
      width: 30%;
      height: 50px;
      float: left;
  }
  
  #count-of-likes
  {
      width: 20%;
      height: 50px;
      float: left;
  }
  
  #count-of-replies
  {
      width: 20%;
      height: 50px;
      float: left;
  }
  
  #like-button
  {
      width: 50%;
      height: 50px;
      float: left;
  }
  
  #reply-button
  {
      width: 50%;
      height: 50px;
      float: left;
  }
  
  .store
  {
      width: 99%;
      height: 3000px;
      margin-left: auto;
      margin-right: auto;
      margin-top: 10px;
  }
  
  .subheader
  {
      margin-top: 0;
      height: 34px;
      margin-left: 0;
      margin-right: 0;
      background-color: #f50;
  }
  
  .flexsearch--wrapper {
	height: auto;
	width: auto;
	max-width: 100%;
	overflow: hidden;
	background: transparent;
	margin: 0;
	position: static;
}
	
.flexsearch--form {
	overflow: hidden;
	position: relative;
}
	
.flexsearch--input-wrapper {
	padding: 0 66px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}
.flexsearch--input {
  width: 100%;
}
/***********************
 * Configurable Styles *
 ***********************/
.flexsearch {
  margin: 0 0px 0 10px; /* Padding for other horizontal elements */
  width: 70%;
  float: left;
}
.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 30px;
  padding: 0 46px 0 10px;
	border-color: #f50;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 2px;
  margin-top: 0px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
	font-size: 16px;
	-webkit-appearance: none;
	-moz-appearance: none;
}
	
.flexsearch--submit {
  position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 40px;
	height: 40px;
  padding: 0;
  border: none;
	margin-top: 5px; /* margin-top + border-width */
  margin-right: 5px; /* border-width */
	background: transparent;
  color: #888;
  font-family: 'Helvetica', sans-serif;
  font-size: 40px;
  line-height: 30px;
}
.flexsearch--input:focus {
  outline: none;
  border-color: #333;
}
.flexsearch--input:focus.flexsearch--submit {
 	color: #333; 
}
.flexsearch--submit:hover {
  color: #333;
  cursor: pointer;
}
::-webkit-input-placeholder {
	color: #888;  
}
  .search-button
  {
      height: 30px;
      margin-top: 2px;
      border-bottom-right-radius: 15px;
      border-top-right-radius: 15px;
      border-top: 1px solid #55b506;
   background: #2a4d02;
   background: -webkit-gradient(linear, left top, left bottom, from(#539c00), to(#2a4d02));
   background: -webkit-linear-gradient(top, #539c00, #2a4d02);
   background: -moz-linear-gradient(top, #539c00, #2a4d02);
   background: -ms-linear-gradient(top, #539c00, #2a4d02);
   background: -o-linear-gradient(top, #539c00, #2a4d02);
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 12px;
   font-family: Sans-Serif;
   text-decoration: none;
   vertical-align: middle;
  }
  
  .search-dept
  {
      height: 30px;
      margin-top: 2px;
  }
  
  .skew
  {
      height: 40px;
      width: 70%;
      margin-left: auto;
      margin-right: auto;
  }

  
</style>

<script type="text/javascript">
  

  
</script>

</head>

<body>
  
  <header>
      
    
      <div class="head">
        
          <a href=""><img class="bol" src="../chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li>
                        
                        <a class="a" href="">My Account</a>
                        
                        <div id="my-account">

                            <div class="action-container"><a class="action" href="account-home.jsp">Edit Home</a></div>
                            <div class="action-container"><a class="action" href="account-billing.jsp">Edit Billing Information</a></div>
                            <div class="action-container"><a class="action" href="account-hold.jsp">Hold My Account</a></div>
                            <div class="action-container"><a class="action" href="account-close.jsp">Close My Account</a></div>
                            <div class="action-container"><a class="action" href="../signin.jsp">Log Out</a></div>

                        </div>
                    
                    </li>   
                    <li><a class="a" href="../clients/store.jsp" >Store</a></li>
                    <li><a class="a" href="../clients/carriers.jsp" >Packages</a></li>
                    <li><a class="a" href="../clients/public.jsp" >Streaming</a></li>
                    <li><a class="a" href="../clients/connections.jsp" >Connections</a></li>
                    <li><a class="a" href="../clients/boards.jsp" >Boards</a></li>
                    <li><a class="a" href="../clients/home.jsp">Home</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
      <div class="subheader">
          
          <div class="skew">
          
          <form class="flexsearch--form" action="#" method="post">
          <div class="flexsearch">
		<div class="flexsearch--wrapper">
			
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" placeholder="Search for content">
				</div>
			
			
		</div>
              </div>
          
          
              <select name="department" class="search-dept">
    <option value="all">from All Departments</option>
    <option value="channels">from Channels</option>
    <option value="sounds">from Sounds</option>
    <option value="videos">from Videos</option>
    <option value="movies">from Movies</option>
    <option value="series">from Series</option>
    <option value="music">from Music</option>
    <option value="games">from Games</option>
  </select>
              <input type="submit" value="Search" class="search-button">
                </form>
          
      </div>
      </div>
  </header>
        
        <div class="noannouncement"></div>
    
        <div class="store">
        
        
        
        <div class="checkout-processor">
            
            
            <div class="checkout-space"></div>
            <div class="episodes">
                
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                  
                    <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e17.mp4#t=11" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                  <div class="title">The Suite Life On Deck S2E01 - Double Crossed</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                    </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e10.mp4#t=20" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E02 - Cruisin' for a Bruisin'</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e10.mp4#t=15" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E03 - Mulch Ado About Nothing</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e10.mp4#t=3" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E04 - Splash &  Trash</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e10.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E05 - The Wrong Stuff</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e6.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E06 - Mom and Dad on Deck</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e7.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title"><b>E07</b> -- Shipnotized</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e8.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E08 - When in Rome</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e9.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E09 - Maddie On Deck</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e11.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E10 - The Mommy and the Swami</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e12.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E11 - seaHarmony</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e13.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E12 - Boo You</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e15.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E13 - Flowers and Chocolate</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                </div></a>
                <a class="clickable-text" href="javascript:alert('Hello Chillers!');" ><div class="episode">
                <div class="">
                          <video width="100%" >
                            <source src="../series/content/s2e16.mp4#t=12" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
                    </div>
                    <div class="title">The Suite Life On Deck S2E14 - Sea Monster Mash</div>
                  <div class="distributor">Disney</div>
                  <div class="views">3,112,635 views</div>
                    </div></a>
                
            </div>
            <div class=""></div>
            <div class="checkout-space"></div>
           <!-- <div class="product-description">
                <p>
                    The Suite Life on Deck: Spin-off of the hit Disney Channel series 
                    "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                    Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                    program aboard a ship called the SS Tipton.
                </p>
            </div> -->
            
        </div>
        
        <div class="checkout-content">
            
            <div class=""></div>
            <div class="">
                <video width="100%" autoplay>
                            <source src="../series/content/s2e10.mp4" type="video/mp4">
                            Your browser does not support HTML5 video.
                          </video>
            </div>
            <div class="checkout-space"></div>
            <div class="upper-interactions">
                
                <div class="upper-interactions-left">
                    
                    <div class="distributor-logo-area"> <!-- <img src="disney.jpg" alt="logo" class="" > --> </div>
                    <div class="distributor-name-area"><span>Pirates of the Caribbean 7</span></div>
                    
                </div>
                <div class="upper-interactions-right"><span class="views2">130,000,000 views</span></div>
                
            </div>
            <div class="lower-interactions">
                
                <div class="lower-interactions-left"></div>
                <div class="lower-interactions-right"></div>
                
            </div>
            <div class=""></div>
            <div class="content-comments">
                
                <div class=""><span>COMMENTARIES</span></div>
                <div class="post-comment">
                    
                    <div class=""></div>
                    <div class=""></div>
                    <div class=""></div>
                    
                </div>
                <div class=""></div>
                <div class="post">
                    
                    <div class="commenter-area">
                        
                        <div id="commenter-pic-area"><div id="commenter-pic"></div></div>
                        <div class="commenter">
                            <div id="commenter-name">John Alexander Carrie</div>
                            <div id="commenter-address">Minnesota, United States</div>
                        </div>
                        <div id="comment-time"><span>1hr ago</span></div>
                        
                    </div>
                    <div id="original-comment-area">
                        <span id="original-comment">
                            Watch the Suite Life on Deck: Spin-off of the hit Disney Channel series 
                            "The Suite Life of Zack & Cody," in which twin brothers Zack and 
                            Cody Martin and hotel heiress London Tipton enroll in a semester-at-sea 
                            program aboard a ship called the SS Tipton.
                        </span>
                    </div>
                    <div class="interactions-area">
                        
                        <div class="interact-review-area">
                            
                            <div id="count-of-likes"><span>10</span></div>
                            <div class="likes"><span>likes</span></div>
                            <div id="count-of-replies"><span>3</span></div>
                            <div class="replies"><span>replies</span></div>
                            
                        </div>
                        <div class="interact-area">
                            
                            <div id="like-button"><span>Like</span></div>
                            <div id="reply-button"><span>Reply</span></div>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
                
            </div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            <div class=""></div>
            
        </div>
        
        <div class="checkout-information">
            
            <div class="checkout-space"></div>
            <div class="product-id">
                <span class="definition-style">Pirates of the Caribbean 7</span>
            </div>
            <div class="checkout-space"></div>
            <div class="checkout-poster">
                <img src="../piratesposter.jpg" alt='Cover poster' class="cover-poster">
            </div>
            <div class="checkout-space"></div>
            <div class=""></div>
            <div class=""></div>
            
        </div>
        
    </div>

  

</body>
</html>
