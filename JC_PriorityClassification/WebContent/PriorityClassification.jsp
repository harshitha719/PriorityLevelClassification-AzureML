<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>The Joint Commission</title>
    <script type="text/javascript">

    function predict(){
    	var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
           if (this.readyState == 4 && this.status == 200) {
              var jsonRes = JSON.parse(xhttp.responseText);
              var label = jsonRes.Results.WebServiceOutput0[0]["Scored Labels"];
              alert("Predicted output is received from model");
              if(label=='1'){
            	  $("#label").val("Priority Level 2");
              }
              if(label=='2'){
            	  $("#label").val("Priority Level 3");
              }
              if(label=='3'){
            	  $("#label").val("Priority Level 6");
              }
              if(label=='4'){
            	  $("#label").val("Priority Level 1");
              }
              if(label=='5'){
            	  $("#label").val("Priority Level 7");
              }
              if(label=='6'){
            	  $("#label").val("Priority Level 4");
              }
              if(label=='7'){
            	  $("#label").val("Priority Level 5");
              }
           }
        };

           xhttp.open("POST", "https://cors-anywhere.herokuapp.com/http://104.43.243.56:80/api/v1/service/feature-hashing-76/score", true);
           xhttp.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
           xhttp.setRequestHeader("Authorization", "Bearer c9KSvBVqJuDIq4UOCzqYdlNQR9ORL73F");
           var reqString = '{\"Inputs\":{\"input1\":[{\"Text\":\"';
           reqString = reqString.concat(document.getElementById("text").value);
           reqString = reqString.concat('\"}]}}');
           reqString = reqString.replace(/\\/g, "");
           alert("Request is Sent to Model");
           xhttp.send(reqString);
    }
    </script>
     <style>
     .bg-4 { 
        background-color: #2f2f2f; /* Black Gray */
        color: #fff;/* white */
      }
     .container-fluid {
    padding-bottom: 50px;/* padding  top included for body of the page */
    /* padding  bottom included for body of the page */
  }
   
  .bg-4 { 
    background-color: #2f2f2f; /* Black Gray */
    color: #fff;/* white */
  }
     </style>
     
</head>
<body >
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="#" style="padding-left: 500px">Priority Classification DashBoard</a>
  </nav>
  <form class="my-form" onsubmit="predict();">
  <div class ="p-3 mb-2 bg-secondary  text-center">
<div class="form-group">
    <label for="formGroupExampleInput1">Enter the Incident</label>
  <textarea class="form-control" id="text" aria-label="With textarea"></textarea>
</div>
<div>
<input type="submit" class="btn btn-dark" value="Submit"/>
</div>
<div class="form-group" style="padding-bottom: 60px;padding-top: 110px;padding-right: 20px">
    <label for="formGroupExampleInput2">Predicted Priority Level: </label>
    <input type="text" class="text-center" id="label" disabled="disabled">
  </div>
</div>
</form>
<footer class="container-fluid bg-4 text-center">
<!-- class for entire footer is defined here -->
 <p style="padding-top: 20px">Developed By UIC Students</p><!-- Footer CONTENT goes here-->
  <img src="Image/uic.png" class="img-responsive margin" style="display:inline" width="50" height="50"></img><!--image for link access -->
</footer>
</body>
</html>
