/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package photo.board.posts;

import client.ClientRetrieve;
import dateline.DateLineConversion;
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
@WebServlet(name = "PhotoBoardPostCommentCreateServlet", urlPatterns = {"/PhotoBoardPostCommentCreateServlet"})
public class PhotoBoardPostCommentCreateServlet extends HttpServlet 

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
            out.println("<title>Servlet PhotoBoardPostCommentCreateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PhotoBoardPostCommentCreateServlet at " + request.getContextPath() + "</h1>");
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
        long commentClientID = -1;
        String postCreationTime = null;
        String commentCreationTime = null;
        String message = null;
        
        PhotoBoardPostCommentCreate commentCreate = null;
        PhotoBoardPostCommentList commentList = null;
        PhotoBoardPostUpdate postUpdate = null;
        
        
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
        
        if (request.getParameter("comment-client-id") != null)
            
        {
            commentClientID = Long.parseLong(request.getParameter("comment-client-id"));
        }
        
        if (request.getParameter("post-creation-time") != null)
            
        {
            postCreationTime = request.getParameter("post-creation-time");
        }
        
        if (request.getParameter("message") != null)
            
        {
            message = request.getParameter("message");
        }
        
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        commentCreationTime  = dateFormat.format(calendar.getTime());
        
        
        
        if ((commentClientID != -1) && (postClientID != -1) && (boardID != -1) && (photoID != null) && (postCreationTime != null))
            
        {
            
            commentCreate = new PhotoBoardPostCommentCreate(photoID, boardID, postClientID, commentClientID, postCreationTime, commentCreationTime, message);
            commentList = new PhotoBoardPostCommentList(photoID, boardID, postClientID, Long.parseLong(postCreationTime));
            long numberOfComments = Long.valueOf(commentList.getSize());
            postUpdate = new PhotoBoardPostUpdate(photoID, boardID, postClientID, postCreationTime);
            postUpdate.setNumberOfPostComments(numberOfComments);
            
            DateLineConversion conversion = new DateLineConversion(commentCreationTime);
            ClientRetrieve clientRetrieve = new ClientRetrieve(commentClientID, "client");
            
            String comment = "<?xml version='1.0'?>\n<Comment>\n";
            response.setContentType("text/xml");
            
            comment += "<size>" + commentList.getSize() + "</size>\n";
            comment += "<commenter>" + clientRetrieve.getClientName() + "</commenter>\n";
            comment += "<timestamp>" + conversion.getPostTimestamp() + "</timestamp>\n";
            comment += "</Comment>\n";
            
            System.out.println(comment);
            
            response.getWriter().write(comment);
            response.setStatus(HttpServletResponse.SC_OK);
            
        }
        
        else
            
        {
            response.setContentType("text/xml");
            response.getWriter().write("<Comment>NULL</Comment>");
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
        processRequest(request, response);
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
