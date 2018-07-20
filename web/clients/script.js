//Search bar handler

$(function() {

var searchField = $(this).parent().attr('#query');
var icon = $(this).parent().attr('#search-btn');

//focus handler
$(searchField).on('focus', function() {

$(this).animate({width: '100%'}, 400);
$(icon).animate({right: '10px'}, 400);

});

//blur event handler
$(searchField).on('blur', function() {

if (searchField.val() == '')

{
$(searchField).animate({width: '45%'}, 400, function(){});
$(icon).animate({right: '360px'}, 400, function(){});
}

});

$('#search-form').submit(function(e) {e.preventDefault();});


})


function search()

{
//clear previous results
$('#results').html('');
$('#buttons').html('');
$('#dashboard').css("height", "1180px");
$('#video-listing-area').css("height", "1130px");

//get form input
q = $('#query').val();

//run youtube data api get request
$.get("https://www.googleapis.com/youtube/v3/search", 
{
part: "snippet, id",
q: q,
type: 'video',
key: "AIzaSyDcm4XF0yciL6CrhOZQZxmyRULW9PEELJI"
}, function (data) 

{

var nextPageToken = data.nextPageToken;
var prevPageToken = data.prevPageToken;

console.log(data);


$.each(data.items, function(i, item) {

var output = getOutput(item);

$('#results').append(output);

});


var buttons = getButtons(prevPageToken, nextPageToken);

$('#buttons').append(buttons);


}

);

}


function loadAXIFrame(videoId)

{
    //$('#axiframe').attr('src', "https://www.youtube.com/embed/" + videoId + "?rel=0");
    
    var boardID = document.getElementById("board-id-span").value;
    var endpoint = "board.jsp?board-id-request=" + boardID + "&page-request-number=" + videoId;
    
    var iframe = document.getElementById("middle");
    
    iframe.contentWindow.document.getElementById("page-request-number").value = videoId;
    iframe.contentWindow.document.getElementById("page-request-number-re").value = videoId;
    iframe.contentWindow.document.getElementById("page-request-form").action = endpoint;
    document.getElementById("middle").src = "tutorials.jsp";
    iframe.contentWindow.document.getElementById("page-request-form").submit();
    
}


function getOutput(item)

{
var videoId = item.id.videoId;
var title = item.snippet.title;
var description = item.snippet.description;
var thumb = item.snippet.thumbnails.high.url;
var channelTitle = item.snippet.channelTitle;
var videoDate = item.snippet.publishedAt;

var output = '<li>' + '<div class="list-left">' + '<a href="javascript:alert(\"Hi!\");"><img src="' + thumb + '"></a></div>' + 
'<div class="list-right"><a href="javascript:loadAXIFrame(\'' + videoId + '\');"><h3>' + title + '</h3></a>' 
+ '<small>By <span class="cTitle">' + channelTitle + '</span> on ' + videoDate + '</small>'
+ '<p>' + description + '</p>' 
+ '</div></li>'
+ '<div class="clearfix"></div>'
+ '';

return output;

}


function prevPage()

{
var token = $('#prev-button').data('token');
var q = $('#prev-button').data('query');

//clear previous results
$('#results').html('');
$('#buttons').html('');

//get form input
q = $('#query').val();

//run youtube data api get request
$.get("https://www.googleapis.com/youtube/v3/search", 
{
part: "snippet, id",
q: q,
pageToken: token,
type: 'video',
key: "AIzaSyDcm4XF0yciL6CrhOZQZxmyRULW9PEELJI"
}, function (data) 

{

var nextPageToken = data.nextPageToken;
var prevPageToken = data.prevPageToken;

console.log(data);


$.each(data.items, function(i, item) {

var output = getOutput(item);

$('#results').append(output);

});


var buttons = getButtons(prevPageToken, nextPageToken);

$('#buttons').append(buttons);


}

);

}


function nextPage()

{
var token = $('#next-button').data('token');
var q = $('#next-button').data('query');

//clear previous results
$('#results').html('');
$('#buttons').html('');

//get form input
q = $('#query').val();

//run youtube data api get request
$.get("https://www.googleapis.com/youtube/v3/search", 
{
part: "snippet, id",
q: q,
pageToken: token,
type: 'video',
key: "AIzaSyDcm4XF0yciL6CrhOZQZxmyRULW9PEELJI"
}, function (data) 

{

var nextPageToken = data.nextPageToken;
var prevPageToken = data.prevPageToken;

console.log(data);


$.each(data.items, function(i, item) {

var output = getOutput(item);

$('#results').append(output);

});


var buttons = getButtons(prevPageToken, nextPageToken);

$('#buttons').append(buttons);


}

);

}



function getButtons(prevPageToken, nextPageToken)

{
var btnoutput = 'Buttons';

if (!prevPageToken)

{
btnoutput = '<div class="button-container">' +
'<button id="next-button" class="paging-button" data-token="' + nextPageToken + '" data-query="' + q + '"' + 
'onclick="nextPage();">Next Page</button></div>';
}

else

{
btnoutput = '<div class="button-container">' +
'<button id="prev-button" class="paging-button" data-token="' + prevPageToken + '" data-query="' + q + '"' + 
'onclick="prevPage();">Previous Page</button></div>' + 
'<button id="next-button" class="paging-button" data-token="' + nextPageToken + '" data-query="' + q + '"' + 
'onclick="nextPage();">Next Page</button></div>';
}

return btnoutput;

}





