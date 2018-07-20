/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package board;

import board.charges.BoardChargeCreate;
import client.ClientRetrieve;
import creditcard.CreditCardRetrieve;
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
@WebServlet(name = "ClassBoardUpdateServlet", urlPatterns = {"/ClassBoardUpdateServlet"})
public class ClassBoardUpdateServlet extends HttpServlet 

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
            out.println("<title>Servlet ClassBoardUpdateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ClassBoardUpdateServlet at " + request.getContextPath() + "</h1>");
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
            throws ServletException, IOException {
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
        BoardUpdate update = null;
        long boardID = -1;
        int boardClass = 0;
        int boardPrice = 0;
        long accountNumber = -1;
        long clientID = 0;
        String boardName = "";
        ClientRetrieve sessionClient = null;
        boolean validCardExists = true;
        
        

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
        
        if ((request.getParameter("board-id") != null) && (!request.getParameter("board-id").equals("")))
            
        {
            boardID = Long.parseLong(request.getParameter("board-id"));
        }
        
        if ((request.getParameter("account-number") != null) && (!request.getParameter("account-number").equals("")))
            
        {
            accountNumber = Long.parseLong(request.getParameter("account-number"));
        }
        
        
        
        
        
        
        
        if (accountNumber != -1)

        {
            sessionClient = new ClientRetrieve(accountNumber);
            clientID = sessionClient.getClientID();
            


            if (boardClass != 0)

            {

                if (boardClass <= 1)

                {
                    response.sendRedirect("clients/course-boards.jsp");
                }

                else if (boardClass > 1)

                {
                    CreditCardRetrieve card = new CreditCardRetrieve(accountNumber);
                    BoardPayment boardPayment = null;

                    boardPrice = getBoardPrice(boardClass);

                    Calendar calendar = Calendar.getInstance();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
                    String dateString  = dateFormat.format(calendar.getTime());

                    

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
                        boardPayment = new BoardPayment(boardID, boardPrice, card.getCreditCardNumber(), card.getExpiryMonth(), card.getExpiryYear(), card.getCcv());
                        boolean chargeCompleted = false;
                        chargeCompleted = boardPayment.isChargeCompleted();

                        if (chargeCompleted == true)

                        {
                            DateLineConversion conversion = new DateLineConversion(dateString);
                            int chargeMonth = conversion.getMonth();
                            int chargeDay = conversion.getDay();
                            int chargeHour = Integer.parseInt(dateString.substring(8, 10));
                            int chargeMinute = conversion.getMinute();

                            BoardChargeCreate boardChargeCreate = new BoardChargeCreate(boardID, accountNumber, boardPrice, dateString, chargeMonth, chargeDay, chargeHour, chargeMinute);
                            
                            if (boardID != -1)
                                
                            {
                                update = new BoardUpdate(boardID);
                                update.setBoardClass(boardClass);
                            }

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
    
    private int getBoardPrice(int boardClass)
            
    {
        int boardPrice = 0;
        
        if (boardClass == 1)
            
        {
            boardPrice = 0;
        }
        
        else if (boardClass == 2)
            
        {
            boardPrice = 599;
        }
        
        else if (boardClass == 3)
            
        {
            boardPrice = 999;
        }
        
        else if (boardClass == 4)
            
        {
            boardPrice = 2399;
        }
        
        else if (boardClass == 5)
            
        {
            boardPrice = 4499;
        }
        
        else if (boardClass == 6)
            
        {
            boardPrice = 0;
        }
        
        else if (boardClass == 7)
            
        {
            boardPrice = 0;
        }
        
        return boardPrice;
        
    }

}
