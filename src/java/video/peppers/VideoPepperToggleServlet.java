/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package video.peppers;

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
@WebServlet(name = "VideoPepperToggleServlet", urlPatterns = {"/VideoPepperToggleServlet"})
public class VideoPepperToggleServlet extends HttpServlet 

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
            out.println("<title>Servlet VideoPepperToggleServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VideoPepperToggleServlet at " + request.getContextPath() + "</h1>");
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
        long videoID = -1;
        long accountNumber = -1;
        VideoPepperRetrieve retrieved = null;
        VideoPepperCreate created = null;
        VideoPepperDelete deleted = null;
        VideoRetrieve videoRetrieved = null;
        VideoUpdate videoUpdate = null;
        long numberOfPodcastPeppers = 0;
        String returnPage = "clients/videos/stream.jsp";
        
        if (request.getParameter("video-pepper-id") != null)
            
        {
            videoID = Long.parseLong(request.getParameter("video-pepper-id"));
        }
        
        if (request.getParameter("video-pepper-account-number") != null)
            
        {
            accountNumber = Long.parseLong(request.getParameter("video-pepper-account-number"));
        }
        
        if (request.getParameter("video-pepper-return-page") != null)
            
        {
            returnPage = request.getParameter("video-pepper-return-page");
        }
        
        if (videoID != -1)
            
        {
            retrieved = new VideoPepperRetrieve(accountNumber, videoID);
            videoRetrieved = new VideoRetrieve(videoID);
            videoUpdate = new VideoUpdate(videoID);
            numberOfPodcastPeppers = videoRetrieved.getNumberOfPodcastPeppers();
            
            if (retrieved.isPepped() == false)
                
            {
                created = new VideoPepperCreate(accountNumber, videoID);
                numberOfPodcastPeppers = numberOfPodcastPeppers + 1;
                videoUpdate.setNumberOfPodcastPeppers(numberOfPodcastPeppers);
            }
            
            else
                
            {
                deleted = new VideoPepperDelete(accountNumber, videoID);
                numberOfPodcastPeppers = numberOfPodcastPeppers - 1;
                videoUpdate.setNumberOfPodcastPeppers(numberOfPodcastPeppers);
            }
            
        }
        
        String videoRequestNumber = Long.toString(videoID);
        
        response.sendRedirect(returnPage + "?page-request-number=" + videoRequestNumber);
        
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
