<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.footer_li {
margin-top:40px;
    display: flex;
    justify-content: center; /* 가운데 정렬 */
    width: 100%; /* 전체 넓이를 채우도록 설정 */
    text-align: center; /* 가운데 정렬 */
}
.footer_li > p{
	margin-left:5px;
	margin-right:5px;
}
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

.modal-content {
	background-color: #fefefe;
	margin: 5% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

</style>
<body>
	<!-- 페이지 완쪽 사이드바 영역-->
	<aside class="left-sidebar">
		<!-- 사이드바 스크롤-->
		<div class="scroll-sidebar" data-simplebar>
			<!-- 로고 -->
			<div class="d-flex mb-4 align-items-center justify-content-between">
				<a href="/member/mainForm.do" class="text-nowrap logo-img ms-0 ms-md-1"> <img
					src="../../../../resources/uploads/icon/cocoLogo.png" width="180"
					alt="">
				</a>
				<div
					class="close-btn d-xl-none d-block sidebartoggler cursor-pointer"
					id="sidebarCollapse">
					<i class="ti ti-x fs-8"></i>
				</div>
				<!-- 사이드바 네비게이션-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav" class="mb-4 pb-2">
						<li><a href="/member/mainForm.do"></a></li>
						<!-- 사이드바 협업툴 바로가기-->
						<li class="sidebar-item"><a href="/colabo"
							id="cooperation-btn" class="btn btn-primary"
							style="margin: 15px 0px 0px 20px;" onclick="return checkLogin()">협업툴
								바로가기</a><a href="/board/" id="cooperation-btn"
							class="btn btn-primary href-div"
							style="margin: 20px 0px 0px 20px;">게시판 바로가기</a></li>
						<!-- 사이드바 정보게시판 -->
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-5"></i> <span
							class="hide-menu">정보게시판</span></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link warning-hover-bg"
							href="/info/category?name=programming&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-warning rounded-3"> <i
									class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">프로그래밍 언어</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link danger-hover-bg"
							href="/info/category?name=framework&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-danger rounded-3"> <i
									class="ti ti-alert-circle fs-7 text-danger"></i>
							</span> <span class="hide-menu ms-2 ps-1">프레임워크 및 라이브러리</span>
						</a></li>

						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link success-hover-bg"
							href="/info/category?name=database&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-success rounded-3"> <i
									class="ti ti-cards fs-7 text-success"></i>
							</span> <span class="hide-menu ms-2 ps-1">데이터베이스</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link primary-hover-bg"
							href="/info/category?name=webDev&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-primary rounded-3"> <i
									class="ti ti-file-description fs-7 text-primary"></i>
							</span> <span class="hide-menu ms-2 ps-1">웹 개발</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=mobileDev&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">모바일 개발</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=machineLearning&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">기계 학습 / 인공지능</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=cloud&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">클라우드 & 서버</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=devTools&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">개발 도구</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link indigo-hover-bg"
							href="/info/category?name=portfolio&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-indigo rounded-3"> <i
									class="ti ti-typography fs-7 text-indigo"></i>
							</span> <span class="hide-menu ms-2 ps-1">프로젝트 & 포트폴리오</span>
						</a></li>

						<!-- 사이트바 자유게시판 -->
						<li class="nav-small-cap"><i
							class="ti ti-dots nav-small-cap-icon fs-5"></i> <span
							class="hide-menu">자유게시판</span></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link warning-hover-bg"
							href="/free/category?name=daily&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-warning rounded-3"> <i
									class="ti ti-article fs-7 text-warning"></i>
							</span> <span class="hide-menu ms-2 ps-1">일상 이야기</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link danger-hover-bg"
							href="/free/category?name=informationy&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-danger rounded-3"> <i
									class="ti ti-alert-circle fs-7 text-danger"></i>
							</span> <span class="hide-menu ms-2 ps-1">정보 공유</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link success-hover-bg"
							href="/free/category?name=hobby&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-success rounded-3"> <i
									class="ti ti-cards fs-7 text-success"></i>
							</span> <span class="hide-menu ms-2 ps-1">취미 공유</span>
						</a></li>
						<li class="sidebar-item"><a
							class="sidebar-link sidebar-link primary-hover-bg"
							href="/free/category?name=review&page=1&sortType=date"
							aria-expanded="false"> <span
								class="aside-icon p-2 bg-light-primary rounded-3"> <i
									class="ti ti-file-description fs-7 text-primary"></i>
							</span> <span class="hide-menu ms-2 ps-1">추천 & 리뷰</span>
						</a></li>
					</ul>
					<li class="footer_li"><a class="privacy_link"
						onclick="openModal('privacyModal')">개인정보처리방침</a>
						<div id="privacyModal" class="modal">
							<div class="modal-content">
								<span class="close" onclick="closeModal('privacyModal')">&times;</span>
								<!-- 개인정보 처리 방침 내용 추가 -->
								<h3>개인정보 처리 방침</h3>
								<p>[회사/서비스명] 개인정보 처리 방침

본 개인정보 처리 방침은 [회사/서비스명] (이하 "당사" 또는 "우리")이 제공하는 서비스 및 제품(이하 "서비스")을 이용하는 개인 정보의 수집, 이용, 저장, 보호 및 관리에 대한 정보를 제공합니다. 당사는 개인 정보 보호에 최선을 다하고 이에 따라 귀하의 개인 정보를 존중하고 보호하기 위해 노력하고 있습니다. 본 방침은 당사가 개인 정보를 처리하는 방식에 대한 설명 및 귀하의 권리와 관련된 사항을 포함하고 있습니다.

수집하는 개인 정보의 범위

당사는 서비스 제공을 위해 귀하로부터 수집한 정보 중 필요한 최소한의 정보만을 처리합니다. 수집될 수 있는 개인 정보의 종류는 다음과 같습니다.
신규 가입 시: 이름, 이메일 주소, 연락처 등
서비스 이용 중: 서비스 이용 기록, 기기 정보, 쿠키, 로그 정보 등
기타 서비스 이용 과정에서 자동으로 수집되거나 귀하가 직접 제공하는 정보
개인 정보 수집 및 이용 목적

당사는 다음과 같은 목적으로 귀하의 개인 정보를 수집 및 이용합니다.
서비스 제공 및 운영, 유지 및 개선
새로운 제품 또는 서비스 소개 및 안내
서비스 이용 관련 통계 작성 및 분석
법적 의무의 이행 및 관련 규정 준수
기타 귀하에게 동의 받은 용도
개인 정보의 보유 기간

당사는 귀하의 개인 정보를 수집한 목적이 달성되면 해당 정보를 지체 없이 파기합니다. 단, 관련 법령에 따라 일정 기간 동안 정보를 보존하여야 하는 경우에는 해당 기간 동안 보존합니다.
개인 정보의 제3자 제공

당사는 귀하의 동의 없이 개인 정보를 제3자에게 제공하지 않습니다. 다만, 다음의 경우에는 예외적으로 제3자 제공이 이루어질 수 있습니다.
귀하가 명시적으로 동의한 경우
법령에 의한 요청이 있는 경우
서비스 제공에 따른 계약 이행을 위해 필요한 경우
합병, 인수, 파산 등으로 인한 사업의 일부 또는 전부 양도 시
개인 정보 보호 조치

당사는 귀하의 개인 정보를 적절하고 안전하게 관리하기 위해 다음과 같은 조치를 취하고 있습니다.
보안 시스템의 구축 및 운영
개인 정보 처리에 대한 접근 제한
귀하의 개인 정보에 대한 교육 및 감시
개인 정보 처리 업무의 전담 담당자 지정
귀하의 권리

귀하는 언제든지 본인의 개인 정보에 대한 접근, 수정, 삭제, 이동, 정정 요청 등의 권리를 행사할 수 있습니다. 또한 개인 정보 수집 및 이용에 대한 동의 철회도 가능합니다.
개인 정보 보호 정책의 변경

당사는 개인 정보 보호 정책을 변경할 수 있습니다. 변경된 정책은 당사의 웹사이트나 서비스 내에서 공지하며, 귀하가 수시로 확인하여 최신 정보를 파악할 수 있도록 합니다.
[회사/서비스명] 개인정보 처리 방침은 [발효일]부터 시행됩니다.

[회사/서비스명]은 귀하의 개인 정보를 소중히 여깁니다. 귀하의 개인 정보 보호와 관련된 권리를 보장하기 위해 최선을 다하겠습니다. 혹시 개인 정보 처리 방침에 대한 추가적인 문의사항이 있으시면 [고객센터 연락처 또는 이메일]로 문의해주시기 바랍니다.</p>
							</div>
						</div>
						<p>|</p> <a class="terms_link" onclick="openModal('termsModal')">이용약관</a>
						<div id="termsModal" class="modal">
							<div class="modal-content">
								<span class="close" onclick="closeModal('termsModal')">&times;</span>
								<!-- 이용 약관 내용 추가 -->
								<h1>이용약관</h1>

								<p>환영합니다! 이용약관은 이 웹사이트를 이용하는 모든 사용자에게 적용됩니다.</p>

								<p>1. 서비스 이용에 앞서, 이용약관을 주의 깊게 읽어주시기 바랍니다. 이용자가 제공한 개인정보는 서비스
									제공을 위한 목적으로만 사용되며, 그 외의 용도로 사용되지 않습니다.</p>

								<p>2. 이용자는 본 웹사이트의 모든 서비스 이용 시 관련 법령 및 이용약관을 준수해야 합니다. 법령 및
									약관을 위반한 행동 시 책임을 지게 됩니다.</p>

								<p>3. 웹사이트는 서비스 개선 및 안전한 이용을 위해 필요한 경우 사전 고지 없이 시스템 유지보수를
									진행할 수 있습니다.</p>

								<p>4. 서비스를 통해 제공되는 모든 콘텐츠 및 자료의 권리는 해당 콘텐츠 제공자에게 있습니다. 상업적인
									목적으로 사용하거나 무단 복제, 배포하는 행위는 금지되어 있습니다.</p>

								<p>5. 이용자는 서비스 이용 시 다른 이용자의 권리를 존중해야 합니다. 상대방을 비방하거나 명예를
									훼손하는 행위는 금지되며, 이로 인한 법적 책임은 해당 이용자에게 있습니다.</p>

								<p>6. 웹사이트는 이용자들의 개인정보를 보호하기 위해 최선을 다하고 있습니다. 개인정보 보호 정책에
									대해서는 별도로 안내되니, 해당 내용을 확인하시기 바랍니다.</p>

								<p>7. 이용자는 언제든지 개인정보의 열람, 정정, 삭제 등을 요청할 수 있으며, 웹사이트는 관련 법령을
									준수하여 이에 대한 조치를 취합니다.</p>

								<p>8. 웹사이트는 서비스의 향상을 위해 이용자들로부터의 의견을 적극 수렴합니다. 피드백이나 제안이 있는
									경우 언제든지 웹사이트에게 알려주시기 바랍니다.</p>
								<p>9. 서비스 이용 시 발생하는 모든 정보와 컨텐츠의 저작권은 해당 정보 및 컨텐츠를 제공한 회원에게
									귀속됩니다. 따라서, 이를 무단으로 복제, 수정, 배포하는 행위는 금지되어 있습니다.</p>

								<p>10. 웹사이트는 서비스의 안정성과 품질 향상을 위해 시스템 점검이나 업데이트를 진행할 수 있습니다.
									이러한 경우, 사전에 공지할 수 있으며, 이로 인해 발생하는 불편함에 대해서 양해를 부탁드립니다.</p>

								<p>11. 서비스를 이용하는 동안 발생하는 모든 민원이나 문의사항은 빠르고 정확하게 처리하기 위해
									웹사이트에서 운영하는 고객센터를 이용하시기 바랍니다.</p>

								<p>12. 이용약관은 법령이나 정책의 변경, 서비스의 확장 등에 따라 수시로 변경될 수 있습니다. 변경된
									내용은 웹사이트를 통해 사전에 공지하며, 이에 동의하지 않는 이용자는 서비스 이용을 중단할 수 있습니다.</p>

								<p>13. 이용약관의 해석 및 관련된 분쟁에 대해서는 대한민국의 법률을 적용하며, 관할 법원은
									서울중앙지방법원으로 합니다.</p>
							</div>
						</div></li>
				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</div>

	</aside>
</body>
</html>
<script>
	function openModal(modalId) {
		var modal = document.getElementById(modalId);
		modal.style.display = "block";
	}

	// 모달 닫기 함수
	function closeModal(modalId) {
		var modal = document.getElementById(modalId);
		modal.style.display = "none";
	}

	// 모달 외부 클릭 시 닫기
	window.onclick = function(event) {
		var modals = document.getElementsByClassName('modal');
		for (var i = 0; i < modals.length; i++) {
			var modal = modals[i];
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	}
</script>
