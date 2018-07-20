/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package messages;

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
@WebServlet(name = "MessageListServlet", urlPatterns = {"/MessageListServlet"})
public class MessageListServlet extends HttpServlet 

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
            out.println("<title>Servlet MessageListServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessageListServlet at " + request.getContextPath() + "</h1>");
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
        long senderClientID = -1;
        long recipientClientID = -1;
        MessageList messages = null;
        
        
        
        if (request.getParameter("sender-client-id") != null)
            
        {
            senderClientID = Long.parseLong(request.getParameter("sender-client-id"));
        }
        
        if (request.getParameter("recipient-client-id") != null)
            
        {
            recipientClientID = Long.parseLong(request.getParameter("recipient-client-id"));
        }
        
        
        if ((senderClientID != -1) && (recipientClientID != -1))
            
        {
            
            messages = new MessageList(senderClientID, recipientClientID);
            
            String list = "<?xml version='1.0'?>\n<Messages>\n";
            response.setContentType("text/xml");
            
            for (int count = 0; (count < messages.length()) && (messages.getMessage(count) != null); count++)
                
            {
                
                list += "<Message>\n";
                list += "<Text>" + messages.getMessage(count).getMessage() + "</Text>\n";
                list += "<Sender>" + messages.getMessage(count).getSenderClientID() + "</Sender>\n";
                list += "<Timestamp>" + messages.getMessage(count).getCreationTime() + "</Timestamp>\n";
                list += "</Message>\n";
                
            }
            
            
            list += "</Messages>";
            System.out.println(list);
            
            
            response.getWriter().write(list);
            response.setStatus(HttpServletResponse.SC_OK);
            
        }
        
        else
            
        {
            response.setContentType("text/xml");
            response.getWriter().write("<Messages><Message>null</Message></Messages>");
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
