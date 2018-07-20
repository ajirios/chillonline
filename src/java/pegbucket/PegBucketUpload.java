/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pegbucket;


import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.CreateBucketRequest;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.io.InputStream;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


/**
 *
 * @author El Jefe
 */
public class PegBucketUpload 

{
    private String fileName;
    private static final String awsAccessKeyID = "AKIAJYXF6XQQ4UH7QAIQ";
    private static final String secretAccessKey = "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";
    private BasicAWSCredentials creds; 
    private AmazonS3 amazonS3Client;
    long lengthOfFileToUpload;
    Bucket newBucket;
    MultipartFile file;
    Part part;
    RedirectAttributes redirectAttributes;
    private static final String s3BucketLocation = "https://s3.ca-central-1.amazonaws.com/pegbucket/";
    final String bucketName = "pegbucket";
    final String key = "image.jpg";
    
    
    public PegBucketUpload(String fileName, Part part) throws InterruptedException, IOException
            
    {
        this.fileName = fileName;
        creds = new BasicAWSCredentials("AKIAJYXF6XQQ4UH7QAIQ", "aKTWqYHHdybdxYwaS+4yMs80EDABjnBF+NWKApj6"); 
        amazonS3Client = AmazonS3ClientBuilder.standard().withCredentials(new AWSStaticCredentialsProvider(creds)).build();
        this.part = part;
        
        System.out.println("My name is Ajiri");
        
        createPegBucket();
        performUpload();
        
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
            
            S3Object s3Object = amazonS3Client.getObject(new GetObjectRequest(bucketName, fileName));
            
            //this.redirectAttributes.addAttribute("picURL", s3Object.getObjectContent().getHttpRequest().getURI().toString());
            
        }
        
        catch(IOException e)
            
        {
            e.printStackTrace();
        }
        
    }
    
}
