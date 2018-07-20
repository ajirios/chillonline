<%-- 
    Document   : profilepic
    Created on : 22-May-2016, 3:21:05 PM
    Author     : El Jefe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<DOCTYPE html>
<html lang="en">

<title>Profile Picture Example</title>

<head>

<style type="text/css">
body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-color: #eee;
    font-family: sans-serif;
}
/**
 * Profile image component
 */
.profile-header-container{
    margin: 0;
    text-align: center;
}
.profile-header-img {
    padding: 14px;
    color: #fff;
}
.profile-header-img > img.img-circle {
    width: 120px;
    height: 120px;
    border: 2px solid #e63;
}
.profile-header {
    margin-top: 10px;
}
/**
 * Ranking component
 */
.rank-label-container {
    margin-top: -19px;
    /* z-index: 1000; */
    text-align: center;
}
.label.label-default.rank-label {
    background-color: #e63;
    padding: 5px 10px 5px 10px;
    border-radius: 27px;
}

hr
{
    color: #eee;
}

h5
{
    color: #e63;
}

</style>

</head>

<body>
<div class="container">
    <br>
    <H5>Profile</H5>
	<div class="row">
        <div class="profile-header-container">   
    		<div class="profile-header-img">
                <img class="img-circle" src="../placeholder.jpg" />
                <!-- badge -->
                <div class="rank-label-container">
                    <span class="label label-default rank-label">Systems Developer</span>
                </div>
            </div>
        </div> 
	</div>
</div>
            <H3>Diego Poncho</H3>
            <p>Santiago, Chile</p>    
    
    <H5>Settings</H5>
    <H5>Subscription Plan</H5>

</body>

</html>
