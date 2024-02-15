<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/admin/common/head.jsp"%>
</head>

<body class="bodyBackColor">
	<%@ include file="/WEB-INF/views/admin/common/sidebar.jsp"%>
	<!-- header 영역 -->
	<%@ include file="/WEB-INF/views/admin/common/header.jsp"%>
    <!-- 카드 영역  -->
    <div class="cardSize mainCard">
        <div class="row">
            <div class="main-section">
                <div class="container-fluid">
                    <div class="container-fluid">
                        <!-- Card 안쪽 -->
                        <div class="card cardSize alignCenter">
                            <p class="font30px bottomMargin20 topMargin20">Admin</p>
                            <div class="direction2 justifyAround width100 bottomMargin20">

                                <span class="direction1">
                                    <h3 class="iconFont">Total Answer</h3>
                                    <h3 class="iconFont">10</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont">Complete</h3>
                                    <h3 class="iconFont">30</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont">Incomplete</h3>
                                    <h3 class="iconFont">40</h3>
                                </span>
                            </div>

                            <div class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
                                <p class="font20px subP whiteColor">미완료 문의</p>
                                <div class="direction2 justifyAround alignCenter height80per">
                                    <div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
                                        <p>미완료 문의</p>
                                            <ul class="direction2 noMargin justifyAround visitPadding borderDefault">
                                                <span class="li1">No</span>
                                                <span class="li3">문의 제목</span>
                                                <span class="li4">작성자</span>
                                                <span class="li2">작성 시간</span>
                                                <span class="li2">답변 여부</span>
                                            </ul>
                                            <ul>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                
    
                                                <div class="pagination">
                                                    <a href="#">&lt;</a>
                                                    <a href="#" class="active">1</a>
                                                    <a href="#">2</a>
                                                    <a href="#">3</a>
                                                    <a href="#">4</a>
                                                    <a href="#">5</a>
                                                    <a href="#">&gt;</a>
                                                </div>
                                            </ul>
                                    </div>
                                </div>
                                
                            
    
                            <!-- Card End -->
                        </div>
                            <div class="subCard direction2 justifyBet">
                                <div
                                    class="subCard3 boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
                                    <p class="font20px subP whiteColor">전체 문의</p>
                                    <div class="direction2 justifyAround alignCenter height80per">
                                        <div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
                                            <p>전체 문의</p>
                                            <ul class="direction2 noMargin justifyAround visitPadding borderDefault">
                                                <span class="li1">No</span>
                                                <span class="li3">문의 제목</span>
                                                <span class="li4">작성자</span>
                                                <span class="li2">작성 시간</span>
                                                <span class="li2">답변 여부</span>
                                            </ul>
                                            <ul>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                
                                                <div class="pagination">
                                                    <a href="#">&lt;</a>
                                                    <a href="#" class="active">1</a>
                                                    <a href="#">2</a>
                                                    <a href="#">3</a>
                                                    <a href="#">4</a>
                                                    <a href="#">5</a>
                                                    <a href="#">&gt;</a>
                                                </div>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    class="subCard3 boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
                                    <p class="font20px subP whiteColor">완료된 문의</p>
                                    <div class="direction2 justifyAround alignCenter height80per">
                                        <div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
                                            <p>완료된 문의</p>
                                            <ul class="direction2 noMargin justifyAround visitPadding borderDefault">
                                                <span class="li1">No</span>
                                                <span class="li3">문의 제목</span>
                                                <span class="li4">작성자</span>
                                                <span class="li2">작성 시간</span>
                                                <span class="li2">답변 여부</span>
                                            </ul>
                                            <ul>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                <li class="borderDefault visitPadding justifyAround boardLiSize">
                                                    <span class="li1">5</span>
                                                    <span class="li3">게시글 어쩌구저쩌구 이것저것 적어보자 으아아앙</span>
                                                    <span class="li4">김창대</span>
                                                    <span class="li2">16:17:52</span>
                                                    <span class="li2">N</span>
                                                </li>
                                                
                                                <div class="pagination">
                                                    <a href="#">&lt;</a>
                                                    <a href="#" class="active">1</a>
                                                    <a href="#">2</a>
                                                    <a href="#">3</a>
                                                    <a href="#">4</a>
                                                    <a href="#">5</a>
                                                    <a href="#">&gt;</a>
                                                </div>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>