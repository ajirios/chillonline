/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package photo.board.posts;

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
@WebServlet(name = "PhotoBoardPostPepperCreateServlet", urlPatterns = {"/PhotoBoardPostPepperCreateServlet"})
public class PhotoBoardPostPepperCreateServlet extends HttpServlet 

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
            out.println("<title>Servlet PhotoBoardPostPepperCreateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PhotoBoardPostPepperCreateServlet at " + request.getContextPath() + "</h1>");
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
        String photoID = null;
        long boardID = -1;
        long postClientID = -1;
        long pepperClientID = -1;
        String postCreationTime = null;
        PhotoBoardPostPepperCreate pepperCreate = null;
        PhotoBoardPostPepperList pepperList = null;
        PhotoBoardPostUpdate postUpdate = null;
        
        System.out.println("In Servlet now.");
        
        if (request.getParameter("photo-id") != null)
            
        {
            photoID = request.getParameter("photo-id");
        }
        
        if (request.getParameter("board-id") != null)
            
        {
            boardID = Long.parseLong(request.getParameter("board-id"));
        }
        
        if (request.getParameter("post-client-id") != null)
            
        {
            postClientID = Long.parseLong(request.getParameter("post-client-id"));
        }
        
        if (request.getParameter("pepper-client-id") != null)
            
        {
            pepperClientID = Long.parseLong(request.getParameter("pepper-client-id"));
        }
        
        if (request.getParameter("post-creation-time") != null)
            
        {
            postCreationTime = request.getParameter("post-creation-time");
        }
        
        
        if ((pepperClientID != -1) && (postClientID != -1) && (boardID != -1) && (photoID != null) && (postCreationTime != null))
            
        {
            
            pepperCreate = new PhotoBoardPostPepperCreate(photoID, boardID, postClientID, pepperClientID, postCreationTime);
            pepperList = new PhotoBoardPostPepperList(photoID, boardID, postClientID, Long.parseLong(postCreationTime));
            long numberOfPeppers = Long.valueOf(pepperList.getSize());
            postUpdate = new PhotoBoardPostUpdate(photoID, boardID, postClientID, postCreationTime);
            postUpdate.setNumberOfPostPeppers(numberOfPeppers);
            
            response.setContentType("text/xml");
            response.getWriter().write("<peppers>" + pepperList.getSize() + "</peppers>");
            
        }
        
        else
            
        {
            response.setContentType("text/xml");
            response.getWriter().write("<peppers>NULL</peppers>");
        }
        
        
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
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
