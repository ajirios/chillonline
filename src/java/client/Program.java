/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;


import java.sql.*;
import java.util.Date;


/**
 *
 * @author El Jefe
 */
public class Program 

{
    protected long programID;
    protected String programName;
    protected String programPoster;
    protected String description;
    protected String distributor;
    protected String locality;
    protected String programTeaser;
    protected ContentList contentList;
    protected String producer;
    protected String productionCompany;
    protected Timestamp distributionDate;
    protected Timestamp deletionDate;
    
    public Program(String programName, String programPoster, String distributor, String locality)
            
    {
        this.programID = -1;
        this.programName = programName;
        this.programPoster = programPoster;
        this.description = null;
        this.distributor = distributor;
        this.locality = locality;
        this.programTeaser = null;
        this.contentList = null;
        this.producer = null;
        this.productionCompany = null;
        this.distributionDate = null;
        this.deletionDate = null;
    }

    public long getProgramID() 
    
    {
        return programID;
    }

    public void setProgramID(int programID) 
    
    {
        this.programID = programID;
    }

    public String getProgramName() 
    
    {
        return programName;
    }

    public void setProgramName(String programName) 
    
    {
        this.programName = programName;
    }

    public String getProgramPoster() 
    
    {
        return programPoster;
    }

    public void setProgramPoster(String programPoster) 
    
    {
        this.programPoster = programPoster;
    }

    public String getDescription() 
    
    {
        return description;
    }

    public void setDescription(String description) 
    
    {
        this.description = description;
    }

    public String getDistributor() 
    
    {
        return distributor;
    }

    public void setDistributor(String distributor) 
    
    {
        this.distributor = distributor;
    }

    public String getLocality() 
    
    {
        return locality;
    }

    public void setLocality(String locality) 
    
    {
        this.locality = locality;
    }

    public String getProducer() 
    
    {
        return producer;
    }

    public void setProducer(String producer) 
    
    {
        this.producer = producer;
    }

    public String getProductionCompany() 
    
    {
        return productionCompany;
    }

    public void setProductionCompany(String productionCompany) 
    
    {
        this.productionCompany = productionCompany;
    }

    public Timestamp getDistributionDate() 
    
    {
        return distributionDate;
    }

    public void setDistributionDate(Timestamp distributionDate) 
    
    {
        this.distributionDate = distributionDate;
    }

    public Timestamp getDeletionDate() 
    
    {
        return deletionDate;
    }

    public void setDeletionDate(Timestamp deletionDate) 
    
    {
        this.deletionDate = deletionDate;
    }

    public String getProgramTeaser() 
    
    {
        return programTeaser;
    }

    public void setProgramTeaser(String programTeaser) 
    
    {
        this.programTeaser = programTeaser;
    }

    public ContentList getContentList() 
    
    {
        return contentList;
    }

    public void setContentList(ContentList contentList) 
    
    {
        this.contentList = contentList;
    }
    
}
