/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package distribute;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.transfer.TransferManagerConfiguration;

/**
 * Servlet implementation class UploadVideoController
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
maxFileSize = 1024 * 1024 * 50, // 50 MB
maxRequestSize = 1024 * 1024 * 100) //100MB

/**
 *
 * @author El Jefe
 */
public class UploadVideoController extends HttpServlet

{
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "https://s3.ca-central-1.amazonaws.com/pegbucket/";
    private static String bucketName = "pegbucket";

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadVideoController() 

    {
            super();
            // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doGet(HttpServletRequest request,
                    HttpServletResponse response) throws ServletException, IOException 
    
    {
            // TODO Auto-generated method stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request,
                    HttpServletResponse response) throws ServletException, IOException 
    
    {

            //get the s3Client
        BasicAWSCredentials creds = new BasicAWSCredentials("AKIAJYXF6XQQ4UH7QAIQ", "aKTWqYHHdybdxYwaS+4yMs80EDABjnBF+NWKApj6"); 
        AmazonS3 s3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(creds)).build();
        
    //get upload file path
            String uploadFilePath = UPLOAD_DIR;

    //find fileSaveDir from uploadFilePath, if diretory doesn't exist it will be created
            File fileSaveDir = new File(uploadFilePath);
            
            
            if (!fileSaveDir.exists()) 
            
            {
                    fileSaveDir.mkdirs();
            }


            String fileName = null;
            
    //get file part from request
            Part filePart = request.getPart("video-content");

            //get type of file added
            String contentType = filePart.getContentType();

            //get submitted filename. 
            //if you didn't add enctype attribute, we might only get file name
            fileName = filePart.getSubmittedFileName();
            long fileSize = filePart.getSize();                     //get size of file
            File uploadFileName = new File(UPLOAD_DIR + File.separator + fileName);  //get file name

            // As you know we have restricted file type to be selected in out upload-form is video/*,
            // Still it would be better to ensure that content type that we get is video
            if (contentType.startsWith("video/")) 
            
            {

                    try 
                    
                    {
                            System.out.println("Uploading file to s3");
                            s3Client.putObject(bucketName, fileName, uploadFileName);


                    } 
                    
                    catch (AmazonServiceException ase) 
                    
                    {
                            System.out
                                            .println("Caught an AmazonServiceException, which "
                                                            + "means your request made it "
                                                            + "to Amazon S3, but was rejected with an error response"
                                                            + " for some reason.");
                            System.out.println("Error Message:    " + ase.getMessage());
                            System.out.println("HTTP Status Code: " + ase.getStatusCode());
                            System.out.println("AWS Error Code:   " + ase.getErrorCode());
                            System.out.println("Error Type:       " + ase.getErrorType());
                            System.out.println("Request ID:       " + ase.getRequestId());
                    } 
                    
                    catch (AmazonClientException ace) 
                    
                    {
                            System.out.println("Caught an AmazonClientException, which "
                                            + "means the client encountered "
                                            + "an internal error while trying to "
                                            + "communicate with S3, "
                                            + "such as not being able to access the network.");
                            System.out.println("Error Message: " + ace.getMessage());
                    }

            } 
            
            else 
            
            {
                    System.out.println("Invalid File Type.");
            }
            
            response.sendRedirect("distribute.jsp#step5");
            
    }
    
}
