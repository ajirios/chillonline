
<%-- 
    Document   : store
    Created on : 1-May-2016, 1:27:40 AM
    Author     : Ajiri Osauzo Jeffrey
    Author ID  : ajirios
--%>

<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="client.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en"> 
<head>
<title>Store | Chillonline</title>
<link rel="shortcut icon" type="image/png" href="chilli.png"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="utf-8" /> 
<meta name="keywords" content="Chillonline, videos, movies, music, TV shows, TV series, TV channels, radio channels, games" />
<meta name="description" content="Search our store for purchases and rentals of amazing movies, videos, music, TV shows, TV channels, radio channels, and
      games." />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="store.css">
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="store.js"></script>

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
      
   <a href=""><img class="bol" src="chillon.png" alt="bol"></a> 
        
    
        
            <nav class="nav">
                
                <ul>
                    <li><a href="signin.jsp" >Sign In</a></li>
                    <li><a href="index.jsp" >Register</a></li>
                    <li><a href="giveaways.jsp" >Store Giveaways</a></li>
                    <li><a href="store.jsp" id="page" >Store</a></li>
                    <li><a href="packages.jsp" >Packages</a></li>
                    <li><a href="videos/stream.jsp" >Streaming</a></li>
                    <li><a href="distribute.jsp" >Distribute</a></li>
                </ul>
                    
            </nav>
      
    </div>
      <div class="subheader">
          <div class="skew">
          <form class="flexsearch--form" action="#" method="post">
                <div class="flexsearch">
                      <div class="flexsearch--wrapper">

                                      <div class="flexsearch--input-wrapper">
                                              <input class="flexsearch--input" type="search" placeholder="Search for programs">
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
        <button class="button2"><a href="stream.jsp" class="chillonline">Register now</a></button></div>
    
    <div class="store">
        
        <form id="movie_form" method="post" action="../movies/checkout.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type="submit" id="submit-form-button">
                
            </form>
        
        <form id="series_form" method="post" action="../series/checkout.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type="submit" id="submit-form-button">
                
            </form>
        
        <form id="music_form" method="post" action="../music/checkout.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type="submit" id="submit-form-button">
                
            </form>
        
        <form id="tv_form" method="post" action="../channels/checkout.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type="submit" id="submit-form-button">
                
            </form>
        
        <form id="radio_form" method="post" action="../sounds/checkout.jsp">
                
                <input type='number' id="packageID" name="packageID">
                <input type='text' id="department" name="department">
                <input type="submit" id="submit-form-button">
                
            </form>
        
        <form id="game_form" method="post" action="../games/checkout.jsp">
                
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
                    <li><a href="movies/store.jsp" >&nbsp; Movies</a></li>
                    <li class="genre"><a href="movies/kids/store.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="movies/action/store.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="movies/comedy/store.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="movies/romance/store.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="movies/horror/store.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="movies/documentary/store.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="movies/adventure/store.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="series/store.jsp" >&nbsp; Series</a></li>
                    <li class="genre"><a href="series/kids/store.jsp" >&nbsp; Kids</a></li>
                    <li class="genre"><a href="series/action/store.jsp" >&nbsp; Action</a></li>
                    <li class="genre"><a href="series/comedy/store.jsp" >&nbsp; Comedy</a></li>
                    <li class="genre"><a href="series/romance/store.jsp" >&nbsp; Romance</a></li>
                    <li class="genre"><a href="series/horror/store.jsp" >&nbsp; Horror</a></li>
                    <li class="genre"><a href="series/documentary/store.jsp" >&nbsp; Documentary</a></li>
                    <li class="genre"><a href="series/adventure/store.jsp" >&nbsp; Adventure</a></li>
                    <li><a href="videos/store.jsp" >&nbsp; Videos</a></li>
                    <li><a href="music/store.jsp" >&nbsp; Music</a></li>
                    <li><a href="channels/store.jsp" >&nbsp; TV channels</a></li>
                    <li><a href="sounds/store.jsp" >&nbsp; Radio channels</a></li>
                    <li><a href="games/store.jsp" >&nbsp; Games</a></li>
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
    
            <script>
                (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
                })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

                ga('create', 'UA-74746182-2', 'auto');
                ga('send', 'pageview');

             </script>
    
    <script>
        
        $('body').on('contextmenu', 'img', function(e) {return false;});
        $('body').on('contextmenu', 'video', function(e) {return false;});
        
    </script>
    
            
            
            
            <%
                    
                    MovieList movies = new MovieList();
                    
                    
                    
                    %>
                    
                    <%
                        int count;
                        
                        for (count = 22; count < 28; count++) {
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
                            
                            
                
                <%
                    
                    TVSeriesList series = new TVSeriesList();
                    
                    
                    
                    %>
                    
                    <%
                        count = 0;
                        
                        for (count = 7; count < 13; count++) {
                        %>
            
            <div class="product">
                
                    <div class="poster">
                        
                        <a href="javascript:transferSeriesByID(<%= series.getTVSeries(count).getTvSeriesID() %>);" id="product-anchor">
                            <img src="<%= series.getTVSeries(count).getTvSeriesPoster() %>" alt="agri" id="product-poster2" title="Play Trailer">
                        </a>
                        
                    </div>
                   
                <div class="definition"><a class="definition-style"><span id="shelf1-title"><%= series.getTVSeries(count).getTvSeriesName() %></span></a></div>
                <div class="distributor"><%= series.getTVSeries(count).getDistributor() %></div>
                <div class="loves-n-seeds"><a class="loves-style"><%= series.getTVSeries(count).getLocality() %></a></div>
                <div class="commentaries"><a class="definition-style"><span id="shelf1-price"><%= series.getTVSeries(count).getRentalPrice() %></span></a></div>
                <div class="loves-n-seeds"></div>
            </div>
                        
                        <%
                            }
                            %>
                    
                            
                
                <%
                    
                    MusicList music = new MusicList();
                    
                    
                    
                    %>
                    
                    <%
                        count = 0;
                        
                        for (count = 11; count < 17; count++) {
                        %>
            
            <div class="product">
                
                    <div class="poster">
                        
                        <a href="javascript:transferMusicByID(<%= music.getMusic(count).getMusicID() %>);" id="product-anchor">
                            <img src="<%= music.getMusic(count).getMusicPoster() %>" alt="agri" id="product-poster2" title="Click to test">
                        </a>
                        
                    </div>
                   
                <a class="definition-style" title='Carry to checkout'><div class="definition"><%= music.getMusic(count).getMusicName() %></div></a>
                <div class="distributor"><%= music.getMusic(count).getDistributor() %></div>
                <div class="loves-n-seeds"><a class="loves-style"><%= music.getMusic(count).getLocality() %></a></div>
                <div class="commentaries"><span class="definition-style"><%= music.getMusic(count).getPurchasePrice() %></span></div>
                <div class="loves-n-seeds"></div>
            </div>
                        
                        <%
                            }
                            %>
                            
                            
                
                
                
                
        </div>
                    <div class="hottest"><div class="browsing">
                            
                </div></div>
        </div>
        
    </div>
  
  <footer>
    
      
    <div class="copyright">
        
        <div class="footnotes"><h4>Clients</h4>
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
          <a class="notes" href="terms.jsp"><p>Terms of Service</p></a>
          <a class="notes" href="privacy_policy.jsp"><p>Privacy Policy</p></a>
          <a class="notes" href="eula.jsp"><p>EULA</p></a>
          <a class="notes" href="distribution-agreement.jsp"><p>Distribution Agreement</p></a>
      </div>
      <div class="footnotes"><h4>Services</h4>
          <a class="notes" href=""><p>Chillonline Skipad</p></a>
          <a class="notes" href=""><p>Chillonline Sheets</p></a>
          <a class="notes" href=""><p>Chillonline Slide</p></a>
          <a class="notes" href=""><p>Chillonline Snap</p></a>
      </div>
      <div class="footnotes"><h4>Contact</h4>
          <a class="notes" href=""><p>Customer Service</p></a>
          <a class="notes" href=""><p>Distributors</p></a>
          <a class="notes" href=""><p>Jobs</p></a>
          <a class="notes" href=""><p>FAQs</p></a>
      </div>
        <hr>
        <p>&copy; 2017. Chill Technologies, Inc. All Rights Reserved.</p>
        <p>Developed by @ajirios | Jeffrey Ajiri Osauzo.</p>
    </div>
    
    
  </footer>

</body>
</html>

