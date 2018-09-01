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
			<h2>플러스친구 메뉴 목록</h2>
				<div style="display:table;margin-left:auto;margin-right:auto; text-align: left;">
					
					<ul class="sortableList">
						<%
							String cpath = new File(request.getServletPath()).getParent();
							String localPath = application.getRealPath(cpath);
							String path = localPath + "//jsonFile";
							File dirFile = new File(path);
							File[] fileList = dirFile.listFiles();
							for (File tempFile : fileList) {
								if (tempFile.isFile()) {
									String tempPath = tempFile.getParent();
									String tempFileName = tempFile.getName();
						%>
						<li class="ui-state-default"><a href="modify.jsp?menuName=<%=tempFileName%>"><%=tempFileName%></a></li>
						<%
							/*** Do something withd tempPath and temp FileName ^^; ***/
								}
							}
						%>
					</ul>
				</div>
				<a href="write.jsp" role="button" class="btn btn-primary">메뉴 추가</a>
				
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
			
			// Some code to prevent duplicates
			var tmp = $('li').toArray();
			var data = "jsonStr=[";
			for ( var i in tmp) {
				var text = tmp[i].textContent;
				data += "\"" + text + "\"";
				if (i < tmp.length - 1)
					data += ", ";
			}
			data += "]";

			$.ajax({
				type : "POST",
				url : "updateAction.jsp",
				dataType : 'text',
				data : data,
				success : function(data) {
					console.log(1);
				},
				error : function() {
					console.log("error");
				},
				//success 혹은 error 콜백 실행 후 항상 실행
				complete : function() {
					console.log("always");
				}
			});
		
			
			$(".sortableList").sortable({
				revert : true,
				update : function(event, ui) {
					// Some code to prevent duplicates
					var tmp = $('li').toArray();
					var data = "jsonStr=[";
					for ( var i in tmp) {
						var text = tmp[i].textContent;
						data += "\"" + text + "\"";
						if (i < tmp.length - 1)
							data += ", ";
					}
					data += "]";

					$.ajax({
						type : "POST",
						url : "updateAction.jsp",
						dataType : 'text',
						data : data,
						success : function(data) {
							console.log(1);
						},
						error : function() {
							console.log("error");
						},
						//success 혹은 error 콜백 실행 후 항상 실행
						complete : function() {
							console.log("always");
						}
					});

					console.log(data);
				}
			});


		});
	</script>

</body>

</html>
