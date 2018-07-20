/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.boards;

import board.BoardRetrieve;
import board.BoardUpdate;
import client.ClientRetrieve;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import join.board.posts.JoinBoardPostCreate;

/**
 *
 * @author El Jefe
 */
@WebServlet(name = "SearchBoardJoinServlet", urlPatterns = {"/SearchBoardJoinServlet"})
public class SearchBoardJoinServlet extends HttpServlet 

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
            out.println("<title>Servlet SearchBoardJoinServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchBoardJoinServlet at " + request.getContextPath() + "</h1>");
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
        long accountNumber = -1;
        long boardID = -1;
        long clientID = -1;
        String creationTime = null;
        ClientRetrieve clientRetrieve = null;
        JoinBoardPostCreate postCreate = null;
        AccountBoardCreate boardCreate = null;
        AccountBoardInvitationDelete invitationDelete = null;
        BoardRetrieve board = null;
        BoardUpdate boardUpdate = null;
        long updateNumberOfMembers = 0;
        int boardClass = 0;
        long maximumNumberOfMembers = 0;
        
        if (request.getParameter("search-board-join-account-number") != null)
            
        {
            accountNumber = Long.parseLong(request.getParameter("search-board-join-account-number"));
        }
        
        if (request.getParameter("search-board-join-board-id") != null)
            
        {
            boardID = Long.parseLong(request.getParameter("search-board-join-board-id"));
        }
        
        if (boardID != -1)
            
        {
            board = new BoardRetrieve(boardID);
            boardClass = board.getBoardClass();
            
            if (boardClass == 1)
                
            {
                maximumNumberOfMembers = 10;
            }
            
            else if (boardClass == 2)
                
            {
                maximumNumberOfMembers = 60;
            }
            
            else if (boardClass == 3)
                
            {
                maximumNumberOfMembers = 200;
            }
            
            else if (boardClass == 4)
                
            {
                maximumNumberOfMembers = 1000;
            }
            
            else 
                
            {
                maximumNumberOfMembers = Long.valueOf("100000000");
            }
            
            if (board.getNumberOfMembers() <= maximumNumberOfMembers)
                
            {
                boardCreate = new AccountBoardCreate(accountNumber, boardID);
                boardUpdate = new BoardUpdate(boardID);
                updateNumberOfMembers = board.getNumberOfMembers();
                updateNumberOfMembers = updateNumberOfMembers + 1;
                boardUpdate.setNumberOfMembers(updateNumberOfMembers);
            }
            
            invitationDelete = new AccountBoardInvitationDelete(accountNumber, boardID);
            
            clientRetrieve = new ClientRetrieve(accountNumber);
            clientID = clientRetrieve.getClientID();
            
            Calendar calendar = Calendar.getInstance();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
            creationTime  = dateFormat.format(calendar.getTime());
            
            
            if ((boardID != -1) && (clientID != -1))
                
            {
                postCreate = new JoinBoardPostCreate(boardID, clientID, creationTime);
            }
            
        }
        
        response.sendRedirect("clients/course-boards.jsp");
        
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
