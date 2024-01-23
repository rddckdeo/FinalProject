<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="UTF-8">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>프로젝트 생성</title>
<!--   <link rel="shortcut icon" type="image/png" href="../assets/images/logos/favicon.png" /> -->
  <link rel="stylesheet" href="../../resources/css/colabo/colabo.css" />
</head>

<body>
<!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
 <%@ include file="./common/colaboSideBar.jsp" %>
    
  	<!--  Main wrapper -->
    <div class="body-wrapper">
    	<%@ include file="./common/colaboHeader.jsp" %>
			<div class="container-fluid">
			 <div class="row">
			  <div class="card w-100">
				<div class="form-style-5">
					<form>
						<fieldset>
							<legend>
								<span class="number">1</span> 프로젝트 대표자 정보
							</legend>
							<input type="text" name="" placeholder="이름">
							<input type="email" name="" placeholder="이메일">
							<textarea name="field3" placeholder="About yourself"></textarea>
							
						</fieldset>
						<fieldset>
							<legend>
								<span class="number">2</span> 프로젝트 정보
							</legend>
							<div style="width:100px; height:100px;">
								<p>이미지 업로드</p>
								<input type="file">
							</div>
							<input type="text" name="" placeholder="프로젝트 주제">
							<input type="text" name="" placeholder="프로젝트 이름">
							<textarea name="" placeholder="프로젝트 설명"></textarea>
							<input type="text" name="" placeholder="사용할 기술스택">
							<label for="job">기술스택 선택</label> 
							<select id="job"
								name="field4" style="height: 50px;">
								<optgroup label="Indoors">
									<option value="fishkeeping">자바</option>
									<option value="reading">파이썬</option>
									<option value="boxing">등등</option>
									<option value="debate">Debate</option>
									<option value="gaming">Gaming</option>
									<option value="snooker">Snooker</option>
									<option value="other_indoor">Other</option>
								</optgroup>
								<optgroup label="Outdoors">
									<option value="football">Football</option>
									<option value="swimming">Swimming</option>
									<option value="fishing">Fishing</option>
									<option value="climbing">Climbing</option>
									<option value="cycling">Cycling</option>
									<option value="other_outdoor">Other</option>
								</optgroup>
							</select>
							<p>기술스택 목록나옴 ~~~~~</p>
							<input type="number" name="" placeholder="프로젝트 인원 ( 명 )">
							<input type="number" name="" placeholder="프로젝트 기간 ( 달 )">
						</fieldset>
						<input type="submit" value="모집등록" />
						<input type="submit" value="프로젝트 결성" />
					</form>
				</div>
			</div>
			</div>
			</div>
		</div>
    </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
</body>

</html>