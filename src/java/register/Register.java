/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package register;

import account.AccountCreate;
import account.boards.AccountBoardCreate;
import account.boards.BoardSearch;
import board.Board;
import board.BoardCreate;
import board.BoardUpdate;
import client.Client;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author El Jefe
 */
public class Register extends HttpServlet 

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
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    
    {
        //processRequest(request, response);
        Client client;
        AccountCreate account;
        BoardSearch searchedBoard;
        BoardCreate createdBoard;
        AccountBoardCreate accountBoard;
        BoardUpdate boardUpdate = null;
        long updateNumberOfMembers = 0;
        String searchName;
        String accountNumber;
        String firstName;
        String lastName;
        String organization;
        String city;
        String province;
        String country;
        String gender;
        String email;
        String password;
        String passwordConfirmation;
        int count;
        
        accountNumber = "00001";
        firstName = null;
        lastName = null;
        organization = null;
        city = null;
        province = null;
        country = null;
        gender = null;
        email = null;
        password = null;
        passwordConfirmation = null;
        createdBoard = null;
        searchedBoard = null;
        accountBoard = null;
        searchName = null;
        

        if (request.getParameter("firstname") != null)
        {
            firstName = request.getParameter("firstname");
        }

        if (request.getParameter("lastname") != null)
        {
            lastName = request.getParameter("lastname");
        }

        if (request.getParameter("organization") != null)
        {
            organization = request.getParameter("organization");
        }

        if (request.getParameter("city") != null)
        {
            city = request.getParameter("city");
        }

        if (request.getParameter("province") != null)
        {
            province = request.getParameter("province");
        }

        if (request.getParameter("country") != null)
        {
            country = request.getParameter("country");
        }

        if (request.getParameter("gender") != null)
        {
            gender = request.getParameter("gender");
        }

        if (request.getParameter("email") != null)
        {
            email = request.getParameter("email");
        }

        if (request.getParameter("password") != null)
        {
            password = request.getParameter("password");
        }

        passwordConfirmation = request.getParameter("confirmation");
        
        
        
        //city board properties
        searchName = city + " Community";
        String cityPurpose = "leisure";
        int boardClass = 7;
        String description = "The official board of members of the " + city + " community.";
        String boardCover = "https://s3.ca-central-1.amazonaws.com/pegbucket/boards/wallpapers/toronto.jpg";
        String reservationMode = "community";
        String memberType = "citizens";
        String teamName = city;
        String organizationName = city;
        String boardCity = city;
        String boardProvince = province;
        String boardCountry = country;
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString  = dateFormat.format(calendar.getTime());
        int creationMonth = Integer.parseInt(dateString.substring(4, 6));
        int creationDay = Integer.parseInt(dateString.substring(6, 8));
        int creationHour = Integer.parseInt(dateString.substring(8, 10));
        int creationMinute = Integer.parseInt(dateString.substring(10, 12));
        long clientID = 0;
        boolean searchFound = false;
        Board foundBoard = null;
        
        
        
        //organizational board properties
        int organizationBoardClass = 7;
        String organizationPurpose = "course";
        String ready = "yes";
        String organizationBoardDescription = "The official board of members of " + organization;
        String organizationBoardCover = "https://s3.ca-central-1.amazonaws.com/pegbucket/boards/wallpapers/z.jpg";
        String organizationBoardPublicity = "private";
        String orgMemberType = "members";
        String orgTeamName = organization;
        String orgOrganizationName = organization;
        String orgBoardCity = city;
        String orgBoardProvince = province;
        String orgBoardCountry = country;
        boolean organizationSearchFound = false;
        Board foundOrganizationBoard = null;
        
        
        
        if ((password.equals(passwordConfirmation)) && (accountNumber != null))
            
        {
            client = new Client(firstName, lastName, city, province, country, gender, email, password);
            client.setOrganization(organization);
            account = new AccountCreate(client.getClientID(), "client", email, password);
            accountNumber = String.valueOf(account.getAccountNumber());
            HttpSession session = request.getSession();
            session.setAttribute("account-number", accountNumber);
            session.setMaxInactiveInterval(6*60*60);
            
            searchedBoard = new BoardSearch(searchName);
            
            if (searchedBoard.getSize() <= 0)
                
            {
                createdBoard = new BoardCreate(clientID, boardClass, searchName, description, boardCover, reservationMode);
                createdBoard.setMemberType(memberType);
                createdBoard.setTeamName(teamName);
                createdBoard.setOrganizationName(organizationName);
                createdBoard.setBoardCity(boardCity);
                createdBoard.setBoardProvince(boardProvince);
                createdBoard.setBoardCountry(boardCountry);
                createdBoard.setCreationMonth(creationMonth);
                createdBoard.setCreationDay(creationDay);
                createdBoard.setCreationHour(creationHour);
                createdBoard.setCreationMinute(creationMinute);
                createdBoard.setPurpose(cityPurpose);
                accountBoard = new AccountBoardCreate(account.getAccountNumber(), createdBoard.getBoardID());
            }
            
            else 
                
            {
                
                for (count = 0; (count < searchedBoard.length()) && (searchedBoard.getBoard(count) != null) && (searchFound == false); count++)
                    
                {
                    
                    if (searchedBoard.getBoard(count).getBoardClass() > 5)
                        
                    {
                        foundBoard = searchedBoard.getBoard(count);
                        accountBoard = new AccountBoardCreate(account.getAccountNumber(), foundBoard.getBoardID());
                        boardUpdate = new BoardUpdate(foundBoard.getBoardID());
                        updateNumberOfMembers = foundBoard.getNumberOfMembers();
                        updateNumberOfMembers = updateNumberOfMembers + 1;
                        boardUpdate.setNumberOfMembers(updateNumberOfMembers);
                        searchFound = true;
                    }
                    
                }
            
            }
            
            
            searchedBoard = new BoardSearch("Students in " + organization);
            
            if (searchedBoard.getSize() <= 0)
                
            {
                //create the free board and redirect
                createdBoard = new BoardCreate(clientID, organizationBoardClass, "Students in " + organization, organizationBoardDescription, organizationBoardCover, organizationBoardPublicity);
                createdBoard.setMemberType(orgMemberType);
                createdBoard.setTeamName(orgTeamName);
                createdBoard.setOrganizationName(orgOrganizationName);
                createdBoard.setBoardCity(orgBoardCity);
                createdBoard.setBoardProvince(orgBoardProvince);
                createdBoard.setBoardCountry(orgBoardCountry);
                createdBoard.setPurpose(organizationPurpose);
                createdBoard.setReady(ready);
                createdBoard.setCreationMonth(creationMonth);
                createdBoard.setCreationDay(creationDay);
                createdBoard.setCreationHour(creationHour);
                createdBoard.setCreationMinute(creationMinute);
                accountBoard = new AccountBoardCreate(account.getAccountNumber(), createdBoard.getBoardID());
            }
            
            else 
                
            {
                
                for (count = 0; (count < searchedBoard.length()) && (searchedBoard.getBoard(count) != null) && (organizationSearchFound == false); count++)
                    
                {
                    
                    if (searchedBoard.getBoard(count).getBoardClass() > 5)
                        
                    {
                        foundOrganizationBoard = searchedBoard.getBoard(count);
                        accountBoard = new AccountBoardCreate(account.getAccountNumber(), foundOrganizationBoard.getBoardID());
                        boardUpdate = new BoardUpdate(foundOrganizationBoard.getBoardID());
                        updateNumberOfMembers = foundOrganizationBoard.getNumberOfMembers();
                        updateNumberOfMembers = updateNumberOfMembers + 1;
                        boardUpdate.setNumberOfMembers(updateNumberOfMembers);
                        organizationSearchFound = true;
                    }
                    
                }
            
            }
            
            
            
            response.sendRedirect("clients/course-boards.jsp");
            
        }
        
        else
            
        {
            response.sendRedirect("index.jsp");
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
