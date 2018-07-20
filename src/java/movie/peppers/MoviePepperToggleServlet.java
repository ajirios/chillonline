/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package movie.peppers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import movie.MovieRetrieve;
import movie.MovieUpdate;

/**
 *
 * @author El Jefe
 */
@WebServlet(name = "MoviePepperToggleServlet", urlPatterns = {"/MoviePepperToggleServlet"})
public class MoviePepperToggleServlet extends HttpServlet 

{

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MoviePepperToggleServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MoviePepperToggleServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    
    {
        long movieID = -1;
        long accountNumber = -1;
        MoviePepperRetrieve retrieved = null;
        MoviePepperCreate created = null;
        MoviePepperDelete deleted = null;
        MovieRetrieve movieRetrieved = null;
        MovieUpdate movieUpdate = null;
        long numberOfPodcastPeppers = 0;
        String returnPage = "clients/movies/stream.jsp";
        
        if (request.getParameter("movie-pepper-id") != null)
            
        {
            movieID = Long.parseLong(request.getParameter("movie-pepper-id"));
        }
        
        if (request.getParameter("movie-pepper-account-number") != null)
            
        {
            accountNumber = Long.parseLong(request.getParameter("movie-pepper-account-number"));
        }
        
        if (request.getParameter("movie-pepper-return-page") != null)
            
        {
            returnPage = request.getParameter("movie-pepper-return-page");
        }
        
        if (movieID != -1)
            
        {
            retrieved = new MoviePepperRetrieve(accountNumber, movieID);
            movieRetrieved = new MovieRetrieve(movieID);
            movieUpdate = new MovieUpdate(movieID);
            numberOfPodcastPeppers = movieRetrieved.getNumberOfPodcastPeppers();
            
            if (retrieved.isPepped() == false)
                
            {
                created = new MoviePepperCreate(accountNumber, movieID);
                numberOfPodcastPeppers = numberOfPodcastPeppers + 1;
                movieUpdate.setNumberOfPodcastPeppers(numberOfPodcastPeppers);
            }
            
            else
                
            {
                deleted = new MoviePepperDelete(accountNumber, movieID);
                numberOfPodcastPeppers = numberOfPodcastPeppers - 1;
                movieUpdate.setNumberOfPodcastPeppers(numberOfPodcastPeppers);
            }
            
        }
        
        String movieRequestNumber = Long.toString(movieID);
        
        response.sendRedirect(returnPage + "?page-request-number=" + movieRequestNumber);
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() 
    
    {
        return "Short description";
    }// </editor-fold>

}
