<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>admin</title>
<link href="/resources/css/member/default.css" rel="stylesheet">
<link href="/resources/css/common/styles.min.css" rel="stylesheet">
<link href="/resources/css/admin/admin.css" rel="stylesheet">
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
                            <p class="font30px bottomMargin20 topMargin20">Member</p>
                            <div class="direction2 justifyAround width100 bottomMargin20">

                                <span class="direction1">
                                    <h3 class="iconFont font20px">New User ( Day )</h3>
                                    <h3 class="iconFont">10</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont font20px">New User ( Month )</h3>
                                    <h3 class="iconFont">10</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont font20px">New User ( Year )</h3>
                                    <h3 class="iconFont">10</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont">정지 User</h3>
                                    <h3 class="iconFont">1</h3>
                                </span>
                                <span class="direction1">
                                    <h3 class="iconFont">Total User</h3>
                                    <h3 class="iconFont">30</h3>
                                </span>
                            </div>

                            <div
                                class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
                                <p class="font20px subP whiteColor">전체 멤버</p>
                                <div class="direction2 justifyAround alignCenter height80per">
                                    <div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
                                        <div class="direction2 justifyBet">
                                            <p>Total</p>
                                            <span>
                                                멤버 이름 :
                                                <input type="text" class="searchInput">
                                            </span>
                                        </div>
                                        <ul class="direction2 noMargin justifyAround visitPadding borderDefault">
                                            <li class="li1">No</li>
                                            <li class="li1">Icon</li>
                                            <li class="li1">이름</li>
                                            <li class="li1">ID</li>
                                            <li class="li1">별명</li>
                                            <li class="li2">가입 날짜</li>
                                            <li class="li1">구분</li>
                                            <span class="li2 direction2 justifyAround alignCenter">
                                                <h3 class="fontSize14 noMargin">삭제</h3>
                                                <h3 class="fontSize14 noMargin">정지</h3>
                                            </span>
                                        </ul>
                                        <ul>

                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteBtn">정지</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteBtn">정지</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteBtn">정지</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteBtn">정지</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteBtn">정지</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteBtn">정지</button>
                                                </span>
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
                            <div
                                class="subCard boxShadow borderDefault direction1 backGray borderRadiusd bottomMargin20">
                                <p class="font20px subP whiteColor">정지 멤버</p>
                                <div class="direction2 justifyAround alignCenter height80per">
                                    <div class="subCard4 boxShadow borderDefault backWhite borderRadiusd2">
                                        <div class="direction2 justifyBet">
                                            <p>Total</p>
                                            <span>
                                                멤버 이름 :
                                                <input type="text" class="searchInput">
                                            </span>
                                        </div>
                                        <ul class="direction2 noMargin justifyAround visitPadding borderDefault">
                                            <li class="li1">No</li>
                                            <li class="li1">Icon</li>
                                            <li class="li1">이름</li>
                                            <li class="li1">ID</li>
                                            <li class="li1">별명</li>
                                            <li class="li2">가입 날짜</li>
                                            <li class="li1">구분</li>
                                            <span class="li2 direction2 justifyAround alignCenter">
                                                <h3 class="fontSize14 noMargin">삭제</h3>
                                                <h3 class="fontSize14 noMargin">정지</h3>
                                            </span>
                                        </ul>
                                        <ul>

                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteNoneBtn">해제</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteNoneBtn">해제</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteNoneBtn">해제</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteNoneBtn">해제</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteNoneBtn">해제</button>
                                                </span>
                                            </li>
                                            <li class="borderDefault visitPadding justifyAround">
                                                <span class="li1">6</span>
                                                <span class="li1"><img src="../../image/google.png" alt=""
                                                        class="visitImgSize"></span>
                                                <span class="li1">김창대</span>
                                                <span class="li1">rddckdeo</span>
                                                <span class="li1">대짬뽕</span>
                                                <span class="li2">24.01.25</span>
                                                <span class="li1">일반</span>
                                                <span class="li2 direction2 justifyAround alignCenter">
                                                    <button class="deleteBtn">삭제</button>
                                                    <button class="deleteNoneBtn">해제</button>
                                                </span>
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

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>