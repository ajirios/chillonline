/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import aws.AWSUploadUtility;
import client.ClientUpdate;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.model.ObjectMetadata;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.InputStream;
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
@WebServlet(name = "UploadFile", urlPatterns = {"/UploadFile"})
public class UploadFile extends HttpServlet 

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
            out.println("<title>Servlet UploadFile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UploadFile at " + request.getContextPath() + "</h1>");
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
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        Iterator<FileItem> iterator = null;
        String documentType = null;
        InputStream fileIS = null;
        String fileName = null;
        String directoryName = null;
        ClientUpdate clientUpdate = null;
        long accountNumber = -1;
        String uploadedPicture = null;
        String fieldValue = null;
        
        
        if (request.getParameter("account-number") != null)
            
        {
            accountNumber = Long.parseLong(request.getParameter("account-number"));
        }
        
        else
            
        {
            accountNumber = 12345;
        }
        
        
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
                fileName = String.valueOf(accountNumber) + "-" + item.getName();
                
                AWSCredentials credentials = new BasicAWSCredentials("AKIAJYXF6XQQ4UH7QAIQ", "aKTWqYHHdybdxYwaS+4yMs80EDABjnBF+NWKApj6");
                String bucketName = "pegbucket";
                
                AWSUploadUtility s3Client = new AWSUploadUtility();
                ObjectMetadata metadata = new ObjectMetadata();
                metadata.setContentLength(Long.valueOf(fileIS.available()));
                directoryName = "clients/files/" + fileName;
                
                System.out.println("Trying to upload " + directoryName + " to account " + accountNumber);
                
                if (accountNumber != -1)

                {
                    s3Client.uploadfile(credentials, bucketName, directoryName, fileIS, metadata);
                    uploadedPicture = "https://s3.ca-central-1.amazonaws.com/pegbucket/clients/files/" + String.valueOf(accountNumber) + "-" + fileName;
                    //clientUpdate = new ClientUpdate(accountNumber);
                    //clientUpdate.setProfilePicture(uploadedPicture);
                    System.out.println("Trying to upload file " + uploadedPicture);
                }
                
                
            }
            
            else
                
            {
                
                String fieldName = item.getFieldName();
                System.out.println("Form field name: " + fieldName);
                fieldValue = item.getString();
                System.out.println("Form field value: " + fieldValue);
                
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
