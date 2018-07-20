<%-- 
    Document   : log
    Created on : 15-Aug-2016, 7:43:09 PM
    Author     : El Jefe
--%>



<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Sounds | ChillOnline</title>
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
      height: 2000px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 0.8;
      width: 80%;
      margin-top: -390px;
      float: right;
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
    color: #e63;
    font-family: sans-serif;
    font-size: 10px;
  }
  
  .stations
  {
      color: #e63;
      height: 150px;
      margin-top: 10px;
      margin-left: 0;
      margin-right: 0;
      background-color: #eee;
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
      margin-left: 200px;
      width: 80%;
  }
  
.subheader
  {
      margin-top: 0;
      height: 5px;
      margin-left: 0;
      margin-right: 0;
      background-color: #e63;
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
  padding: 0 10px 0 10px; /* Padding for other horizontal elements */
}
.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 30px;
  padding: 0 46px 0 10px;
	border-color: #e63;
  border-radius: 25px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 2px;
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

.flip
{
    background-color: #ffffff;
    height: 30px;
}

.flop
{
    background-color: #fed;
    height: 30px;
}

.controller
  {
      background-color: #fff;
      margin-left: 0px;
      width: 20%;
      height: 2000px;
      box-shadow: 0px 2px 5px #AAA;
      opacity: 1.0;
      margin-top: -390px;
      float: left;
  }
  
.boards {
margin-left: 50px;
margin-top: 20px;
height: 400px;
width: 88%;
padding: 0px 0px 10px 0px;
background-color: #fff;
box-shadow: 0px 2px 5px #aaa;
border-left: 5px solid #e63;
float: left;
}

.call {
font-size: 10px;
color: #444;
margin-left: 10px;
background-color: #fed;
}

.toll
{
    float: right;
    color: #e63;
    font-size: 25px;
}

select
{
    
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
                    <li><a href="../sounds/index.jsp" class="current">Sounds</a></li>
                    <li><a href="../channels/index.jsp">Channels</a></li>
                </ul>
                    
            </nav>
      
    </div>
      
      <div class="subheader"></div>
      
  </header>
  
      
    <img src="../epic.png" alt="epic" id="epic">
      <div class="controller">
          
          <form method="post">
          
              <!--   <p><input type="text" placeholder="Search for a program" class="names"></p>  -->
              
              <div class="flexsearch">
		<div class="flexsearch--wrapper">
			<form class="flexsearch--form" action="#" method="post">
				<div class="flexsearch--input-wrapper">
					<input class="flexsearch--input" type="search" placeholder="Search for a program">
				</div>
				<input class="flexsearch--submit" type="submit" value="&#10140;"/>
			</form>
		</div>
              </div>
              
              <h4> &nbsp; &nbsp; Find Carriers by Translation</h4>
              
              <select>
                        <option value="Afghanistan" title="Afghanistan">Arabic</option>
                        <option value="Åland Islands" title="Åland Islands">Chinese</option>
                        <option value="Albania" title="Albania">Czech</option>
                        <option value="Algeria" title="Algeria">Danish</option>
                        <option value="American Samoa" title="American Samoa">Dutch</option>
                        <option value="Andorra" title="Andorra">English</option>
                        <option value="Angola" title="Angola">Filipino</option>
                        <option value="Anguilla" title="Anguilla">Finnish</option>
                        <option value="Antarctica" title="Antarctica">French</option>
                        <option value="Antigua and Barbuda" title="Antigua and Barbuda">German</option>
                        <option value="Argentina" title="Argentina">Greek</option>
                        <option value="Armenia" title="Armenia">Gujarati</option>
                        <option value="Aruba" title="Aruba">Hebrew</option>
                        <option value="Australia" title="Australia">Hindi</option>
                        <option value="Austria" title="Austria">Hungarian</option>
                        <option value="Azerbaijan" title="Azerbaijan">Indonesian</option>
                        <option value="Bahamas" title="Bahamas">Japanese</option>
                        <option value="Bahrain" title="Bahrain">Korean</option>
                        <option value="Bangladesh" title="Bangladesh">Lao</option>
                        <option value="Barbados" title="Barbados">Norwegian</option>
                        <option value="Belarus" title="Belarus">Polish</option>
                        <option value="Belgium" title="Belgium">Portuguese</option>
                        <option value="Belize" title="Belize">Punjabi</option>
                        <option value="Benin" title="Benin">Spanish</option>
                        <option value="Bermuda" title="Bermuda">Swedish</option>
                        <option value="Bhutan" title="Bhutan">Telugu</option>
                        <option value="Bolivia, Plurinational State of" title="Bolivia, Plurinational State of">Ukrainian</option>
                  </select>
              
              <h4> &nbsp; &nbsp; Find Carriers by Toll</h4>
              
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="country"> Free</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $1 - $10</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $11 - $20</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $21 - $30</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $31 - $40</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $41 - $50</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $51 - $60</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $61 - $70</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $71 - $80</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $81 - $90</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $91 - $100</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $101 - $110</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $111 - $120</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $121 - $130</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $131 - $140</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $141 - $150</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $151 - $160</div>
          <div class="flop"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> $161 - $170</div>
          <div class="flip"> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Refresh" class='button2'></div>
          
          </form>
          
      </div>
      <div class="logos">
      
      <div class="boards">
          <div class="stations">
        <div class="rimground"><img src="logos/vibes.png" alt="vibes" id="logos"><h3>Vibes</h3></div>
        <div class="rimground"><img src="logos/9jams.png" alt="think" id="logos"><h3>9jams</h3></div>
        <div class="rimground"><img src="logos/imperial.png" alt="woods" id="logos"><h3>Imperial</h3></div>
        <div class="rimground"><img src="logos/earlyrise.png" alt="turbine" id="logos"><h3>Early Rise</h3></div>
        <div class="rimground"><img src="logos/lollypop.png" alt="tourism" id="logos"><h3>Lolly Pop</h3></div>
        <div class="rimground"><img src="logos/pendant.png" alt="signals" id="logos"><h3>Pendant</h3></div>
    </div>
        <h4><b>Thompson &amp; Reuters</b></h4>
        <b class="call">Director: Craigton Bourne</b><br>
        <b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Rachel, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>
        <b class="call">Stations: Imperial, Homelet, CL Air, Vibes, 9jams, Poppers</b><br>
        <b class="call">Rating: Mature</b><br>
        <b class="call">Country: Indonesia</b><br>
        <b class="call">Translation: Spanish</b><br>
        <b class="call">Clients: 289 / 300</b><br>
        <div class="toll">$34.99/month &nbsp; &nbsp; </div><br>

      </div>
<div class="boards">
    <div class="stations">
        <div class="rimground"><img src="logos/discover.png" alt="vibes" id="logos"><h3>Discover</h3></div>
        <div class="rimground"><img src="logos/heard.png" alt="think" id="logos"><h3>Heard</h3></div>
        <div class="rimground"><img src="logos/excite.png" alt="woods" id="logos"><h3>Excite</h3></div>
        <div class="rimground"><img src="logos/poppers.png" alt="turbine" id="logos"><h3>Poppere</h3></div>
        <div class="rimground"><img src="logos/radial.png" alt="tourism" id="logos"><h3>Radial</h3></div>
        <div class="rimground"><img src="logos/movieplanet.png" alt="signals" id="logos"><h3>Movie Planet</h3></div>
    
    </div>
    
<h4><b>Bell</b></h4>
        <b class="call">Director: Craigton Bourne</b><br>
        <b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Rachel, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>
        <b class="call">Stations: Imperial, Homelet, CL Air, Vibes, 9jams, Poppers</b><br>
        <b class="call">Rating: Mature</b><br>
        <b class="call">Country: Indonesia</b><br>
        <b class="call">Translation: Spanish</b><br>
        <b class="call">Clients: 664 / 700</b><br>
        <div class="toll">$72.99/month &nbsp; &nbsp; </div><br>

</div>
<div class="boards">
    <div class="stations">
        <div class="rimground"><img src="logos/vibes.png" alt="vibes" id="logos"><h3>Vibes</h3></div>
        <div class="rimground"><img src="logos/9jams.png" alt="think" id="logos"><h3>9jams</h3></div>
        <div class="rimground"><img src="logos/imperial.png" alt="woods" id="logos"><h3>Imperial</h3></div>
        <div class="rimground"><img src="logos/earlyrise.png" alt="turbine" id="logos"><h3>Early Rise</h3></div>
        <div class="rimground"><img src="logos/lollypop.png" alt="tourism" id="logos"><h3>Lolly Pop</h3></div>
        <div class="rimground"><img src="logos/pendant.png" alt="signals" id="logos"><h3>Pendant</h3></div>
    
    </div>
<h4><b>MTS, Inc.</b></h4>
        <b class="call">Director: Craigton Bourne</b><br>
        <b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Rachel, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>
        <b class="call">Stations: Imperial, Homelet, CL Air, Vibes, 9jams, Poppers</b><br>
        <b class="call">Rating: Mature</b><br>
        <b class="call">Country: Indonesia</b><br>
        <b class="call">Translation: Spanish</b><br>
        <b class="call">Clients: 289 / 300</b><br>
        <div class="toll">$16.99/month &nbsp; &nbsp; </div><br>

</div>
<div class="boards">
    <div class="stations">
        <div class="rimground"><img src="logos/vibes.png" alt="vibes" id="logos"><h3>Vibes</h3></div>
        <div class="rimground"><img src="logos/9jams.png" alt="think" id="logos"><h3>9jams</h3></div>
        <div class="rimground"><img src="logos/imperial.png" alt="woods" id="logos"><h3>Imperial</h3></div>
        <div class="rimground"><img src="logos/earlyrise.png" alt="turbine" id="logos"><h3>Early Rise</h3></div>
        <div class="rimground"><img src="logos/lollypop.png" alt="tourism" id="logos"><h3>Lolly Pop</h3></div>
        <div class="rimground"><img src="logos/pendant.png" alt="signals" id="logos"><h3>Pendant</h3></div>
    
    </div>
<h4><b>Voxility Networks</b></h4>
        <b class="call">Director: Craigton Bourne</b><br>
        <b class="call">Crew: Angie Lesley, Marie Escondido, Carrie Rachel, Leo Bell, Allie Saunders, Paulo Victorios, Leila Johnson, Gary Fisch, Toby Dewman, Drew Fernstein.</b><br>
        <b class="call">Stations: Imperial, Homelet, CL Air, Vibes, 9jams, Poppers</b><br>
        <b class="call">Rating: Mature</b><br>
        <b class="call">Country: Indonesia</b><br>
        <b class="call">Translation: Spanish</b><br>
        <b class="call">Clients: 289 / 300</b><br>
        <div class="toll">$23.99/month &nbsp; &nbsp; </div><br>

</div>
    
  
  </div>
  

  <img src="../minion.png" alt="minion" id="minion3">
  
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

