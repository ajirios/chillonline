/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var packageID = 0;
var type = "movie";
var business = "rental";


function transferProgramByID(programID, ptype, transaction)

{
    if (ptype.equals("movie"))
    
    {
        packageID = programID;
        type = "movie";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
    else if (ptype.equals("series"))
        
    {
        packageID = programID;
        type = "series";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
    else if (ptype.equals("video"))
        
    {
        packageID = programID;
        type = "video";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
    else if (ptype.equals("music"))
        
    {
        packageID = programID;
        type = "music";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
    else if (ptype.equals("tv"))
        
    {
        packageID = programID;
        type = "tv";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
    else if (ptype.equals("radio"))
        
    {
        packageID = programID;
        type = "radio";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
    else if (ptype.equals("game"))
        
    {
        packageID = programID;
        type = "game";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
    else
        
    {
        packageID = programID;
        type = "game";
        business = transaction;
        document.getElementById("packageID").value = packageID;
        document.getElementById("department").value = type;
        document.getElementById("business").value = business;
        document.getElementById("checkout_form").submit();
    }
    
}


function transferMovieByID(movieID, transaction)

{
    packageID = movieID;
    type = "movie";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
    
}

function transferSeriesByID(seriesID, transaction)

{
    packageID = seriesID;
    type = "series";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferVideoByID(videoID, transaction)

{
    packageID = videoID;
    type = "video";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferMusicByID(musicID, transaction)

{
    packageID = musicID;
    type = "music";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferTVChannelByID(tvChannelID, transaction)

{
    packageID = tvChannelID;
    type = "tv";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferRadioChannelByID(radioChannelID, transaction)

{
    packageID = radioChannelID;
    type = "radio";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function transferGameByID(gameID, transaction)

{
    packageID = gameID;
    type = "game";
    business = transaction;
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("business").value = business;
    document.getElementById("checkout_form").submit();
}

function setTypeMovie()
{
    document.getElementById("movie-transact").style.display = "block"; 
    document.getElementById("series-transact").style.display = "none"; 
    document.getElementById("music-transact").style.display = "none"; 
    document.getElementById("video-transact").style.display = "none"; 
    document.getElementById("tv-transact").style.display = "none"; 
    document.getElementById("radio-transact").style.display = "none"; 
    document.getElementById("game-transact").style.display = "none"; 
}

function setTypeSeries()
{
    document.getElementById("series-transact").style.display = "block"; 
    document.getElementById("movie-transact").style.display = "none"; 
    document.getElementById("music-transact").style.display = "none"; 
    document.getElementById("video-transact").style.display = "none"; 
    document.getElementById("tv-transact").style.display = "none"; 
    document.getElementById("radio-transact").style.display = "none"; 
    document.getElementById("game-transact").style.display = "none"; 
}

function setTypeVideo()
{
    document.getElementById("video-transact").style.display = "block"; 
    document.getElementById("series-transact").style.display = "none"; 
    document.getElementById("music-transact").style.display = "none"; 
    document.getElementById("movie-transact").style.display = "none"; 
    document.getElementById("tv-transact").style.display = "none"; 
    document.getElementById("radio-transact").style.display = "none"; 
    document.getElementById("game-transact").style.display = "none"; 
}

function setTypeMusic()
{
    document.getElementById("music-transact").style.display = "block"; 
    document.getElementById("series-transact").style.display = "none"; 
    document.getElementById("movie-transact").style.display = "none"; 
    document.getElementById("video-transact").style.display = "none"; 
    document.getElementById("tv-transact").style.display = "none"; 
    document.getElementById("radio-transact").style.display = "none"; 
    document.getElementById("game-transact").style.display = "none"; 
}

function setTypeTV()
{
    document.getElementById("tv-transact").style.display = "block"; 
    document.getElementById("series-transact").style.display = "none"; 
    document.getElementById("music-transact").style.display = "none"; 
    document.getElementById("video-transact").style.display = "none"; 
    document.getElementById("movie-transact").style.display = "none"; 
    document.getElementById("radio-transact").style.display = "none"; 
    document.getElementById("game-transact").style.display = "none"; 
}

function setTypeRadio()
{
    document.getElementById("radio-transact").style.display = "block"; 
    document.getElementById("series-transact").style.display = "none"; 
    document.getElementById("music-transact").style.display = "none"; 
    document.getElementById("video-transact").style.display = "none"; 
    document.getElementById("tv-transact").style.display = "none"; 
    document.getElementById("movie-transact").style.display = "none"; 
    document.getElementById("game-transact").style.display = "none"; 
}

function setTypeGame()
{
    document.getElementById("game-transact").style.display = "block"; 
    document.getElementById("series-transact").style.display = "none"; 
    document.getElementById("music-transact").style.display = "none"; 
    document.getElementById("video-transact").style.display = "none"; 
    document.getElementById("tv-transact").style.display = "none"; 
    document.getElementById("radio-transact").style.display = "none"; 
    document.getElementById("movie-transact").style.display = "none"; 
}





