<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- sweet alert CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
<body>

</body>
</html>

<script>
	const msg = '<%= request.getAttribute("msg") %>';
	const status = '<%= request.getAttribute("status") %>';
	
	console.log(msg + status);
	
	if (msg !== "null" && status !== "null") {
	    $(document).ready(function() {
	        if (msg && status) {
	            alertFunc(msg, status);
	        }
	    });
	
	    function alertFunc(msg, status) {
	        Swal.fire({
	            icon: status,
	            title: status,
	            text: msg
	        });
	    }
	
	    function AlertShow(msg, status) {
	        Swal.fire({
	            icon: status,
	            title: status,
	            text: msg
	        });
	    }
	}
</script>