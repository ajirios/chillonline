/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tutorial.board.posts;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author El Jefe
 */
@WebServlet(name = "TutorialBoardPostCreateServlet", urlPatterns = {"/TutorialBoardPostCreateServlet"})
public class TutorialBoardPostCreateServlet extends HttpServlet 

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
        try (PrintWriter out = response.getWriter()) 
        
        {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TutorialBoardPostCreateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TutorialBoardPostCreateServlet at " + request.getContextPath() + "</h1>");
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
        TutorialBoardPostCreate postCreate = null;
        String videoID = null;
        long boardID = -1;
        long clientID = -1;
        String creationTime = null;
        String title = null;
        String channelTitle = null;
        String thumbnail = null;
        String message = null;
        String description = null;
        String videoLocation = null;
        
        
        
        if ((request.getParameter("video-id") != null) && (!(request.getParameter("video-id").equals(""))))
            
        {
            videoID = request.getParameter("video-id");
        }
        
        if ((request.getParameter("board-id") != null) && (!(request.getParameter("board-id").equals(""))))
            
        {
            boardID = Long.parseLong(request.getParameter("board-id"));
        }
        
        if ((request.getParameter("client-id") != null) && (!(request.getParameter("client-id").equals(""))))
            
        {
            clientID = Long.parseLong(request.getParameter("client-id"));
        }
        
        if ((request.getParameter("title") != null) && (!(request.getParameter("title").equals(""))))
            
        {
            title = request.getParameter("title");
        }
        
        if ((request.getParameter("channel-title") != null) && (!(request.getParameter("channel-title").equals(""))))
            
        {
            channelTitle = request.getParameter("channel-title");
        }
        
        if ((request.getParameter("thumbnail") != null) && (!(request.getParameter("thumbnail").equals(""))))
            
        {
            thumbnail = request.getParameter("thumbnail");
        }
        
        if ((request.getParameter("message") != null) && (!(request.getParameter("message").equals(""))))
            
        {
            message = request.getParameter("message");
        }
        
        if ((request.getParameter("description") != null) && (!(request.getParameter("description").equals(""))))
            
        {
            description = request.getParameter("description");
        }
        
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        creationTime  = dateFormat.format(calendar.getTime());
        
        
        
        
        
        if ((videoID != null) && (boardID != -1) && (clientID != -1) && (title != null) && (description != null))
            
        {
            postCreate = new TutorialBoardPostCreate(videoID, boardID, clientID, creationTime, message, title, channelTitle, thumbnail, description);
        }
        
        
        
        response.sendRedirect("clients/tutorials.jsp");
        
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
