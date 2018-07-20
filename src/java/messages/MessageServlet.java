/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package messages;

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
@WebServlet(name = "MessageServlet", urlPatterns = {"/MessageServlet"})
public class MessageServlet extends HttpServlet 

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
            out.println("<title>Servlet MessageServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessageServlet at " + request.getContextPath() + "</h1>");
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
        MessageCreate created = null;
        long senderClientID = -1;
        long recipientClientID = -1;
        String message = null;
        String creationTime = null;
        
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        creationTime  = dateFormat.format(calendar.getTime());
        
        
        
        if (request.getParameter("sender-client-id") != null)
            
        {
            senderClientID = Long.parseLong(request.getParameter("sender-client-id"));
        }
        
        if (request.getParameter("recipient-client-id") != null)
            
        {
            recipientClientID = Long.parseLong(request.getParameter("recipient-client-id"));
        }
        
        if (request.getParameter("message") != null)
            
        {
            message = request.getParameter("message");
        }
        
        
        
        
        
        if ((senderClientID != -1) && (recipientClientID != -1) && (message != null))
            
        {
                
            if (!message.equals(""))
                
            {
                
                created = new MessageCreate(message, senderClientID, recipientClientID, creationTime);
                System.out.println("Message received is " + message);
                response.setContentType("text/xml");
                response.getWriter().write("<message>" + message + "</message>");
                
            }
            
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
        MessageCreate created = null;
        long senderClientID = -1;
        long recipientClientID = -1;
        String message = null;
        String creationTime = null;
        
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        creationTime  = dateFormat.format(calendar.getTime());
        
        
        
        if (request.getParameter("sender-client-id") != null)
            
        {
            senderClientID = Long.parseLong(request.getParameter("sender-client-id"));
        }
        
        if (request.getParameter("recipient-client-id") != null)
            
        {
            recipientClientID = Long.parseLong(request.getParameter("recipient-client-id"));
        }
        
        if (request.getParameter("message") != null)
            
        {
            message = request.getParameter("message");
        }
        
        
        System.out.println("Entered servlet.");
        
        
        if ((senderClientID != -1) && (recipientClientID != -1) && (message != null))
            
        {
            
            if (!message.equals(""))
                
            {
                
                created = new MessageCreate(message, senderClientID, recipientClientID, creationTime);
                response.setContentType("text/xml");
                response.getWriter().write("<message>" + message + "</message>");
                
            }
            
        }
        
        
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
