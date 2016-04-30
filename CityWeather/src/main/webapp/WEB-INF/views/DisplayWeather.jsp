<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>City Weather</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js" type="text/javascript"></script>
</head>
<style>
	tr:nth-child(even){background-color: #e5e5e5}
</style>
<script>
var cel=0;
var callbackFunction = function(data)
{
    var location = data.query.results.channel.location;
    var atmosphere = data.query.results.channel.atmosphere;
    var wind = data.query.results.channel.wind;
    var item = data.query.results.channel.item;
    cel=item.condition.temp;
    cel=Math.floor((cel-32)*(5/9));
    $(document).ready(function() 
    {
    	$("#Location").html(location.country);
    	$("#city_city").html(location.city);
    	$("#CurrentTemperature").html(cel+" &#8451");
    	$("#currentDate").html(item.condition.date);
    	$("#sky").html(item.condition.text);
   });
};
</script>
<script src="https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text=+'${city1.city}'+)&format=json&callback=callbackFunction"></script>
<body id="demo">
<form:form action="weather" method="post" commandName="cb">
 <form:errors path="*" element="div" cssClass="commonerrorblock"/>
	<center>
	<h2>City Wise Temperature</h2>
	<table style="width:40%" border="1">
	  	<tr>
    		<td width="50%">Select City</td>
      		<td width="50%"><center>
    			<form:select path="city" id="selectCity">
 					<form:options items="${cityList}"/>
 				</form:select>
 				</center> 
			</td>
    	</tr>
  		<tr>
    		<td width="50%"  colspan="2">
    		<center>
    			<form:input path="*" type="submit" value="Get Weather Details" style="cursor:pointer;" title="Click for getting you city weather"/>
    		</center>
    		</td>
  			
  		</tr>
    </table>
    </center>
    	</form:form>
    <center>
    <table style="width:40%" border="1">
  		<tr>
    		<td width="50%">Location</td>
    		<td width="50%"><div id="Location"></div></td> 
  		</tr>
  		<tr>
    		<td width="50%">City</td>
    		<td width="50%" id="city_city"></td> 
  		</tr>
  		<tr>
    		<td width="50%">Current Temperature</td>
    		<td width="50%" id="CurrentTemperature"></td> 
  		</tr>
  		 <tr>
    		<td width="50%">CurrentDate</td>
    		<td width="50%" id="currentDate"></td> 
  		</tr>
  		 <tr>
    		<td width="50%">Sky</td>
    		<td width="50%" id="sky"></td> 
  		</tr>
	</table>
	</center>
</body>
</html>