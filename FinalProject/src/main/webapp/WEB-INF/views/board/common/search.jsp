<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 검색창 -->
<div class="row">
    <div class="main-section">
        <form action="/board/search" > 
<!--         <form action="/board/search" method="get">  -->
            <div class="searchbar-wrap">
                <i class="fas fa-search"></i>
                <input class="search-input" type="text" name="query" required/> 
                <i class="fas fa-keyboard"></i>
                <input type="submit" style="display: none;"/>
            </div>
        </form>
    </div>
</div>

</body>
</html>