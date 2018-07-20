/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.boards;

import board.BoardRetrieve;
import board.BoardUpdate;
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
@WebServlet(name = "BoardExitServlet", urlPatterns = {"/BoardExitServlet"})
public class BoardExitServlet extends HttpServlet 

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
            out.println("<title>Servlet BoardExitServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BoardExitServlet at " + request.getContextPath() + "</h1>");
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
        AccountBoardDelete deleted = null;
        BoardRetrieve board = null;
        BoardUpdate boardUpdate = null;
        long updateNumberOfMembers = 0;
        
        
        if (request.getParameter("account-number") != null)
            
        {
            accountNumber = Long.parseLong(request.getParameter("account-number"));
        }
        
        if (request.getParameter("board-exit-board-id") != null)
            
        {
            boardID = Long.parseLong(request.getParameter("board-exit-board-id"));
        }
        
        if ((boardID != -1) && (accountNumber != -1))
            
        {
            
            deleted = new AccountBoardDelete(accountNumber, boardID);
            board = new BoardRetrieve(boardID);
            boardUpdate = new BoardUpdate(boardID);
            updateNumberOfMembers = board.getNumberOfMembers();
            updateNumberOfMembers = updateNumberOfMembers - 1;
            boardUpdate.setNumberOfMembers(updateNumberOfMembers);
            
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
