/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package invitations.mail;

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
@WebServlet(name = "InvitationMailSendServlet", urlPatterns = {"/InvitationMailSendServlet"})
public class InvitationMailSendServlet extends HttpServlet 

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
            out.println("<title>Servlet InvitationMailSendServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InvitationMailSendServlet at " + request.getContextPath() + "</h1>");
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
        InvitationMailPost mailPost = null;
        String senderFirstName = null;
        String senderClientName = null;
        String boardName = null;
        String boardHostName = null;
        String boardAccessMode = null;
        String gender = null;
        String teamName = null;
        String organizationName = null;
        int boardCount = 0;
        String[] firstNames = new String[50];
        String[] lastNames = new String[50];
        String[] emails = new String[50];
        int count;
        MailingList mailingList = new MailingList();
        
        
        if (request.getParameter("sender-first-name") != null)
            
        {
            senderFirstName = request.getParameter("sender-first-name");
        }
        
        if (request.getParameter("sender-client-name") != null)
            
        {
            senderClientName = request.getParameter("sender-client-name");
        }
        
        if (request.getParameter("host-client-name") != null)
            
        {
            boardHostName = request.getParameter("host-client-name");
        }
        
        if (request.getParameter("board-name") != null)
            
        {
            boardName = request.getParameter("board-name");
        }
        
        if (request.getParameter("board-count") != null)
            
        {
            boardCount = Integer.parseInt(request.getParameter("board-count"));
        }
        
        if (request.getParameter("access-mode") != null)
            
        {
            boardAccessMode = request.getParameter("access-mode");
        }
        
        if (request.getParameter("gender") != null)
            
        {
            gender = request.getParameter("gender");
        }
        
        if (request.getParameter("team-name") != null)
            
        {
            teamName = request.getParameter("team-name");
        }
        
        if (request.getParameter("organization-name") != null)
            
        {
            organizationName = request.getParameter("organization-name");
        }
        
        
        
        
        for (count = 0; count < 50; count++)
            
        {
            
            String counter = String.valueOf(count);
            
            if (request.getParameter("first-name-" + counter) != null)
                
            {
                firstNames[count] = request.getParameter("first-name-" + counter);
            }
            
            if (request.getParameter("last-name-" + counter) != null)
                
            {
                lastNames[count] = request.getParameter("last-name-" + counter);
            }
            
            if (request.getParameter("email-" + counter) != null)
                
            {
                emails[count] = request.getParameter("email-" + counter);
            }
            
        }
        
        
        
        for (count = 0; count < 50; count++)
            
        {
            
            if ((emails[count] != null) && (firstNames[count] != null))
                
            {
                
                mailPost = new InvitationMailPost(emails[count], firstNames[count], senderClientName, boardName, boardAccessMode, boardCount, teamName, gender);
                
            }
            
        }
        
        
        /*
        firstNames = new String[150];
        lastNames = new String[150];
        emails = new String[150];
        
        
        
        
        for (count = 0; (count < 150) && (mailingList.getStudent(count) != null); count++)
            
        {
            
            firstNames[count] = mailingList.getStudent(count).getFirstName();
            lastNames[count] = mailingList.getStudent(count).getLastName();
            emails[count] = mailingList.getStudent(count).getEmail();
            
            if ((emails[count] != null) && (firstNames[count] != null))
                
            {
                
                mailPost = new InvitationMailPost(emails[count], firstNames[count], senderClientName, boardName, boardAccessMode, boardCount, teamName, gender);
                System.out.println(mailingList.getStudent(count).getFirstName() + " " + mailingList.getStudent(count).getLastName() + " " + mailingList.getStudent(count).getEmail());
                
            }
            
        }
        
        */
        
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
