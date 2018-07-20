
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="movie.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Movies | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="../../chilli.png"/>
<meta charset="utf-8" /> 
<link rel="stylesheet" type="text/css" href="../../store.css">
<script type="text/javascript" src="../../store.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
</head>

<body>
  
  <header>
      
    <div class="head">
      
    <a href="../../index.jsp"><img class="bol" src="../../chillon.png" alt="bol"></a>
        
    
        
            <nav class="nav">
                
                <ul>
                    <li><a href="../../signin.jsp" >Sign In</a></li>
                    <li><a href="../../index.jsp" >Register</a></li>
                    <li><a href="../../giveaways.jsp" id="page">Store Giveaways</a></li>
                    <li><a href="../../store.jsp" >Store</a></li>
                    <li><a href="../../packages.jsp" >Packages</a></li>
                    <li><a href="../../videos/stream.jsp" >Streaming</a></li>
                    <li><a href="../../distribute.jsp" >Distribute</a></li>
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
        <button class="button2"><a href="../../index.jsp" class="chillonline">Start your free content trial</a></button></div>
      
    
    
            
            
            <%
                String pageRequestNumber = null;
                int pageNumber;
                
                if (request.getParameter("page-request-number") == null)
                
                {
                    pageRequestNumber = "1";
                    pageNumber = 1;
                }
                
                else 

                {
                    pageRequestNumber = request.getParameter("page-request-number");
                    pageNumber = Integer.parseInt(pageRequestNumber);
                }
                
                
                %>
            
            
      
                
      <div class="store">
    
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
          
          <form id="movie_form" method="post" action="../../movies/checkout.jsp">
                
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
                    <li><a href="../../movies/giveaways.jsp" >&nbsp; Movies</a></li>
                    <li class="genre"><a href="../../movies/kids/giveaways.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../../movies/action/giveaways.jsp">&nbsp; Action</a></li>
                    <li class="genre"><a href="../../movies/comedy/giveaways.jsp" class="current" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../../movies/romance/giveaways.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../../movies/horror/giveaways.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../../movies/documentary/giveaways.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../../movies/adventure/giveaways.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="../../series/giveaways.jsp">&nbsp; Series</a></li>
                    <li class="genre"><a href="../../series/kids/giveaways.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="../../series/action/giveaways.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="../../series/comedy/giveaways.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="../../series/romance/giveaways.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="../../series/horror/giveaways.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="../../series/documentary/giveaways.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="../../series/adventure/giveaways.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="../../videos/giveaways.jsp" >&nbsp; Videos</a></li>
                    <li><a href="../../music/giveaways.jsp" >&nbsp; Music</a></li>
                    <li><a href="../../channels/giveaways.jsp" >&nbsp; TV channels</a></li>
                    <li><a href="../../sounds/giveaways.jsp" >&nbsp; Radio channels</a></li>
                    <li><a href="../../games/giveaways.jsp" >&nbsp; Games</a></li>
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
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <input type="checkbox" class="search-program"> Mexico</div>&nbsp; &nbsp; 
          <div class=""> &nbsp; &nbsp; &nbsp; &nbsp; <button type="submit" value="Refresh" class="button2"><i class="fa fa-refresh"></i> &nbsp; Refresh</button></div>
                
            </div>
            <div class=""></div>
            <div class=""></div>
        </div>
        
        
          
        <div class="store-content">
            <div class="hottest"><div class="advert"></div></div>
        <div class="browsed">    
            
            <%
                    
                    MovieList movies = new MovieList(pageNumber);
                    
                    
                    
                    %>
                    
                    
                    
            
          
        
            
            <div id="page-request-form-div">
                
                <form id="page-request-form" method="post" action="giveaways.jsp">
                    
                    <input type="text" id="page-request-number" name="page-request-number" value="<%= pageRequestNumber %>" />
                    <input type="text" id="final-page-number" name="final-page-number" value="<%= movies.getFinalPageNumber() %>" />
                    <input type="submit" id="page-request-number-submit" />
                    
                </form>
                
            </div>
                    
                    
                    
                    
                    <%
                        int count = 0;
                        
                        for (count = 0; (count < 18) && (movies.getMovie(count) != null); count++) {
                        %>
            
            <div class="product">
                
                    <div class="poster">
                        <a href="javascript:transferMovieByID(<%= movies.getMovie(count).getMovieID() %>);" id="product-anchor">
                        <img src="<%= movies.getMovie(count).getMoviePoster() %>" alt="agri" id="product-poster2" title="Play Trailer">
                        </a>
                    </div>
                   
                <div class="definition"><a class="definition-style"><%= movies.getMovie(count).getMovieName() %></a></div>
                <div class="distributor"><%= movies.getMovie(count).getDistributor() %></div>
                <div class="loves-n-seeds"><a class="loves-style"><%= movies.getMovie(count).getLocality() %></a></div>
                <div class="commentaries"><a class="definition-style"><%= movies.getMovie(count).getRentalPrice() %></a></div>
                <div class="loves-n-seeds"></div>
            </div>
                        
                        <%
                            }
                            %>
                            
                            
        </div>
                    <div class="hottest"><div class="browsing">
                            <div class="browsing-place"><button onclick="getPreviousPage()">< Previous</button></div>
                            <div class="browsing-place"><%= movies.getCurrentPageNumber() %> of <%= movies.getFinalPageNumber() %></div>
                            <div class="browsing-place"><button onclick="getNextPage();">Next ></button></div>
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

