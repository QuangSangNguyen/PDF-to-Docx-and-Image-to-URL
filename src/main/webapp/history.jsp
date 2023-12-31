<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en-us">

<head>
<meta charset="utf-8">
<title>Project LTM</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- theme meta -->
<meta name="theme-name" content="dot" />

<!-- ** CSS Plugins Needed for the Project ** -->

<!-- Bootstrap -->
<link rel="stylesheet" href="plugins/bootstrap/bootstrap.min.css">
<!-- themefy-icon -->
<link rel="stylesheet" href="plugins/themify-icons/themify-icons.css">
<!--Favicon-->
<link rel="icon" href="images/favicon.png" type="image/x-icon">
<!-- fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap"
	rel="stylesheet">
<!-- Main Stylesheet -->
<link href="assets/style.css" rel="stylesheet" media="screen" />
</head>
<style>
button, input {
    color: aliceblue;
    overflow: visible;
    background-color: #9379793b;
}
</style>
<body>
	<!-- header -->
	<header class="banner overlay bg-cover"
		data-background="images/banner.jpg">
		<nav class="navbar navbar-expand-md navbar-dark">
			<div class="container">
				<button class="navbar-toggler border-0" type="button"
					data-toggle="collapse" data-target="#navigation"
					aria-controls="navigation" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse text-center" id="navigation">
					<ul class="navbar-nav ml-auto">
						<li class="nav-item"><a class="nav-link text-dark"
							href="pdf-to-word">PDF To Word</a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="image-to-url">Image To URL</a></li>
						<%
						if (request.getSession().getAttribute("username") == null) {
						%>
						<li class="nav-item"><a class="nav-link text-dark"
							href="login">Login</a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="register">Register</a></li>
						<%
						}
						%>
						<%
						if (request.getSession().getAttribute("username") != null) {
						%>
						<li id="username" class="nav-item"><a
							class="nav-link text-dark" href="history"><%=request.getSession().getAttribute("username")%></a></li>
						<li class="nav-item"><a class="nav-link text-dark"
							href="logout">Logout</a></li>
						<%
						}
						%>

					</ul>
				</div>
			</div>
		</nav>
		<!-- banner -->
		<div class="container section">
			<div class="row">
				<div class="col-lg-8 text-center mx-auto">
					<h1 class="text-white mb-3">History of conversion</h1>
					<p class="text-white mb-4">History of your conversion: Easily manage your history!</p>
				</div>
			</div>
		</div>
		<!-- /banner -->
	</header>
	<!-- /header -->

	<!-- topics -->
	<div class="card-body">
		<div class="card-header"
			style="margin-left: -20px; margin-top: -40px;">
		</div>
		<table class="table table-bordered table-hover" id="example2">
			<thead>
				<tr>
				    <th style="width: 10px; text-align: center;">STT</th>
				    <th style="width: 318px; text-align: center;">File Name</th>
				    <th style="text-align: center;">Convert Type</th>
				    <th style="text-align: center;">Date</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="indexOffset" value="0" />
					<c:forEach items="${pdfFiles}" var="pdfFile" varStatus="loop">
						<tr>
							<td style="text-align: center;">${loop.index + 1}</td>
							<td style="text-align: center;">${pdfFile.getPath()}</td>
							<td style="text-align: center;">Convert PDF to Word</td>
							<td style="text-align: center;">${pdfFile.getDate()}</td>
						</tr>
						<c:set var="indexOffset" value="${loop.index + 1}" />
					</c:forEach>
					<c:forEach items="${imageFiles}" var="imageFile" varStatus="loop">
						<tr>
							<td style="text-align: center;">${loop.index + 1 + indexOffset}</td>
							<td style="text-align: center;">${imageFile.getFilename()}</td>
							<td style="text-align: center;">Convert Image to URL</td>
							<td style="text-align: center;">${imageFile.getDate()}</td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- /topics -->
			<!-- /call to action -->

			<!-- footer -->
			<footer class="section pb-4">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-md-8 text-md-left text-center">
							<p class="mb-md-0 mb-4">
								Copyright Â© 2023 Designed and Developed by <a
									href="https://themefisher.com/">Phu Phuoc, Quang Sang</a>
							</p>
						</div>
						<div class="col-md-4 text-md-right text-center">
							<ul class="list-inline">
								<li class="list-inline-item"><a
									class="text-color d-inline-block p-2"
									href="https://web.facebook.com/bl16092020"><i
										class="ti-facebook"></i></a></li>
								<li class="list-inline-item"><a
									class="text-color d-inline-block p-2"
									href="https://github.com/phuphuoc1102"><i class="ti-github"></i></a></li>
								<li class="list-inline-item"><a
									class="text-color d-inline-block p-2"
									href="https://www.instagram.com/phamphuphuocc/"><i
										class="ti-instagram"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</footer>
			<!-- /footer -->

			<!-- ** JS Plugins Needed for the Project ** -->
			<!-- jquiry -->
			<script src="plugins/jquery/jquery-1.12.4.js"></script>
			<!-- Bootstrap JS -->
			<script src="plugins/bootstrap/bootstrap.min.js"></script>
			<!-- match-height JS -->
			<script src="plugins/match-height/jquery.matchHeight-min.js"></script>
			<!-- Main Script -->
			<script src="assets/script.js"></script>
			<script>
		function DirectoryDialog() {
			document.getElementById('imageForm').submit();
			var messageDiv = document.getElementById('messageDiv'); // ThÃªm má»t div vá»i id="messageDiv" vÃ o trang HTML
			messageDiv.style.color = "green";
			messageDiv.innerHTML = "Convert Successfully";

		}
	</script>

			<script>
		function enableConvertButton() {
			var fileInput = document.getElementById('fileInput');
			var fileType = fileInput.value.substring(fileInput.value
					.lastIndexOf(".") + 1);
			var username = document.getElementById('username');

			var messageDiv = document.getElementById('messageDiv'); // ThÃªm má»t div vá»i id="messageDiv" vÃ o trang HTML
			if (fileType === "jpg" || fileType === "png" ||fileType === "gif" || fileType === "webp" || fileType==="avif") {
				messageDiv.innerHTML = "";
				var convertButton = document.getElementById('convertButton');

				if (fileInput.files.length > 0 && username != null) {
					convertButton.disabled = false;
				} else if(username == null){
					messageDiv.style.color = "red";
					messageDiv.innerHTML = "You must login before convert";
					convertButton.disabled = true;
				}else{
					convertButton.disabled = true;
				}
			} else {
				messageDiv.style.color = "red";
				messageDiv.innerHTML = "Invalid file type. Please choose a jpg, png, gif, webp or avif file.";
			}
		}
		function convertImage() {
	        var form = document.getElementById('imageForm');
	        var formData = new FormData(form);

	        fetch(form.action, {
	            method: 'POST',
	            body: formData
	        })
	        .then(response => response.text())
	        .then(imageUrl => {
	            var imageUrlInput = document.getElementById('search');
	            imageUrlInput.value = imageUrl;

	            var copyButton = document.getElementById('copyButton');
	            copyButton.disabled = false;
	        })
	        .catch(error => {
	            console.error('Error converting image:', error);
	        });
	    }

	    function copyImageUrl() {
	        var imageUrlInput = document.getElementById('search');
	        // Thực hiện logic copy giá trị trong input (tùy thuộc vào yêu cầu của bạn)
	        // Ví dụ: bạn có thể sử dụng document.execCommand('copy') hoặc Clipboard API.
	        // Ở đây, tôi chỉ in ra giá trị để minh họa.
	        console.log('Copied URL:', imageUrlInput.value);
	    }
	    function copyToClipboard() {

	        // Lấy giá trị của input
	        var imageUrl = document.getElementById('url').value;

	        // Tạo một thẻ textarea tạm thời để đặt giá trị cần copy
	        var tempTextarea = document.createElement('textarea');
	        tempTextarea.value = imageUrl;

	        // Đặt thẻ textarea tạm thời vào trang web
	        document.body.appendChild(tempTextarea);

	        // Chọn toàn bộ nội dung trong thẻ textarea
	        tempTextarea.select();

	        // Thực hiện lệnh copy
	        document.execCommand('copy');

	        // Xóa thẻ textarea tạm thời khỏi trang web
	        document.body.removeChild(tempTextarea);
	        document.getElementById('url').select();
	    }
	</script>
</body>

</html>