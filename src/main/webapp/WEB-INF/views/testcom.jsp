<html>
<head>
<TITLE>Crunchify - Spring MVC Example with AJAX call</TITLE>
 
<style type="text/css">
body {
    background-image:
        url('http://cdn3.crunchify.com/wp-content/uploads/2013/03/Crunchify.bg_.300.png');
}
</style>
<script type="text/javascript"
    src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
    function crunchifyAjax() {
    
        var name = "edouard";  
		var date = "noel";
      
        $.ajax({  
         type : "Get",   
         url : "ajaxtest",   
         data : "name=" + name + "&date=" + date,  
         success : function(response) {  
          alert(response);   
          $('#result').html(response);
         },  
         error : function(e) {  
          alert('Error: ' + e);   
         }  
        }); 
    }
</script>
 
<script type="text/javascript">
//     var intervalId = 0;
//     intervalId = setInterval(crunchifyAjax, 3000);
</script>
</head>
 
<body>
    <div align="center">
        <br> <br> ${message} <br> <br>
        <div id="result"></div>
        <br>
        <p>
            by <a href="http://crunchify.com">Crunchify.com</a>
        </p>
         <input type="button" value="Save" onclick="crunchifyAjax();" />  
    </div>
</body>
</html>