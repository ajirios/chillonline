/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package notice.board.posts;

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
@WebServlet(name = "NoticeBoardPostCreateServlet", urlPatterns = {"/NoticeBoardPostCreateServlet"})
public class NoticeBoardPostCreateServlet extends HttpServlet 

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
            out.println("<title>Servlet NoticeBoardPostCreateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NoticeBoardPostCreateServlet at " + request.getContextPath() + "</h1>");
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
        NoticeBoardPostCreate postCreate = null;
        long boardID = -1;
        long clientID = -1;
        String creationTime = null;
        String message = null;
        
        
        if (request.getParameter("notice-post-board-id") != null)
            
        {
            boardID = Long.parseLong(request.getParameter("notice-post-board-id"));
        }
        
        if (request.getParameter("notice-post-client-id") != null)
            
        {
            clientID = Long.parseLong(request.getParameter("notice-post-client-id"));
        }
        
        if (request.getParameter("notice-post-message") != null)
            
        {
            message = request.getParameter("notice-post-message");
        }
        
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        creationTime  = dateFormat.format(calendar.getTime());
        
        
        
        if ((boardID != -1) && (clientID != -1))
            
        {
            postCreate = new NoticeBoardPostCreate(boardID, clientID, creationTime, message);
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
