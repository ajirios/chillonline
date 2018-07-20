/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account.requests;

import account.connections.ConnectionCreate;
import account.connections.ConnectionSearch;
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
@WebServlet(name = "ConnectionRequestAcceptServlet", urlPatterns = {"/ConnectionRequestAcceptServlet"})
public class ConnectionRequestAcceptServlet extends HttpServlet 

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
            out.println("<title>Servlet ConnectionRequestAcceptServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConnectionRequestAcceptServlet at " + request.getContextPath() + "</h1>");
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
        ConnectionSearch connectionExistsSearch = null;
        boolean connectionExists = false;
        ConnectionCreate connection = null;
        ConnectionRequestDelete connectionRequestDelete = null;
        long sessionAccountNumber = -1;
        long clientID = -1;
        long accountNumber = -1;
        long sessionClientID = -1;
        
        if (request.getParameter("connection-request-accept-account-number") != null)
            
        {
            sessionAccountNumber = Long.parseLong(request.getParameter("connection-request-accept-account-number"));
        }
        
        if (request.getParameter("connection-request-accept-client-id") != null)
            
        {
            clientID = Long.parseLong(request.getParameter("connection-request-accept-client-id"));
        }
        
        if (request.getParameter("connection-request-acceptee-account-number") != null)
            
        {
            accountNumber = Long.parseLong(request.getParameter("connection-request-acceptee-account-number"));
        }
        
        if (request.getParameter("connection-request-acceptee-client-id") != null)
            
        {
            sessionClientID = Long.parseLong(request.getParameter("connection-request-acceptee-client-id"));
        }
        
        connectionExistsSearch = new ConnectionSearch(sessionAccountNumber, clientID);
        connectionExists = connectionExistsSearch.search();
        
        if (sessionAccountNumber != -1)
            
        {
            
            if (connectionExists == false)
                
            {
                connection = new ConnectionCreate(sessionAccountNumber, clientID);
                connection = new ConnectionCreate(accountNumber, sessionClientID);
                connectionRequestDelete = new ConnectionRequestDelete(sessionAccountNumber, clientID);
            }
            
            else

            {
                connectionRequestDelete = new ConnectionRequestDelete(sessionAccountNumber, clientID);
            }
            
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
