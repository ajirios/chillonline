<%-- 
    Document   : distribute
    Created on : 30-Dec-2016, 7:06:45 PM
    Author     : El Jefe
--%>

<%@page import="org.springframework.web.multipart.MultipartFile"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="distribute.*" %>
<%@page import="pegbucket.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Distribute | Chillonline&trade;</title>
<link rel="shortcut icon" type="image/png" href="chilli.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="utf-8" /> 
<meta name="keywords" content="Chillonline, videos, movies, music, TV shows, TV series, TV channels, radio channels, games" />
<meta name="description" content="Distribute your videos, movies, music, TV shows, TV channels, radio channels, and
      games for sale or for free." />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    font-size: 12px;
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
      font-size: 13px;
      color: #fff;
      text-decoration: none;
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
   padding-top: 3px;
   padding-bottom: 3px;
   -webkit-border-radius: 15px;
   -moz-border-radius: 15px;
   border-radius: 15px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: 10px;
   font-family: Sans-Serif;
   text-decoration: none;
   text-align: center;
   vertical-align: middle;
   margin-right: 0px;
   margin-top: 5px;
   width: 150px;
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
    border: 1px solid #ccc;
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
  
  #main
  {
      width: 96%;
      height: 400px;
      margin-left: auto;
      margin-right: auto;
  }
  
  #main-left
  {
      width: 70%;
      height: 400px;
      background-color: #FFF;
      float: left;
      border-left: 4px solid #f40; 
  }
  
  #main-right
  {
      width: 29%;
      height: 400px;
      background-color: #f40;
      float: left;
  }
  
  #explanation
  {
      margin-left: 50px;
      margin-right: 50px;
      padding-top: 50px;
      padding-bottom: 50px;
      height: 400px;
  }
  
  .explanation-header
  {
      color: #f40;
      font-size: 30px;
  }
  
  #page
  {
      color: #f40;
  }
  
  #distribution-meter
  {
      margin: 0 auto 4.5em;
      width: 450px;
      height: 50px;
      display: block;
  }
  
  #step1
  {
      display: block;
  }
  
  #step2
  {
      display: none;
  }
  
  #step3
  {
      display: none;
  }
  
  #step4_movie_free
  {
      display: none;
  }
  
  #step4_music_free
  {
      display: none;
  }
  
  #step4_series_free
  {
      display: none;
  }  
  
  #step4_video_free
  {
      display: none;
  }
  
  #step4_movie_prepaid
  {
      display: none;
  }
  
  #step4_music_prepaid
  {
      display: none;
  }
  
  #step4_series_prepaid
  {
      display: none;
  }  
  
  #step4_video_prepaid
  {
      display: none;
  }
  
  #step5
  {
      display: none;
  }
  
  

  
</style>

<script type="text/javascript">
  

  
</script>

</head>

<body>
    
    
    <script>
        
        
        
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-100415008-1', 'auto');
            ga('send', 'pageview');
            
            

    </script>
    
  
  <header>
      
    
      <div class="head">
        
          <a href="index.jsp"><img class="bol" src="chillon.png" alt="bol"></a>
        
            <nav>
                
                <ul>
                    <li><a class="a" href="signin.jsp" >Sign In</a></li>
                    <li><a class="a" href="index.jsp" >Register</a></li>
                    <li><a class="a" href="giveaways.jsp" >Store Giveaways</a></li>
                    <li><a class="a" href="store.jsp" >Store</a></li>
                    <li><a class="a" href="packages.jsp" >Packages</a></li>
                    <li><a class="a" href="videos/stream.jsp" >Streaming</a></li>
                    <li><a class="a" href="distribute.jsp" id="page" >Distribute</a></li>
                </ul>
                    
            </nav>
        
      </div>
    
  </header>
        
    <div class="divers"></div>
        
    <div id="main">
        <div id="main-left">
            <div id="explanation">
                
                
                <%
                    String fileName = "heythere";
                    Part file = null;
                    PegBucketUpload upload = null;
                    
                    if (request.getParameter("distributor-logo") != null)
                    
                    {
                        fileName = request.getParameter("distributor-logo");
                        file = request.getPart("distributor-logo");
                    }
                    
                    if (file != null)
                    
                    {
                        upload = new PegBucketUpload(fileName, file);
                        System.out.println("File IS NOT NULL!");
                    }
                    
                    System.out.println("Email is " + request.getParameter("email-address"));
                    System.out.println("Street is " + request.getParameter("street-address"));
                    System.out.println("City is " + request.getParameter("city"));
                    System.out.println("Province is " + request.getParameter("province"));
                    System.out.println("Country is " + request.getParameter("country"));
                    System.out.println("File to upload is " + fileName);
                    
                    %>
                    
                    
                
                <div id="step1">
                <form method="post" enctype="multipart/form-data" action="">
                <div class="explanation-header">Step 1 of 5. Choose a multimedia type to distribute.</div>
                <br><br>
                
                <div><h3>Choose the type of multimedia program you want to distribute. *</h3></div>
                <div><input required type="radio" id="program" name="program-type" value="video">Video program</div><br>
                <div><input required type="radio" id="program" name="program-type" value="movie">Movie program</div><br>
                <div><input required type="radio" id="program" name="program-type" value="series">TV show program</div><br>
                <div><input required type="radio" id="program" name="program-type" value="music">Music program</div><br>
                <br><br>
                
                <button class="button2" onclick="saveMultimediaTypeInformation()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                
                </div>
                    
                    
                    
                 
                <div id="step2">
                <form method="post" enctype="multipart/form-data" action="">
                <div class="explanation-header">Step 2 of 5. Choose your preferred payment plan.</div>
                <br><br>
                
                <div><h3>Select your payment mode.</h3></div>
                <div><input type="radio" id="payment-mode" name="payment-mode" value="free" required>Free</div><br>
                <div><input type="radio" id="payment-mode" name="payment-mode" value="paid" required>Pre-paid</div><br>
                <br><br>
                
                <button class="button2" onclick="returnToMultimediaTypeInformation()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="savePaymentModeInformation()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                
                </div>
                    
                    
                
                <div id="step3">
                <form id="step3-form" method="post" action="DistributeServlet">
                <div class="explanation-header">Step 3 of 5. Enter your distributor account information.</div>
                <br><br>
                
                <div><h3>Enter your distributor name and details.</h3></div>
                <div>Distributor Name*: (business name, or sole proprietor name)<br> <input required type="text" class="names" id="first_name" placeholder="Distributor Name"></div><br>
                <div>Representative Name: (if applicable)<br> <input type="text" class="names" id="first_name" placeholder="Representative Name"></div><br>
                <div><h3>Choose your business logo. *</h3></div>
                <div><input required type="file" id="file" name="distributor-logo" ></div><br>
                <div><h3>Enter verification details.</h3></div>
                <div>Email Address*:<br> <input required type="email" class="names" id="email-address" name="email-address" placeholder="Email Address"></div><br>
                <div>Home/Business Street Address*:<br> <input required type="text" class="names" id="street-address" name="street-address" placeholder="Street Address"></div><br>
                <div>City*:<br> <input required type="text" class="names" id="city" name="city" placeholder="City, Town, or County"></div><br>
                <div>State or Province*:<br> <input required type="text" class="names" id="province" name="province" placeholder="State or Province"></div><br>
                <div>Country*:<br> <input required type="text" class="names" id="country" name="country" placeholder="Country"></div><br>
                <div>Postal or Zip Code:<br> <input type="text" class="names" id="postal-code" name="postal-code" placeholder="Postal or Zip Code"></div><br>
                <div>Phone Number*:<br> <input required type="number" class="names" id="phone-number" name="phone-number" placeholder="Phone Number"></div><br>
                <br><br>
                
                <button class="button2" onclick="returnToPaymentModeInformation()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="saveDistributorAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                
                </div>
                    
                <div id="step4_movie_free">
                <form method="post" enctype="multipart/form-data" action="UploadVideoController">
                
                    <span class="explanation-header">Step 4 of 5. Enter your distributor program information.</span>
                <br><br>
                
                <div><h3>Enter the movie title.</h3></div>
                <div>Movie Title*: <br><input required type="text" class="names" id="movie-title" name="movie-title" placeholder="Movie Title"></div><br>
                <div><h3>Choose a genre for your movie.</h3></div>
                <div>Genre*: <br>
                    <select required class="names" name="movie-department">
                    <option value="kids">Kids</option>
                    <option value="action">Action</option>
                    <option value="comedy">Comedy</option>
                    <option value="romance">Romance</option>
                    <option value="horror">Horror</option>
                    <option value="documentary">Documentary</option>
                    <option value="adventure">Adventure</option>
                  </select>
                </div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <br><input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*: <br><input required type="text" class="names" id="production-country" name="production-country" placeholder="Country of Production"></div><br>
                <div><h3>Choose a poster for your movie. *</h3></div>
                <div><input required type="file" id="movie-poster" name="movie-poster" accept="image/.jpg, image/.png, image/.gif"></div><br>
                <div><h3>Do you have a promotional poster for your movie? Choose it here.</h3></div>
                <div><input type="file" id="promo-poster" name="promo-poster" accept="image/.jpg, image/.png, image/.gif"></div><br><br>
                <div><h3>Choose the movie content you want to distribute. *</h3></div>
                <div><input required type="file" id="movie-content" name="movie-content" accept="video/*"></div><br><br>
                <div><h3>Include a movie trailer or teaser. *</h3></div>
                <div><input required type="file" id="movie-teaser" name="movie-teaser" accept="video/.mp4"></div><br><br><br>
                <div>Movie Description*:<br><br> <textarea required rows="10" cols="105" id="movie-description" name="movie-description" placeholder="Enter description..."></textarea></div><br>
                
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-packages" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-package-posters" checked disabled>Allow carriers carrying my content to create package posters using my poster.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="allow-advert" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="register-distributor-account" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                </div>
                
                <div id="step4_movie_prepaid">
                <form method="post" enctype="multipart/form-data" action="">
                
                    <span class="explanation-header">Step 4 of 5. Enter your distributor program information.</span>
                <br><br>
                
                <div><h3>Enter the movie title.</h3></div>
                <div>Movie Title*: <br><input required type="text" class="names" id="movie-title" name="movie-title" placeholder="Movie Title"></div><br>
                <div><h3>Choose a genre for your movie.</h3></div>
                <div>Genre*: <br>
                    <select required class="names" name="movie-department">
                    <option value="kids">Kids</option>
                    <option value="action">Action</option>
                    <option value="comedy">Comedy</option>
                    <option value="romance">Romance</option>
                    <option value="horror">Horror</option>
                    <option value="documentary">Documentary</option>
                    <option value="adventure">Adventure</option>
                  </select>
                </div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <br><input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*: <br><input required type="text" class="names" id="production-country" name="production-country" placeholder="Country of Production"></div><br>
                <div><h3>Choose a poster for your movie. *</h3></div>
                <div><input required type="file" id="movie-poster" name="movie-poster" accept=".jpg, .png, .gif"></div><br>
                <div><h3>Do you have a promotional poster for your movie? Choose it here.</h3></div>
                <div><input type="file" id="promo-poster" name="promo-poster" accept=".jpg, .png, .gif"></div><br><br>
                <div><h3>Choose the movie content you want to distribute. *</h3></div>
                <div><input required type="file" id="movie-content" name="movie-content" accept=".mp3"></div><br><br>
                <div><h3>Include a movie trailer or teaser. *</h3></div>
                <div><input required type="file" id="movie-teaser" name="movie-teaser" accept=".mp3"></div><br><br><br>
                <!--      <div id="distribution-meter-div">
                    <meter id="distribution-meter" min="0" max="100" value="74">Uploading...</meter>
                </div><br> -->
                <div>Movie Description*:<br><br> <textarea required rows="10" cols="105" id="movie-description" name="movie-description" placeholder="Enter description..."></textarea></div><br>
                
                <div><h3>Enter your rental price in USD.</h3></div>
                <div>Total rental charge (USD)*: (Include your 60% returns and our 40% cut.) <input type="text" class="names" id="rental-charge" name="rental-charge" placeholder="Total Rental Charge" ></div><br>
                <div><h3>Enter your purchase price in USD.</h3></div>
                <div>Total purchase charge (USD)*: (Include your 60% returns and our 40% cut.) <input type="text" class="names" id="purchase-charge" name="purchase-charge" placeholder="Total Purchase Charge" ></div><br>
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-packages" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-package-posters" checked disabled>Allow carriers carrying my content to create package posters using my poster.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="allow-advert" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="register-distributor-account" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                </div>
                    
                <div id="step4_video_free">
                <form method="post" enctype="multipart/form-data" action="">
                
                    <span class="explanation-header">Step 4 of 5.</span>
                <span class="explanation-header">Distribute a video program.</span>
                <br><br>
                
                <div><h3>Enter the video title.</h3></div>
                <div>Video Title*: <br><input required type="text" class="names" id="video-title" name="video-title" placeholder="Video Title"></div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <br><input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*:<br><input required type="text" class="names" id="production-company" name="production-company" placeholder="Country of Production"></div><br>
                <div><h3>Choose the video content you want to distribute. *</h3></div>
                <div><input required type="file" id="video-teaser" name="video-teaser" accept="video/*"></div><br><br><br>
                <div>Video Description*:<br><br> <textarea required rows="10" cols="105" id="movie_description" placeholder="Enter description..."></textarea></div><br>
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-package-posters" checked disabled>Allow carriers carrying my content to create package posters using my poster.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                </div>
                
                <div id="step4_video_prepaid">
                <form method="post" enctype="multipart/form-data" action="PegBucketUpload">
                
                    <span class="explanation-header">Step 4 of 5.</span>
                <span class="explanation-header">Distribute a video program.</span>
                <br><br>
                
                <div><h3>Enter the video title.</h3></div>
                <div>Video Title*: <br><input required type="text" class="names" id="video-title" name="video-title" placeholder="Video Title"></div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <br><input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*:<br><input required type="text" class="names" id="production-company" name="production-company" placeholder="Country of Production"></div><br>
                <div><h3>Choose the video content you want to distribute. *</h3></div>
                <div><input required type="file" id="video-content" name="video-content" accept="video/*"></div><br><br><br>
                <div>Video Description*:<br><br> <textarea required rows="10" cols="105" id="movie_description" placeholder="Enter description..."></textarea></div><br>
                <div><h3>Enter your purchase price in USD.</h3></div>
                <div>Total purchase charge (USD)*: (Include your 60% returns and our 40% cut.) <input required type="text" class="names" id="purchase-charge" name="purchase-charge" placeholder="Total Purchase Charge"></div><br>
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-package-posters" checked disabled>Allow carriers carrying my content to create package posters using my poster.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button> &nbsp; &nbsp;
                <button class="button2" ><span class="chillonline">Submit</span></button><br><br><br><br>
                
                </form><br><br><br>
                </div>
                    
                    
                <div id="step4_music_free">
                <form method="post" enctype="multipart/form-data" action="">
                
                    <span class="explanation-header">Step 4 of 5.</span>
                <span class="explanation-header">Distribute a music program.</span>
                <br><br>
                
                <div><h3>Enter the music title.</h3></div>
                <div>Music Title*: <br><input required type="text" class="names" id="music-title" name="music-title" placeholder="Music Title"></div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <br><input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*: <br><input required type="text" class="names" id="production-country" name="production-country" placeholder="Country of Production"></div><br>
                <div><h3>Choose a cover for your music. *</h3></div>
                <div><input required type="file" id="file" name="music_poster" accept=".jpg, .png, .gif"></div><br>
                <div><h3>Do you have a promotional poster for your music? Choose it here.</h3></div>
                <div><input type="file" id="file" name="music_ad_poster" accept=".jpg, .png, .gif"></div><br><br>
                <div><h3>Include a music trailer or teaser. *</h3></div>
                <div><input required type="file" id="file" name="movie_file" accept=".mp3"></div><br><br><br>
                <div id="music-content1"><h3>Add music content to distribute. *</h3></div>
                <div><input required type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div>Music Description*:<br><br> <textarea required rows="10" cols="105" id="music_description" placeholder="Enter description..."></textarea></div><br>
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-package-posters" checked disabled>Allow carriers carrying my content to create package posters using my poster.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-teaser-advertisements" checked>Allow my teasers to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                </div>
                    
                
                <div id="step4_music_prepaid">
                <form method="post" enctype="multipart/form-data" action="">
                
                    <span class="explanation-header">Step 4 of 5.</span>
                <span class="explanation-header">Distribute a music program.</span>
                <br><br>
                
                <div><h3>Enter the music title.</h3></div>
                <div>Music Title*: <br><input required type="text" class="names" id="music-title" name="music-title" placeholder="Music Title"></div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <br><input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*: <br><input required type="text" class="names" id="production-country" name="production-country" placeholder="Country of Production"></div><br>
                <div><h3>Choose a cover for your music. *</h3></div>
                <div><input required type="file" id="file" name="music_poster" accept=".jpg, .png, .gif"></div><br>
                <div><h3>Do you have a promotional poster for your music? Choose it here.</h3></div>
                <div><input type="file" id="file" name="music_ad_poster" accept=".jpg, .png, .gif"></div><br><br>
                <div><h3>Include a music trailer or teaser. *</h3></div>
                <div><input required type="file" id="file" name="movie_file" accept=".mp3"></div><br><br><br>
                <div id="music-content1"><h3>Add music content to distribute. *</h3></div>
                <div><input required type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div id="music-content1"><h3>Add music content to distribute.</h3></div>
                <div><input type="file" id="file" name="music_file" accept=".mp3"></div><br><br>
                <div>Music Description*:<br><br> <textarea required rows="10" cols="105" id="music_description" placeholder="Enter description..."></textarea></div><br>
                <div><h3>Enter your purchase price in USD.</h3></div>
                <div>Total purchase charge (USD)*: (Include your 60% returns and our 40% cut.) <input required type="text" class="names" id="purchase-charge" name="purchase-charge" placeholder="Total Purchase Charge"></div><br>
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-package-posters" checked disabled>Allow carriers carrying my content to create package posters using my poster.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input required type="checkbox" id="gender" name="agreement" value="allow-teaser-advertisements" checked>Allow my teasers to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                </div>
                    
                    
                <div id="step4_series_free">
                <form method="post" enctype="multipart/form-data" action="">
                
                    <span class="explanation-header">Step 4 of 5.</span>
                <span class="explanation-header">Distribute a TV series program.</span>
                <br><br>
                
                <div><h3>Enter the TV show title.</h3></div>
                <div>TV Show Title*: <input required type="text" class="names" id="series-title" name="series-title" placeholder="TV Show Title"></div><br>
                <div><h3>Choose a genre for your TV show.</h3></div>
                <div>Genre*: <br>
                  <select required class="names">
                    <option value="kids">Kids</option>
                    <option value="action">Action</option>
                    <option value="comedy">Comedy</option>
                    <option value="romance">Romance</option>
                    <option value="horror">Horror</option>
                    <option value="documentary">Documentary</option>
                    <option value="adventure">Adventure</option>
                  </select>
                </div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*: <input required type="text" class="names" id="production-company" name="production-company" placeholder="Country of Production"></div><br>
                <div><h3>Choose a poster for your TV show.</h3></div>
                <div><input required type="file" id="movie-poster" name="movie_poster" accept=".jpg, .png, .gif"></div><br>
                <div><h3>Do you have a promotional poster for your TV show? Choose it here.</h3></div>
                <div><input type="file" id="promo-poster" name="promo-poster" accept=".jpg, .png, .gif"></div><br><br>
                <div><h3>Include a TV show trailer or teaser. *</h3></div>
                <div><input required type="file" id="series-teaser" name="series-teaser" accept=".mp3"></div><br><br><br>
                <div>TV Show Description*:<br><br> <textarea required rows="10" cols="105" id="movie_description" placeholder="Enter description..."></textarea></div><br>
                <div><h3>Add a TV show episode to distribute. *</h3></div>
                <div><input required type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute. *</h3></div>
                <div><input required type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                </div>
                    
                
                <div id="step4_series_prepaid">
                <form method="post" enctype="multipart/form-data" action="">
                
                    <span class="explanation-header">Step 4 of 5.</span>
                <span class="explanation-header">Distribute a TV series program.</span>
                <br><br>
                
                <div><h3>Enter the TV show title.</h3></div>
                <div>TV Show Title*: <input required type="text" class="names" id="series-title" name="series-title" placeholder="TV Show Title"></div><br>
                <div><h3>Choose a genre for your TV show.</h3></div>
                <div>Genre*: <br>
                  <select required class="names">
                    <option value="kids">Kids</option>
                    <option value="action">Action</option>
                    <option value="comedy">Comedy</option>
                    <option value="romance">Romance</option>
                    <option value="horror">Horror</option>
                    <option value="documentary">Documentary</option>
                    <option value="adventure">Adventure</option>
                  </select>
                </div><br>
                <div><h3>Enter the production company, if different from the distributor.</h3></div>
                <div>Producer: <input type="text" class="names" id="producer" name="producer" placeholder="Producer"></div><br>
                <div><h3>Enter the country of production.</h3></div>
                <div>Country of Production*: <input required type="text" class="names" id="production-company" name="production-company" placeholder="Country of Production"></div><br>
                <div><h3>Choose a poster for your TV show.</h3></div>
                <div><input required type="file" id="movie-poster" name="movie_poster" accept=".jpg, .png, .gif"></div><br>
                <div><h3>Do you have a promotional poster for your TV show? Choose it here.</h3></div>
                <div><input type="file" id="promo-poster" name="promo-poster" accept=".jpg, .png, .gif"></div><br><br>
                <div><h3>Include a TV show trailer or teaser. *</h3></div>
                <div><input required type="file" id="series-teaser" name="series-teaser" accept=".mp3"></div><br><br><br>
                <div>TV Show Description*:<br><br> <textarea required rows="10" cols="105" id="movie_description" placeholder="Enter description..."></textarea></div><br>
                <div><h3>Add a TV show episode to distribute. *</h3></div>
                <div><input required type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute. *</h3></div>
                <div><input required type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Add a TV show episode to distribute.</h3></div>
                <div><input type="file" id="episode-file" name="episode-file" accept=".mp3"></div><br><br>
                <div><h3>Enter your rental price in USD.</h3></div>
                <div>Total rental charge (USD)*: (Include your 60% returns and our 40% cut.) <input required type="text" class="names" id="rental-charge" name="rental-charge" placeholder="Total Rental Charge"></div><br>
                <div><h3>Enter your purchase price in USD.</h3></div>
                <div>Total purchase charge (USD)*: (Include your 60% returns and our 40% cut.) <input required type="text" class="names" id="purchase-charge" name="purchase-charge" placeholder="Total Purchase Charge"></div><br>
                <div><h3>Customise and accept your Distribution License Agreement.</h3></div>
                <div><p>Please read the <a href="" target="_blank">Distribution License Agreement</a> carefully to make sure that you understand and accept the terms and regulations stated in it.</p></div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked disabled>Allow carriers to create packages that earn me more money.</div><br>
                
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Allow my promotional poster to be advertised on any Chillonline page.</div><br>
                <div><input type="checkbox" id="agreement" name="agreement" value="agree" checked>Create a registered distributor account for my distributor information.</div><br>
                <div><p>Please click the underlying button to agree to your legal document that secures you and your business, and that makes sure that you are complying with the worldwide distribution standards.</p></div>
                <div><input required type="radio" id="agreement" name="agreement" value="agree">I hereby agree that my distributor information is complete and correct, that I have the distribution rights to this content and that
                    by clicking this button, I will be bound by the <a href="" target="_blank">Distribution License Agreement</a>.</div><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorAccountDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="forwardToBankAccountDetails()"><span class="chillonline">Next</span></button><br><br>
                
                </form><br><br><br>
                </div>
                
                
                <div id="step5">
                <form method="post" action="index.jsp">
                
                <span class="explanation-header">Step 5 of 5.</span>
                <span class="explanation-header">Enter your bank account Information.</span>
                <br><br><br>
                
                <div>Bank Name*:<br> <input required type="text" class="names" id="bank-name" name="bank-name" placeholder="Bank Name"></div><br><br>
                <div>Bank Branch Address*:<br> <input required type="text" class="names" id="branch-address" name="branch-address" placeholder="Bank Branch Address"></div><br><br>
                <div>City*:<br> <input required type="text" class="names" id="bank-city" name="bank-city" placeholder="City"></div><br><br>
                <div>State or Province*:<br> <input required type="text" class="names" id="bank-province" name="bank-province" placeholder="State or Province"></div><br><br>
                <div>Postal or Zip Code:<br> <input type="text" class="names" id="bank-postal-code" name="bank-postal-code" placeholder="Postal or Zip Code"></div><br><br>
                <div>Phone Number:<br> <input type="number" class="names" id="bank-phone" name="bank-phone" placeholder="Phone Number"></div><br><br>
                <div>Institution Number*:<br> <input required type="number" class="names" id="institution-number" name="institution-number" placeholder="Institution Number"></div><br><br>
                <div>Branch Transit Number*:<br> <input required type="number" class="names" id="branch-number" name="branch-number" placeholder="Branch Number"></div><br><br>
                <div>Account Number*:<br> <input required type="number" class="names" id="account-number" name="account-number" placeholder="Account Number"></div><br><br>
                <br><br>
                <button class="button2" onclick="returnToDistributorProgramDetails()" ><span class="chillonline">Back</span></button> &nbsp; &nbsp;
                <button class="button2" onclick="saveBankAccountDetails()"><span class="chillonline">Submit</span></button><br><br>
                
                </form><br><br><br>
                </div>
                
                
            </div>
        </div>
        <div id="main-right">
            
            
            
        </div>
    </div>
  
  
    <script type="text/javascript">
    
    
    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var type = "video";
var plan = "prepaid";



function feedToAccount()

{
        document.getElementById("feed-form").submit();
}

function saveMultimediaTypeInformation()

{
   document.getElementById('step1').style.display = "none";
   document.getElementById('step2').style.display = "block";
   document.getElementById('main-left').style.height = "350px";
   document.getElementById('main-right').style.height = "350px";
   document.getElementById('main').style.height = "350px";
   document.getElementById('explanation').style.height = "350px";
}

function returnToMultimediaTypeInformation()

{
   document.getElementById('step2').style.display = "none";
   document.getElementById('step1').style.display = "block";
   document.getElementById('main-left').style.height = "400px";
   document.getElementById('main-right').style.height = "400px";
   document.getElementById('main').style.height = "400px";
   document.getElementById('explanation').style.height = "400px";
}

function savePaymentModeInformation()

{
   document.getElementById('step2').style.display = "none";
   document.getElementById('step3').style.display = "block";
   document.getElementById('main-left').style.height = "1100px";
   document.getElementById('main-right').style.height = "1100px";
   document.getElementById('main').style.height = "1100px";
}

function returnToPaymentModeInformation()

{
   document.getElementById('step3').style.display = "none";
   document.getElementById('step2').style.display = "block";
   document.getElementById('main-left').style.height = "350px";
   document.getElementById('main-right').style.height = "350px";
   document.getElementById('main').style.height = "350px";
   document.getElementById('explanation').style.height = "350px";
}

function saveDistributorAccountDetails() 

{
    
   
        if (type === "video")

        {
            if (plan === "free")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_video_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_video_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
        
        else if (type === "movie")
        
        {
            if (plan === "free")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_movie_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_movie_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
        
        else if (type === "series")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_series_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_series_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
        
        else if (type === "music")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_music_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step3').style.display = "none";
                document.getElementById('step4_music_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
   
   //document.getElementById('step3-form').submit();
   
}

function returnToDistributorAccountDetails() 

{
   
        if (type === "video")

        {
            if (plan === "free")
                
            {
                document.getElementById('step4_video_free').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_video_prepaid').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
        
        else if (type === "movie")
        
        {
            if (plan === "free")
                
            {
                document.getElementById('step4_movie_free').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_movie_prepaid').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
        
        else if (type === "series")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step4_series_free').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_series_prepaid').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
        
        else if (type === "music")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step4_music_free').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_music_prepaid').style.display = "none";
                document.getElementById('step3').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
   
}

function forwardToBankAccountDetails() 

{
   
        if (type === "video")

        {
            if (plan === "free")
                
            {
                document.getElementById('step4_video_free').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_video_prepaid').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
        
        else if (type === "movie")
        
        {
            if (plan === "free")
                
            {
                document.getElementById('step4_movie_free').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_movie_prepaid').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
        
        else if (type === "series")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step4_series_free').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_series_prepaid').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
        
        else if (type === "music")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step4_music_free').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step4_music_prepaid').style.display = "none";
                document.getElementById('step5').style.display = "block";
                document.getElementById('main-left').style.height = "1100px";
                document.getElementById('main-right').style.height = "1100px";
                document.getElementById('main').style.height = "1100px";
            }
            
        }
   
}

function returnToDistributorProgramDetails() 

{
   
        if (type === "video")

        {
            if (plan === "free")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_video_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_video_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
        
        else if (type === "movie")
        
        {
            if (plan === "free")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_movie_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_movie_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
        
        else if (type === "series")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_series_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_series_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
        
        else if (type === "music")
            
        {
            if (plan === "free")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_music_free').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
            else if (plan === "prepaid")
                
            {
                document.getElementById('step5').style.display = "none";
                document.getElementById('step4_music_prepaid').style.display = "block";
                document.getElementById('main-left').style.height = "1900px";
                document.getElementById('main-right').style.height = "1900px";
                document.getElementById('main').style.height = "1900px";
            }
            
        }
   
}

function saveBankAccountDetails() 

{
   //document.getElementById('share-controls-div').style.display = "block";
}




    
    
</script>

  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Distributors</h4>
          <a class="notes" href="distributors/channels/index.jsp"><p>Channels</p></a>
          <a class="notes" href="distributors/sounds/index.jsp"><p>Sounds</p></a>
          <a class="notes" href="distributors/series/index.jsp"><p>Series</p></a>
          <a class="notes" href="distributors/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="distributors/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="distributors/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="distributors/games/index.jsp"><p>Games</p></a>
        </div>
      <div class="footnotes"><h4>Carriers</h4>
          <a class="notes" href="carriers/channels/index.jsp"><p>Channels</p></a>
          <a class="notes" href="carriers/sounds/index.jsp"><p>Sounds</p></a>
          <a class="notes" href="carriers/series/index.jsp"><p>Series</p></a>
          <a class="notes" href="carriers/movies/index.jsp"><p>Movies</p></a>
          <a class="notes" href="carriers/videos/index.jsp"><p>Videos</p></a>
          <a class="notes" href="carriers/music/index.jsp"><p>Music</p></a>
          <a class="notes" href="carriers/games/index.jsp"><p>Games</p></a>
      </div>
      <div class="footnotes"><h4>Legal</h4>
          <a class="notes" href=""><p>Terms of Use</p></a>
          <a class="notes" href=""><p>Privacy Policy</p></a>
          <a class="notes" href=""><p>Cookie Policy</p></a>
          <a class="notes" href=""><p>Warranties</p></a>
          <a class="notes" href=""><p>Licenses</p></a>
      </div>
      <div class="footnotes"><h4>About</h4>
          <a class="notes" href=""><p>Founder</p></a>
          <a class="notes" href=""><p>Investors</p></a>
          <a class="notes" href=""><p>Mission</p></a>
          <a class="notes" href=""><p>Vendors</p></a>
      </div>
      <div class="footnotes"><h4>Contact</h4>
          <a class="notes" href=""><p>Head Office</p></a>
          <a class="notes" href=""><p>Jobs</p></a>
          <a class="notes" href=""><p>Phone</p></a>
          <a class="notes" href=""><p>Email</p></a>
      </div>
        <hr>
        <p>&copy; 2017. Chill Technologies, Inc. All Rights Reserved.</p>
        <p>Developed by @ajirios | Jeffrey Ajiri Osauzo.</p>
    </div>
    
    
  </footer>

</body>
</html>
