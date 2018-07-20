<%-- 
    Document   : frames2b
    Created on : 22-May-2016, 3:21:40 PM
    Author     : El Jefe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Chapter 8: Example 2 Page A</title>

<script type="text/javascript">
function btnShowVisited_onclick()
{
document.form1.txtaPagesVisited.value = window.parent.returnPagesVisited();
}
</script>

</head>

<body onload="window.parent.addPage(window.location.href)">
<h2>This is Page B</h2>
<p>
<a href="frames2_a.html">Page A</a>
<a href="frames2b.jsp">Page B</a>
<a href="frames2_c.html">Page C</a>
<a href="frames2_d.html">Page D</a>
</p>

<form name="form1" action="">
<textarea rows="10" cols="35" name="txtaPagesVisited"></textarea>
<br />

<input type="button" value="List Pages Visited" name="btnShowVisited" 
onclick="btnShowVisited_onclick()" />

</form>

</body>

</html>
