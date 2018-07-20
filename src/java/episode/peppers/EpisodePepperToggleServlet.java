/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package episode.peppers;


import episode.EpisodeRetrieve;
import episode.EpisodeUpdate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author El Jefe
 */
@WebServlet(name = "EpisodePepperToggleServlet", urlPatterns = {"/EpisodePepperToggleServlet"})
public class EpisodePepperToggleServlet extends HttpServlet 

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
        long seriesID = -1;
        long episodeID = -1;
        long accountNumber = -1;
        EpisodePepperRetrieve retrieved = null;
        EpisodePepperCreate created = null;
        EpisodePepperDelete deleted = null;
        EpisodeRetrieve episodeRetrieved = null;
        EpisodeUpdate episodeUpdate = null;
        long numberOfPodcastPeppers = 0;
        String returnPage = "clients/series/stream.jsp";
        
        if (request.getParameter("episode-pepper-id") != null)
            
        {
            episodeID = Long.parseLong(request.getParameter("episode-pepper-id"));
        }
        
        if (request.getParameter("episode-pepper-account-number") != null)
            
        {
            accountNumber = Long.parseLong(request.getParameter("episode-pepper-account-number"));
        }
        
        if (request.getParameter("series-pepper-page-number") != null)
            
        {
            seriesID = Long.parseLong(request.getParameter("series-pepper-page-number"));
        }
        
        if (request.getParameter("episode-pepper-return-page") != null)
            
        {
            returnPage = request.getParameter("episode-pepper-return-page");
        }
        
        if (episodeID != -1)
            
        {
            retrieved = new EpisodePepperRetrieve(accountNumber, episodeID);
            episodeRetrieved = new EpisodeRetrieve(episodeID);
            episodeUpdate = new EpisodeUpdate(episodeID);
            numberOfPodcastPeppers = episodeRetrieved.getNumberOfPodcastPeppers();
            
            if (retrieved.isPepped() == false)
                
            {
                created = new EpisodePepperCreate(accountNumber, episodeID);
                numberOfPodcastPeppers = numberOfPodcastPeppers + 1;
                episodeUpdate.setNumberOfPodcastPeppers(numberOfPodcastPeppers);
            }
            
            else
                
            {
                deleted = new EpisodePepperDelete(accountNumber, episodeID);
                numberOfPodcastPeppers = numberOfPodcastPeppers - 1;
                episodeUpdate.setNumberOfPodcastPeppers(numberOfPodcastPeppers);
            }
            
        }
        
        response.sendRedirect(returnPage + "?page-request-number=" + seriesID);
        
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
