/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import aws.AWSUploadUtility;
import board.BoardCreate;
import client.ClientRetrieve;
import client.ClientUpdate;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.model.ObjectMetadata;
import creditcard.CreditCardRetrieve;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author El Jefe
 */
@WebServlet(name = "BoardUpload", urlPatterns = {"/BoardUpload"})
public class BoardUpload extends HttpServlet 

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
            out.println("<title>Servlet BoardUpload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BoardUpload at " + request.getContextPath() + "</h1>");
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
        String purpose = "";
        String ready = "yes";
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
        
        
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        Iterator<FileItem> iterator = null;
        String documentType = null;
        InputStream fileIS = null;
        String fileName = null;
        String directoryName = null;
        ClientUpdate clientUpdate = null;
        String uploadedFile = null;
        String fieldValue = null;
        String[] names = new String[15];
        String[] values = new String[15];
        int count = 0;
        
        
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString  = dateFormat.format(calendar.getTime());
        
        
        try
            
        {
            iterator = upload.parseRequest(request).iterator();
        }
        
        catch (FileUploadException e)
            
        {
            e.printStackTrace();
        }
        
        while (iterator.hasNext())
            
        {
            FileItem item = iterator.next();
            
            if (!item.isFormField())
                
            {
                
                documentType = item.getContentType();
                fileIS = item.getInputStream();
                fileName = dateString + "-" + item.getName();
                
                
                if (!fileName.equals(dateString + "-"))
                    
                {
                    
                    AWSCredentials credentials = new BasicAWSCredentials("AKIAJYXF6XQQ4UH7QAIQ", "aKTWqYHHdybdxYwaS+4yMs80EDABjnBF+NWKApj6");
                    String bucketName = "pegbucket";
                    AWSUploadUtility s3Client = new AWSUploadUtility();
                    ObjectMetadata metadata = new ObjectMetadata();
                    metadata.setContentLength(Long.valueOf(fileIS.available()));
                    directoryName = "boards/wallpapers/" + fileName;
                    s3Client.uploadfile(credentials, bucketName, directoryName, fileIS, metadata);
                    uploadedFile = "https://s3.ca-central-1.amazonaws.com/pegbucket/boards/wallpapers/" + fileName;

                    names[count] = "upload-directory";
                    values[count] = uploadedFile;
                    System.out.println("Uploaded " + uploadedFile);
                    
                }
                
            }
            
            else
                
            {
                
                String fieldName = item.getFieldName();
                fieldValue = item.getString();
                
                names[count] = fieldName;
                values[count] = fieldValue;
                
            }
                
            count++;
            
        }
        
        
        
        for (count = 0; count < 15; count++)
            
        {
            
            if (names[count] != null)
                
            {
                
                if (names[count].equalsIgnoreCase("account-number"))
                    
                {
                    accountNumber = Long.parseLong(values[count]);
                }

                else if (names[count].equalsIgnoreCase("purpose"))

                {

                    if (values[count].equalsIgnoreCase("leisure"))

                    {
                        purpose = "leisure";
                    }

                    if (values[count].equalsIgnoreCase("course"))

                    {
                        purpose = "course";
                    }

                    if (values[count].equalsIgnoreCase("job"))

                    {
                        purpose = "job";
                    }
                    
                }

                else if (names[count].equalsIgnoreCase("member-type"))

                {
                    memberType = values[count];
                }

                else if (names[count].equalsIgnoreCase("team-name"))

                {
                    teamName = values[count];
                }

                else if (names[count].equalsIgnoreCase("organization-name"))

                {
                    organizationName = values[count];
                }

                else if (names[count].equalsIgnoreCase("board-city"))

                {
                    boardCity = values[count];
                }

                else if (names[count].equalsIgnoreCase("board-province"))

                {
                    boardProvince = values[count];
                }

                else if (names[count].equalsIgnoreCase("board-country"))

                {
                    boardCountry = values[count];
                }

                else if (names[count].equalsIgnoreCase("mode"))

                {

                    if (values[count].equalsIgnoreCase("private"))

                    {
                        reservationMode = "private";
                    }

                    if (values[count].equalsIgnoreCase("community"))

                    {
                        reservationMode = "community";
                    }

                    if (values[count].equalsIgnoreCase("public"))

                    {
                        reservationMode = "public";
                    }
                    
                }

                else if (names[count].equalsIgnoreCase("description"))

                {
                    description = values[count];
                }

                else if (names[count].equalsIgnoreCase("class"))

                {

                    boardClass = Integer.parseInt(values[count]);

                }

                else if (names[count].equalsIgnoreCase("board-name"))

                {
                    boardName = values[count];
                }

                else if ((count < 9) && (names[count].equalsIgnoreCase("upload-directory")))

                {
                    teamLogo = values[count];
                }
                
                else if ((count > 9) && (names[count].equalsIgnoreCase("upload-directory")))

                {
                    boardCover = values[count];
                }

                
            }
            
        }
        
        
        
        
        if (boardCover == null)
            
        {
            boardCover = "https://s3.ca-central-1.amazonaws.com/pegbucket/boards/wallpapers/toronto.jpg";
        }
        
        else
            
        {
            if (boardCover.equals(""))
                
            {
                boardCover = "https://s3.ca-central-1.amazonaws.com/pegbucket/boards/wallpapers/toronto.jpg";
            }
        }
        
        
        

        if (accountNumber != -1)

        {
            sessionClient = new ClientRetrieve(accountNumber);
            clientID = sessionClient.getClientID();
            
        }
        
        else
            
        {
            response.sendRedirect("clients/board-transaction-declined.jsp");
        }
        
        
        if (boardClass != 0)

        {
            
            if (boardClass <= 1)
                
            {
                BoardCreate board = new BoardCreate(clientID, boardClass, boardName, description, boardCover, reservationMode);
                board.setMemberType(memberType);
                board.setTeamName(teamName);
                board.setTeamLogo(teamLogo);
                board.setOrganizationName(organizationName);
                board.setBoardCity(boardCity);
                board.setBoardProvince(boardProvince);
                board.setBoardCountry(boardCountry);
                board.setPurpose(purpose);
                board.setReady(ready);
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
                    board.setMemberType(memberType);
                    board.setTeamName(teamName);
                    board.setTeamLogo(teamLogo);
                    board.setOrganizationName(organizationName);
                    board.setBoardCity(boardCity);
                    board.setBoardProvince(boardProvince);
                    board.setBoardCountry(boardCountry);
                    board.setPurpose(purpose);
                    board.setReady(ready);
                    
                    boolean chargeCompleted = false;
                    chargeCompleted = board.isChargeCompleted();
                    
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
        
        else
            
        {
            response.sendRedirect("clients/board-transaction-declined.jsp");
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
