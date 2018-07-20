
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="client.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Radio | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../chilli.png"/>
<meta charset="utf-8" /> 
<link rel="stylesheet" type="text/css" href="../store.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../store.js"></script>

</head>

<body>
  
  <header>
      
    <div class="head">
      
    <a href="../index.jsp"><img class="bol" src="../chillon.png" alt="bol"></a>
        
    
        
            <nav class="nav">
                
                <ul>
                    <li><a href="../signin.jsp" >Sign In</a></li>
                    <li><a href="../register.jsp" >Register</a></li>
                    <li><a href="../giveaways.jsp" >Store Giveaways</a></li>
                    <li><a href="../store.jsp" id="page">Store</a></li>
                    <li><a href="../index.jsp" >Packages</a></li>
                    <li><a href="../stream.jsp" >Streaming</a></li>
                    <li><a href="../distribute.jsp" >Distribute</a></li>
                </ul>
                    
            </nav>
      
    </div>
      
      <div class="subheader">
          <div class="skew">
          <form class="flexsearch--form" action="#" method="post">
                <div class="flexsearch">
                      <div class="flexsearch--wrapper">

                                      <div class="flexsearch--input-wrapper">
                                              <input class="flexsearch--input" type="search" placeholder="Search for a program">
                                      </div>


                      </div>
                    </div>


                    <select name="department" class="search-dept">
                      <option value="all">in All Departments</option>
                      <option value="channels">in Channels</option>
                      <option value="sounds">in Sounds</option>
                      <option value="videos">in Videos</option>
                      <option value="movies">in Movies</option>
                      <option value="series">in Series</option>
                      <option value="music">in Music</option>
                      <option value="games">in Games</option>
                    </select>
                    <input type="submit" value="Search" class="search-button">
          </form>
          </div>
      </div>
      
  </header>
  
    <div class="announcement">Find connections, create boards, and rent programs for individual and group enjoyment.
        <button class="button2"><a href="../register.jsp" class="chillonline">Start your free content trial</a></button></div>
      
      <div class="store">
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
          
          <form id="radio_form" method="post" action="../sounds/checkout.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type="submit" id="submit-form-button">
                
          </form>
        
        <div class="store-selector">
            <div class=""></div>
            <div class=""><h3>&nbsp; Browse by department</h3></div>
            <div class="dept-nav-place">
                <nav class="dept-nav">
                
                <ul>
                    <li><a href="../movies/index.jsp" >&nbsp; Movies</a></li>
                    <li class="genre"><a href="../movies/kids/index.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../movies/action/index.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="../movies/comedy/index.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../movies/romance/index.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../movies/horror/index.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../movies/documentary/index.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../movies/adventure/index.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="../series/index.jsp">&nbsp; Series</a></li>
                    <li class="genre"><a href="../series/kids/index.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../series/action/index.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="../series/comedy/index.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../series/romance/index.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../series/horror/index.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../series/documentary/index.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../series/adventure/index.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="../videos/index.jsp" >&nbsp; Videos</a></li>
                    <li><a href="../music/index.jsp" >&nbsp; Music</a></li>
                    <li><a href="../channels/index.jsp" >&nbsp; TV channels</a></li>
                    <li><a href="../sounds/index.jsp" class="current" >&nbsp; Radio channels</a></li>
                    <li><a href="../games/index.jsp" >&nbsp; Games</a></li>
                </ul>
                    
                </nav>
            </div>
            <div class="">
                
                <div class=""><h3>&nbsp; Browse by locality</h3></div>
                
                <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" name="country" value="country"> United Kingdom</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> United States</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program" checked> Canada</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Germany</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> France</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Ireland</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> China</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Japan</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> South Korea</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Nigeria</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> South Africa</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Argentina</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Brazil</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Mexico</div>
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="submit" value="Refresh" class="button2"></div>
                
            </div>
            <div class=""></div>
            <div class=""></div>
        </div>
          
          
        
          <div class="store-content">
            <div class="hottest"><div class="advert"></div></div>
        <div class="browsed">    
            
            <%
                    
                    RadioChannelList channels = new RadioChannelList();
                    
                    
                    
                    %>
                    
                    <%
                        int count = 0;
                        
                        for (count = 2; count < 20; count++) {
                        %>
            
            <div class="product">
                
                    <div class="poster">
                        <a href="javascript:transferRadioChannelByID(<%= channels.getRadioChannel(count).getRadioChannelID() %>);" id="product-anchor">
                        <img src="<%= channels.getRadioChannel(count).getRadioChannelPoster() %>" alt="agri" id="product-poster2" title="Play Trailer">
                        </a>
                    </div>
                   
                <div class="definition"><a class="definition-style"><%= channels.getRadioChannel(count).getRadioChannelName() %></a></div>
                <div class="distributor"><%= channels.getRadioChannel(count).getDistributor() %></div>
                <div class="loves-n-seeds"><a class="loves-style"><%= channels.getRadioChannel(count).getLocality() %></a></div>
                <div class="commentaries"><a class="definition-style"><%= channels.getRadioChannel(count).getRentalPrice() %></a></div>
                <div class="loves-n-seeds"></div>
            </div>
                        
                        <%
                            }
                            %>
                        
                
        </div>
                    <div class="hottest"><div class="browsing">
                            <div class="browsing-place"><button onclick="">< Previous</button></div>
                            <div class="browsing-place">1 of 31</div>
                            <div class="browsing-place"><button onclick="">Next ></button></div>
                </div></div>
        </div>
        
    </div>
  
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
          <a class="notes" href="../terms.jsp"><p>Terms of Service</p></a>
          <a class="notes" href="../privacy_policy.jsp"><p>Privacy Policy</p></a>
          <a class="notes" href="../eula.jsp"><p>EULA</p></a>
          <a class="notes" href="../distribution-agreement.jsp"><p>Distribution Agreement</p></a>
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





