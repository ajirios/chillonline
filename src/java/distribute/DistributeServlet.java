/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package distribute;


import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@WebServlet("/DistributeServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*200, //200MB
        maxFileSize=1024*1024*1000,               //1000MB
        maxRequestSize=1024*1024*500)            //500MB


/**
 *
 * @author Ajiri Osauzo Jeffrey
 */
public class DistributeServlet extends HttpServlet

{
    private String fileName;
    BasicAWSCredentials creds; 
    AmazonS3 amazonS3Client;
    long lengthOfFileToUpload;
    Bucket newBucket;
    MultipartFile file;
    Part part;
    RedirectAttributes redirectAttributes;
    final String bucketName = "pegbucket";
    final String key = "image.jpg";
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
            
    {
        
        creds = new BasicAWSCredentials("AKIAJYXF6XQQ4UH7QAIQ", "aKTWqYHHdybdxYwaS+4yMs80EDABjnBF+NWKApj6"); 
        amazonS3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(creds)).build();
        this.part = request.getPart("distributor-logo");
        this.fileName = "image.jpg";
        
        System.out.println("My name is Ajiri");
        
        //createPegBucket();
        performUpload();
        response.sendRedirect("distribute.jsp");
        
        //request.setAttribute("message", "Upload has been done successfully!");
        //getServletContext().getRequestDispatcher("/message2.jsp").forward(request, response);
        
    }
    
    private String extractFileName(Part part)
            
    {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        
        for (String s : items)
            
        {
            if (s.trim().startsWith("fileName"))
                
            {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        
        return "";
        
    }
    
    private void createPegBucket()
            
    {
        amazonS3Client.createBucket(bucketName);
    }
    
    private void performUpload()
            
    {
        try
            
        {
            InputStream is = part.getInputStream();
            
            amazonS3Client.putObject(new PutObjectRequest(bucketName, fileName, is, new ObjectMetadata()).withCannedAcl(CannedAccessControlList.PublicRead));
            
            
            //S3Object s3Object = s3Client.getObject(new GetObjectRequest(bucketName, fileName));
            
            //this.redirectAttributes.addAttribute("picURL", s3Object.getObjectContent().getHttpRequest().getURI().toString());
            
        }
        
        catch(IOException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
