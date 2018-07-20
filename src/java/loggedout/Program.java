/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package loggedout;



import java.sql.*;



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
    protected ProgramList programList;
    protected String producerName;
    protected String producerCountry;
    protected Timestamp distributionDate;
    protected Timestamp deletionDate;
    
    public Program(long programID, String programName, String programPoster, String distributor, String locality)
            
    {
        this.programID = programID;
        this.programName = programName;
        this.programPoster = programPoster;
        this.description = null;
        this.distributor = distributor;
        this.locality = locality;
        this.programTeaser = null;
        this.programList = null;
        this.producerName = null;
        this.producerCountry = null;
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

    public String getProducerName() 
    
    {
        return producerName;
    }

    public void setProducerName(String producerName) 
    
    {
        this.producerName = producerName;
    }

    public String getProducerCountry() 
    
    {
        return producerCountry;
    }

    public void setProducerCountry(String producerCountry) 
    
    {
        this.producerCountry = producerCountry;
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

    public ProgramList getProgramList() 
    
    {
        return programList;
    }

    public void setProgramList(ProgramList programList) 
    
    {
        this.programList = programList;
    }
    
}
