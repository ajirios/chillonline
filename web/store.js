/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var packageID = 0;
var type = "movie";


function getID()
{
    return packageID;
}


function getType()
{
    return type;
}


function transferMovieByID(movieID)

{
    packageID = movieID;
    type = "movie";
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("movie_form").submit();
    
}

function transferSeriesByID(seriesID)

{
    packageID = seriesID;
    type = "series";
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("series_form").submit();
}

function transferVideoByID(videoID)

{
    packageID = videoID;
    type = "video";
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("video_form").submit();
}

function transferMusicByID(musicID)

{
    packageID = musicID;
    type = "music";
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("music_form").submit();
}

function transferTVChannelByID(tvChannelID)

{
    packageID = tvChannelID;
    type = "tv";
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("tv_form").submit();
}

function transferRadioChannelByID(radioChannelID)

{
    packageID = radioChannelID;
    type = "radio";
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("radio_form").submit();
}

function transferGameByID(gameID)

{
    packageID = gameID;
    type = "game";
    document.getElementById("packageID").value = packageID;
    document.getElementById("department").value = type;
    document.getElementById("game_form").submit();
}

function getNextPage()

{
    var currentPage = document.getElementById("page-request-number").value;
    var currentPageNumber = parseInt(currentPage);
    var finalPageNumber = 20;
    finalPageNumber = document.getElementById("final-page-number").value;
    
    if (currentPageNumber < finalPageNumber)
        
    {
        var nextPageNumber = currentPageNumber + 1;
        var nextPage = nextPageNumber.toString();
        document.getElementById("page-request-number").value = nextPage;
        document.getElementById("page-request-form").submit();
    }
    
}

function getPreviousPage()

{
    var currentPage = document.getElementById("page-request-number").value;
    var currentPageNumber = parseInt(currentPage);
    
    if (currentPageNumber > 1)
        
    {
        var previousPageNumber = currentPageNumber - 1;
        var previousPage = previousPageNumber.toString();
        document.getElementById("page-request-number").value = previousPage;
        document.getElementById("page-request-form").submit();
    }
    
}


