/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board;

import client.ClientRetrieve;
import creditcard.CreditCardRetrieve;
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
@WebServlet(name = "BoardCreateServlet", urlPatterns = {"/BoardCreateServlet"})
public class BoardCreateServlet extends HttpServlet 

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
            out.println("<title>Servlet BoardCreateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BoardCreateServlet at " + request.getContextPath() + "</h1>");
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
        BoardCreate boardCreate = null;
        long accountNumber = -1;
        long clientID = 0;
        int boardClass = 0; 
        String boardName = "";
        String description = "";
        String boardCover = "";
        String registrationDate = "";
        String deletionDate = "";
        String reservationMode = "";   
        String memberType = null;
        String teamName = null;
        String organizationName = null;
        String boardCity = null;
        String boardProvince = null;
        String boardCountry = null;
        String teamLogo = null;
        String searchName = null;
        ClientRetrieve sessionClient = null;
        boolean validCardExists = true;
        

        if (request.getParameter("account-number") != null)

        {
            accountNumber = Long.parseLong(request.getParameter("account-number"));
        }

        if (request.getParameter("member-type") != null)

        {
            memberType = request.getParameter("member-type");
        }

        if (request.getParameter("team-name") != null)

        {
            teamName = request.getParameter("team-name");
        }

        if (request.getParameter("organization-name") != null)

        {
            organizationName = request.getParameter("organization-name");
        }

        if (request.getParameter("board-city") != null)

        {
            boardCity = request.getParameter("board-city");
        }

        if (request.getParameter("board-province") != null)

        {
            boardProvince = request.getParameter("board-province");
        }

        if (request.getParameter("board-country") != null)

        {
            boardCountry = request.getParameter("board-country");
        }
        
        if (request.getParameter("mode") != null)

        {

            if (request.getParameter("mode").equalsIgnoreCase("private"))

            {
                reservationMode = "private";
            }

            if (request.getParameter("mode").equalsIgnoreCase("community"))

            {
                reservationMode = "community";
            }

            if (request.getParameter("mode").equalsIgnoreCase("public"))

            {
                reservationMode = "public";
            }

        }

        if (request.getParameter("description") != null)

        {
            description = request.getParameter("description");
        }

        if (request.getParameter("class") != null)

        {
            if (request.getParameter("class").equalsIgnoreCase("1"))

            {
                boardClass = 1;
            }

            if (request.getParameter("class").equalsIgnoreCase("2"))

            {
                boardClass = 2;
            }

            if (request.getParameter("class").equalsIgnoreCase("3"))

            {
                boardClass = 3;
            }

            if (request.getParameter("class").equalsIgnoreCase("4"))

            {
                boardClass = 4;
            }

            if (request.getParameter("class").equalsIgnoreCase("5"))

            {
                boardClass = 5;
            }

        }

        if (request.getParameter("board-name") != null)

        {
            boardName = request.getParameter("board-name");
        }

        if (request.getParameter("board-poster") != null)

        {
            boardCover = request.getParameter("board-poster");
        }

        if (accountNumber != -1)

        {
            sessionClient = new ClientRetrieve(accountNumber);
            clientID = sessionClient.getClientID();
        }
        
        
        if (boardClass != 0)

        {
            System.out.println("Board class chosen is " + boardClass);
            
            if (boardClass <= 1)
                
            {
                BoardCreate board = new BoardCreate(clientID, boardClass, boardName, description, boardCover, reservationMode);
                board.setMemberType(memberType);
                board.setTeamName(teamName);
                board.setOrganizationName(organizationName);
                board.setBoardCity(boardCity);
                board.setBoardProvince(boardProvince);
                board.setBoardCountry(boardCountry);
                
                response.sendRedirect("clients/board-transaction-approved.jsp");
            }
            
            else if (boardClass > 1)
                
            {
                CreditCardRetrieve card = new CreditCardRetrieve(accountNumber);
                
                if ((card.getCreditCardNumber() != null) && (card.getExpiryMonth() != 0) && (card.getExpiryYear() != 0) && (card.getCcv() != null))
                    
                {
                    validCardExists = true;
                }
                
                else
                    
                {
                    validCardExists = false;
                }
                
                if (validCardExists == true)
                    
                {
                    BoardCreate board = new BoardCreate(clientID, boardClass, boardName, description, boardCover, reservationMode, "paid");
                    
                    boolean chargeCompleted = false;
                    chargeCompleted = board.isChargeCompleted();
                    
                    board.setMemberType(memberType);
                    board.setTeamName(teamName);
                    board.setOrganizationName(organizationName);
                    board.setBoardCity(boardCity);
                    board.setBoardProvince(boardProvince);
                    board.setBoardCountry(boardCountry);
                    
                    if (chargeCompleted == true)
                        
                    {
                        response.sendRedirect("clients/board-transaction-approved.jsp");
                    }
                    
                    else
                        
                    {
                        response.sendRedirect("clients/board-transaction-declined.jsp");
                    }
                    
                }
                
                else
                    
                {
                    response.sendRedirect("clients/board-transaction-declined.jsp");
                }
                
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
