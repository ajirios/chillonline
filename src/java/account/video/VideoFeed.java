/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.video;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import video.VideoRetrieve;
import video.VideoUpdate;

/**
 *
 * @author El Jefe
 */
@WebServlet(name = "VideoFeed", urlPatterns = {"/VideoFeed"})
public class VideoFeed extends HttpServlet 

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VideoFeed</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VideoFeed at " + request.getContextPath() + "</h1>");
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
        VideoCreate videoCreate = null;
        String accountRequestNumber = null;
        long accountNumber = -1;
        String programRequestNumber = null;
        long programID = -1;
        VideoRetrieve videoRetrieved = null;
        VideoUpdate videoUpdate = null;
        long numberOfPodcastFeeds = 0;
        
        if (request.getParameter("account-request-number") != null)
            
        {
            accountRequestNumber = request.getParameter("account-request-number");
            accountNumber = Long.parseLong(accountRequestNumber);
        }
        
        if (request.getParameter("program-request-number") != null)
            
        {
            programRequestNumber = request.getParameter("program-request-number");
            programID = Long.parseLong(programRequestNumber);
        }
        
        
        if ((accountNumber != -1) && (programID != -1))
            
        {
            videoCreate = new VideoCreate(accountNumber, programID);
            videoRetrieved = new VideoRetrieve(programID);
            videoUpdate = new VideoUpdate(programID);
            numberOfPodcastFeeds = videoRetrieved.getNumberOfPodcastFeeds();
            numberOfPodcastFeeds = numberOfPodcastFeeds + 1;
            videoUpdate.setNumberOfPodcastFeeds(numberOfPodcastFeeds);
        }
        
        response.sendRedirect("clients/home.jsp");
        
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
