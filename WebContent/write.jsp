<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>오산 정공체험 박람회</title>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="css/mdb.min.css" rel="stylesheet">
<!-- Your custom styles (optional) -->
<link href="css/style.css" rel="stylesheet">

<link href="css/my.css" rel="stylesheet">
</head>

<body>

	<!-- 실제로 개발자가 작업을 하는 부분 -->

	<div class="outer">
		<div class="inner">
			<div class="centered">
				<h2>메뉴 추가</h2>
				<!-- Material input -->
				<div class="container">
					<form class="md-form clearfix" action="writeAction.jsp" method="post">
						<div class="form-group">
							<input type="text" name="menuName" class="form-control"> <label
								for="form1">추가할 메뉴 이름을 입력해주세요.</label>
						</div>
						
						<div class="form-group shadow-textarea">
							<textarea class="form-control z-depth-1" id="exampleFormControlTextarea6" rows="5" name="menuContext" placeholder="메뉴의 내용을 입력해주세요."></textarea>
						</div>
						<div class="float-right">
					<button id="exit" type="button" class="btn btn-primary">취소</button>
					<button type="submit" class="btn btn-primary">추가</button>
				</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- /Start your project here-->

	<!-- SCRIPTS -->
	<!-- JQuery -->
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<!-- Bootstrap tooltips -->
	<script type="text/javascript" src="js/popper.min.js"></script>
	<!-- Bootstrap core JavaScript -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- tableDnD JavaScript -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
		$(document).ready(function() {
			$("#exit").click(function(){
				location.href = "index.jsp";
			});
				
			
		});
	</script>

</body>

</html>
