/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

/**
 *
 * @author El Jefe
 */
public class AccountSettings 

{
    private long clientID;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String middleName;
    private String homeAddress;
    private String city;
    private String province;
    private String country;
    private String gender;
    private String phoneNumber;
    private String postalCode;
    private String wallPaper;
    private String profilePicture;
    private String securityQuestion1;
    private String securityQuestion2;
    private String securityQuestion3;
    private String securityQuestion4;
    private String securityQuestion5;
    private String securityAnswer1;
    private String securityAnswer2;
    private String securityAnswer3;
    private String securityAnswer4;
    private String securityAnswer5;
    private MovieList movieList;
    private TVSeriesList seriesList;
    private VideoList videoList;
    private TVChannelList tvChannelList;
    private RadioChannelList radioChannelList;
    private MusicList musicList;
    private GameList gameList;
    private PictureList pictureList;
    
    public AccountSettings(long clientID, String email, String password)
            
    {
        this.clientID = clientID;
        this.email = email;
        this.password = password;
        this.firstName = null;
        this.lastName = null;
        this.middleName = null;
        this.homeAddress = null;
        this.city = null;
        this.province = null;
        this.country = null;
        this.gender = null;
        this.phoneNumber = null;
        this.postalCode = null;
        this.wallPaper = null;
        this.profilePicture = null;
        this.securityQuestion1 = null;
        this.securityQuestion2 = null;
        this.securityQuestion3 = null;
        this.securityQuestion4 = null;
        this.securityQuestion5 = null;
        this.securityAnswer1 = null;
        this.securityAnswer2 = null;
        this.securityAnswer3 = null;
        this.securityAnswer4 = null;
        this.securityAnswer5 = null;
        this.movieList = null;
        this.seriesList = null;
        this.musicList = null;
        this.videoList = null;
        this.tvChannelList = null;
        this.radioChannelList = null;
        this.gameList = null;
        this.pictureList = null;
    }

    public long getClientID() 
    
    {
        return clientID;
    }

    public void setClientID(long clientID) 
    
    {
        this.clientID = clientID;
    }

    public String getEmail() 
    
    {
        return email;
    }

    public void setEmail(String email) 
    
    {
        this.email = email;
    }

    public String getPassword() 
    
    {
        return password;
    }

    public void setPassword(String password) 
    
    {
        this.password = password;
    }

    public String getFirstName() 
    
    {
        return firstName;
    }

    public void setFirstName(String firstName) 
    
    {
        this.firstName = firstName;
    }

    public String getLastName() 
    
    {
        return lastName;
    }

    public void setLastName(String lastName) 
    
    {
        this.lastName = lastName;
    }

    public String getMiddleName() 
    
    {
        return middleName;
    }

    public void setMiddleName(String middleName) 
    
    {
        this.middleName = middleName;
    }

    public String getHomeAddress() 
    
    {
        return homeAddress;
    }

    public void setHomeAddress(String homeAddress) 
    
    {
        this.homeAddress = homeAddress;
    }

    public String getCity() 
    
    {
        return city;
    }

    public void setCity(String city) 
    
    {
        this.city = city;
    }

    public String getProvince() 
    
    {
        return province;
    }

    public void setProvince(String province) 
    
    {
        this.province = province;
    }

    public String getCountry() 
    
    {
        return country;
    }

    public void setCountry(String country) 
    
    {
        this.country = country;
    }

    public String getGender() 
    
    {
        return gender;
    }

    public void setGender(String gender) 
    
    {
        this.gender = gender;
    }

    public String getPhoneNumber() 
    
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) 
    
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPostalCode() 
    
    {
        return postalCode;
    }

    public void setPostalCode(String postalCode) 
    
    {
        this.postalCode = postalCode;
    }

    public String getWallPaper() 
    
    {
        return wallPaper;
    }

    public void setWallPaper(String wallPaper) 
    
    {
        this.wallPaper = wallPaper;
    }

    public String getProfilePicture() 
    
    {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) 
    
    {
        this.profilePicture = profilePicture;
    }

    public String getSecurityAnswer1() 
    
    {
        return securityAnswer1;
    }

    public void setSecurityAnswer1(String securityAnswer1) 
    
    {
        this.securityAnswer1 = securityAnswer1;
    }

    public String getSecurityAnswer2() 
    
    {
        return securityAnswer2;
    }

    public void setSecurityAnswer2(String securityAnswer2) 
    
    {
        this.securityAnswer2 = securityAnswer2;
    }

    public String getSecurityAnswer3() 
    
    {
        return securityAnswer3;
    }

    public void setSecurityAnswer3(String securityAnswer3) 
    
    {
        this.securityAnswer3 = securityAnswer3;
    }

    public String getSecurityQuestion1() 
    
    {
        return securityQuestion1;
    }

    public void setSecurityQuestion1(String securityQuestion1) 
    
    {
        this.securityQuestion1 = securityQuestion1;
    }

    public String getSecurityQuestion2() 
    
    {
        return securityQuestion2;
    }

    public void setSecurityQuestion2(String securityQuestion2) 
    
    {
        this.securityQuestion2 = securityQuestion2;
    }

    public String getSecurityQuestion3() 
    
    {
        return securityQuestion3;
    }

    public void setSecurityQuestion3(String securityQuestion3) 
    
    {
        this.securityQuestion3 = securityQuestion3;
    }

    public String getSecurityQuestion4() 
    
    {
        return securityQuestion4;
    }

    public void setSecurityQuestion4(String securityQuestion4) 
    
    {
        this.securityQuestion4 = securityQuestion4;
    }

    public String getSecurityQuestion5() 
    
    {
        return securityQuestion5;
    }

    public void setSecurityQuestion5(String securityQuestion5) 
    
    {
        this.securityQuestion5 = securityQuestion5;
    }

    public String getSecurityAnswer4() 
    
    {
        return securityAnswer4;
    }

    public void setSecurityAnswer4(String securityAnswer4) 
    
    {
        this.securityAnswer4 = securityAnswer4;
    }

    public String getSecurityAnswer5() 
    
    {
        return securityAnswer5;
    }

    public void setSecurityAnswer5(String securityAnswer5) 
    
    {
        this.securityAnswer5 = securityAnswer5;
    }

    public MovieList getMovieList() 
    
    {
        return movieList;
    }

    public void setMovieList(MovieList movieList) 
    
    {
        this.movieList = movieList;
    }

    public TVSeriesList getSeriesList() 
    
    {
        return seriesList;
    }

    public void setSeriesList(TVSeriesList seriesList) 
    
    {
        this.seriesList = seriesList;
    }

    public VideoList getVideoList() 
    
    {
        return videoList;
    }

    public void setVideoList(VideoList videoList) 
    
    {
        this.videoList = videoList;
    }

    public TVChannelList getTvChannelList() 
    
    {
        return tvChannelList;
    }

    public void setTvChannelList(TVChannelList tvChannelList) 
    
    {
        this.tvChannelList = tvChannelList;
    }

    public RadioChannelList getRadioChannelList() 
    
    {
        return radioChannelList;
    }

    public void setRadioChannelList(RadioChannelList radioChannelList) 
    
    {
        this.radioChannelList = radioChannelList;
    }

    public MusicList getMusicList() 
    
    {
        return musicList;
    }

    public void setMusicList(MusicList musicList) 
    
    {
        this.musicList = musicList;
    }

    public GameList getGameList() 
    
    {
        return gameList;
    }

    public void setGameList(GameList gameList) 
    
    {
        this.gameList = gameList;
    }

    public PictureList getPictureList() 
    
    {
        return pictureList;
    }

    public void setPictureList(PictureList pictureList) 
    
    {
        this.pictureList = pictureList;
    }
    
}
