<%-- 
    Document   : log
    Created on : 15-Aug-2016, 7:34:43 PM
    Author     : El Jefe
--%>



<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Channels | ChillOnline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<meta charset="utf-8" /> 
<style type="text/css">
  
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
    opacity: 0.7;
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
    background-color: #EEE;
    margin-right: 0;
    margin-top: 0;
    margin-left: 500px;
    height: 500px;
    color: #000;
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
    opacity: 0.7;
    margin-top: -200px;
    font-size: 12px;
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
   border-top-color: #a30a11;
   background: #a30a11;
   }
  
  .rimground
  {
    width: 100px;
    height: 150px;
    opacity: 1.0;
    margin-top: 5px;
    margin-bottom: 5px;
    margin-left: 15px;
    margin-right: 15px;
    float: left;
    text-align: center;
    color: #FFF;
    font-family: sans-serif;
    font-size: 10px;
  }
  
  .rimground:hover, .rimground:active
  {
    width: 92px;
    height: 142px;
    background-color: #555;
    border-radius: 0px;
    border-color: #FFF;
    border-width: 4px;
    border-style: solid;
  }
    
  .bol
  {
      float: left;
      margin-top: 5px;
      margin-left: 0px;
      width: 150px;
  }
  
  #container
  {
      background-color: #fff;
      margin-left: auto;
      margin-right: auto;
      margin-top: 70px;
      width: 1400px;
      height: 1800px;
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
      height: 500px;
      width: 500px;
      background-color: /*#87ceeb*/ #e63;
      float: left;
  }
  
  #epic
  {
      margin-left: 0px;
  }
  
.subheader
  {
      margin-top: 0;
      height: 50px;
      margin-left: 0;
      margin-right: 0;
      background-color: #ccc;
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
  padding: 0 250px 0 250px; /* Padding for other horizontal elements */
}
.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 30px;
  padding: 0 46px 0 10px;
	border-color: #888;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 5px;
  margin-top: 5px;
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
	width: 60px;
	height: 60px;
  padding: 0;
  border: none;
	margin-top: 20px; /* margin-top + border-width */
  margin-right: 5px; /* border-width */
	background: transparent;
  color: #888;
  font-family: 'Helvetica', sans-serif;
  font-size: 40px;
  line-height: 60px;
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
input:-moz-placeholder {
  color: #888
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

.boards {
margin-left: 50px;
margin-top: 20px;
height: 450px;
width: 320px;
padding: 0px 0px 10px 0px;
background-color: #fff;
box-shadow: 0px 2px 5px #aaa;
border-left: 5px solid #e63;
float: left;
}

.call {
font-size: 10px;
color: #bbb;
margin-left: 10px;
}
  
  
</style>

<script type="text/javascript">
  
  
  
</script>

</head>

<body>
  
  <header>
      
    <div class="head">
      
    <a href="../index.jsp"><img class="bol" src="../chillon.png" alt="bol"></a>
        
    
        
            <nav>
                
                <ul>
                    <li><a href="../users/index.jsp" >Portal</a></li>
                    <li><a href="../games/index.jsp">Products</a></li>
                    <li><a href="../sounds/boarding.jsp" >Sounds</a></li>
                    <li><a href="../channels/boarding.jsp" class="current">Channels</a></li>
                </ul>
                    
            </nav>
      
    </div>
      
  </header>
  
  
  <div class="subheader">
      
      <div class="flexsearch">
		<div class="flexsearch--wrapper">
			<form class="flexsearch--form" action="#" method="post">
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" placeholder="Search Channels">
				</div>
				<input class="flexsearch--submit" type="submit" value="&#10140;"/>
			</form>
		</div>
      </div>
  </div>
    
    
    <div class="boards">

<img src="got.jpg" alt="img">

<h4><b>Game of Thrones Bingewatchers 2016</b></h4>

<b class="call">Channel ID: HBO</b><br>

<b class="call">Carrier ID: 5463 4532 7865 9754</b><br>

<b class="call">Organizer: Craigton Bourne</b><br>

<b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Peters, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>

<b class="call">Rating: Mature</b><br>

<b class="call">Native Country: Indonesia</b><br>

<b class="call">Language: Spanish</b><br>

<b class="call">Occupants: 289</b><br>

<b class="call">Spots Left: 11</b><br>

<b class="call">Boarding Price: $0.97/month</b><br>



</div>
<div class="boards">

<img src="got.jpg" alt="img">

<h4><b>Game of Thrones Bingewatchers 2016</b></h4>

<b class="call">Channel ID: HBO</b><br>

<b class="call">Carrier ID: 5463 4532 7865 9754</b><br>

<b class="call">Organizer: Craigton Bourne</b><br>

<b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Peters, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>

<b class="call">Rating: Mature</b><br>

<b class="call">Native Country: Indonesia</b><br>

<b class="call">Language: Spanish</b><br>

<b class="call">Occupants: 289</b><br>

<b class="call">Spots Left: 11</b><br>

<b class="call">Boarding Price: $0.97/month</b><br>



</div>
<div class="boards">

<img src="got.jpg" alt="img">

<h4><b>Game of Thrones Bingewatchers 2016</b></h4>

<b class="call">Channel ID: HBO</b><br>

<b class="call">Carrier ID: 5463 4532 7865 9754</b><br>

<b class="call">Organizer: Craigton Bourne</b><br>

<b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Peters, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>

<b class="call">Rating: Mature</b><br>

<b class="call">Native Country: Indonesia</b><br>

<b class="call">Language: Spanish</b><br>

<b class="call">Occupants: 289</b><br>

<b class="call">Spots Left: 11</b><br>

<b class="call">Boarding Price: $0.97/month</b><br>



</div>
<div class="boards">

<img src="got.jpg" alt="img">

<h4><b>Game of Thrones Bingewatchers 2016</b></h4>

<b class="call">Channel ID: HBO</b><br>

<b class="call">Carrier ID: 5463 4532 7865 9754</b><br>

<b class="call">Organizer: Craigton Bourne</b><br>

<b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Peters, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>

<b class="call">Rating: Mature</b><br>

<b class="call">Native Country: Indonesia</b><br>

<b class="call">Language: Spanish</b><br>

<b class="call">Occupants: 289</b><br>

<b class="call">Spots Left: 11</b><br>

<b class="call">Boarding Price: $0.97/month</b><br>



</div>
    <div class="boards">

<img src="got.jpg" alt="img">

<h4><b>Game of Thrones Bingewatchers 2016</b></h4>

<b class="call">Channel ID: HBO</b><br>

<b class="call">Carrier ID: 5463 4532 7865 9754</b><br>

<b class="call">Organizer: Craigton Bourne</b><br>

<b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Peters, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>

<b class="call">Rating: Mature</b><br>

<b class="call">Native Country: Indonesia</b><br>

<b class="call">Language: Spanish</b><br>

<b class="call">Occupants: 289</b><br>

<b class="call">Spots Left: 11</b><br>

<b class="call">Boarding Price: $0.97/month</b><br>



</div>
    <div class="boards">

<img src="got.jpg" alt="img">


<h4><b>Game of Thrones Bingewatchers 2016</b></h4>

<b class="call">Channel ID: HBO</b><br>

<b class="call">Carrier ID: 5463 4532 7865 9754</b><br>

<b class="call">Organizer: Craigton Bourne</b><br>

<b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Peters, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>

<b class="call">Rating: Mature</b><br>

<b class="call">Native Country: Indonesia</b><br>

<b class="call">Language: Spanish</b><br>

<b class="call">Occupants: 289</b><br>

<b class="call">Spots Left: 11</b><br>

<b class="call">Boarding Price: $0.97/month</b><br>



</div>
      
  
  <img src="../minion.png" alt="minion" id="minion">
  
  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Users</h4>
          <a class="notes" href=""><p>Channels</p></a>
          <a class="notes" href=""><p>Series</p></a>
          <a class="notes" href=""><p>Movies</p></a>
          <a class="notes" href=""><p>Videos</p></a>
          <a class="notes" href=""><p>Music</p></a>
          <a class="notes" href=""><p>Games</p></a>
        </div>
      <div class="footnotes"><h4>Distributors</h4>
          <a class="notes" href=""><p>Channels</p></a>
          <a class="notes" href=""><p>Series</p></a>
          <a class="notes" href=""><p>Movies</p></a>
          <a class="notes" href=""><p>Videos</p></a>
          <a class="notes" href=""><p>Music</p></a>
          <a class="notes" href=""><p>Games</p></a>
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
        <p>&copy; 2016 Chill Technologies Inc. All Rights Reserved.</p></div>
    
    
  </footer>

</body>
</html>

