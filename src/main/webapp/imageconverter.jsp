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
<style>
	button, input {
	    color: aliceblue;
	    overflow: visible;
	    background-color: #9379793b;
	}
</style>
</head>

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
					<h1 class="text-white mb-3">Image to URL Converting
						System</h1>
					<p class="text-white mb-4">Transforming Images into Shareable Links: Convert Your Pictures to URLs Effortlessly!</p>
					<div class="position-relative">
						<form id="imageForm" action="image-to-url" method="post"
							enctype="multipart/form-data">
							<div class="mb-3 d-flex">
								<div class="flex-grow-1">
									<input type="file" id="fileInput" name="imageFile"
										placeholder="Choose file to convert from pdf to docx"
										onchange="enableConvertButton()">
								</div>
								<div class="ml-2">
									<button class="btn btn-success btn-sm rounded" disabled
										type="button" id="convertButton"
										onclick="openDirectoryDialog()">Convert</button>
								</div>
							</div>

							<div class="mb-3 d-flex">
								<%
								if (request.getSession().getAttribute("imageUrl") == null) {
								%>
								<div class="flex-grow-1">
									<input readonly id="url" class="form-control"
										placeholder="Url after converted">
								</div>
								<div class="ml-2">
									<button class="btn btn-success btn-sm rounded" disabled
										type="button" id="copyButton">Copy</button>
								</div>
								<%
								} else
								%>
								<%
								if (request.getSession().getAttribute("imageUrl") != null) {
								%>
								<div class="flex-grow-1">
									<input readonly id="url" class="form-control"
										value="<%=request.getSession().getAttribute("imageUrl")%>">
								</div>
								<div class="ml-2">
									<button class="btn btn-success btn-sm rounded" type="button"
										id="copyButton" onclick="copyToClipboard()">Copy</button>
								</div>
								<%
								}
								request.getSession().removeAttribute("imageUrl");
								%>
							</div>
						</form>
						<p id="messageDiv"></p>
					</div>

				</div>
			</div>
		</div>
		<!-- /banner -->
	</header>
	<!-- /header -->

	<!-- topics -->
	<section class="section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 text-center">
					<h2 class="section-title">Find your way to contact with me</h2>
				</div>
				<!-- topic-item -->
				<div class="col-lg-4 col-sm-6 mb-4">
					<a href="https://web.facebook.com/bl16092020"
						class="px-4 py-5 bg-white shadow text-center d-block match-height">
						<i class="ti-facebook icon text-primary d-block mb-4"></i>
						<h3 class="mb-3 mt-0">Facebook</h3>
						<p class="mb-0"></p>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<a href="https://github.com/phuphuoc1102"
						class="px-4 py-5 bg-white shadow text-center d-block match-height">
						<i class="ti-github icon text-primary d-block mb-4"></i>
						<h3 class="mb-3 mt-0">Github</h3>
						<p class="mb-0"></p>
					</a>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<a href="https://www.instagram.com/phamphuphuocc/"
						class="px-4 py-5 bg-white shadow text-center d-block match-height">
						<i class="ti-instagram icon text-primary d-block mb-4"></i>
						<h3 class="mb-3 mt-0">Instagram</h3>
						<p class="mb-0"></p>
					</a>
				</div>
			</div>
		</div>
	</section>
	<!-- /topics -->
	<!-- /call to action -->

	<!-- footer -->
	<footer class="section pb-4">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-8 text-md-left text-center">
					<p class="mb-md-0 mb-4">
						Copyright ÃÂ© 2023 Designed and Developed by <a
							href="https://themefisher.com/">Phu Phuoc, Quang Sang</a>
					</p>
				</div>
				<div class="col-md-4 text-md-right text-center">
					<ul class="list-inline">
						<li class="list-inline-item"><a
							class="text-color d-inline-block p-2" href="https://web.facebook.com/bl16092020"><i
								class="ti-facebook"></i></a></li>
						<li class="list-inline-item"><a
							class="text-color d-inline-block p-2" href="https://github.com/phuphuoc1102"><i
								class="ti-github"></i></a></li>
						<li class="list-inline-item"><a
							class="text-color d-inline-block p-2" href="https://www.instagram.com/phamphuphuocc/"><i
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
		function getFileName() {
			var fileInput = document.getElementById('myFile');
			var fileName = fileInput.files[0].name;
			console.log(fileName); // In ra tên file
		}
	</script>
	
	<script>
		function openDirectoryDialog() {
			document.getElementById('imageForm').submit();
			var messageDiv = document.getElementById('messageDiv'); // ThÃÂªm mÃ¡Â»Ât div vÃ¡Â»Âi id="messageDiv" vÃÂ o trang HTML
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

			var messageDiv = document.getElementById('messageDiv'); // ThÃÂªm mÃ¡Â»Ât div vÃ¡Â»Âi id="messageDiv" vÃÂ o trang HTML
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
	        // Thá»±c hiá»n logic copy giÃ¡ trá» trong input (tÃ¹y thuá»c vÃ o yÃªu cáº§u cá»§a báº¡n)
	        // VÃ­ dá»¥: báº¡n cÃ³ thá» sá»­ dá»¥ng document.execCommand('copy') hoáº·c Clipboard API.
	        // á» ÄÃ¢y, tÃ´i chá» in ra giÃ¡ trá» Äá» minh há»a.
	        console.log('Copied URL:', imageUrlInput.value);
	    }
	    function copyToClipboard() {

	        // Láº¥y giÃ¡ trá» cá»§a input
	        var imageUrl = document.getElementById('url').value;

	        // Táº¡o má»t tháº» textarea táº¡m thá»i Äá» Äáº·t giÃ¡ trá» cáº§n copy
	        var tempTextarea = document.createElement('textarea');
	        tempTextarea.value = imageUrl;

	        // Äáº·t tháº» textarea táº¡m thá»i vÃ o trang web
	        document.body.appendChild(tempTextarea);

	        // Chá»n toÃ n bá» ná»i dung trong tháº» textarea
	        tempTextarea.select();

	        // Thá»±c hiá»n lá»nh copy
	        document.execCommand('copy');

	        // XÃ³a tháº» textarea táº¡m thá»i khá»i trang web
	        document.body.removeChild(tempTextarea);
	        document.getElementById('url').select();
	    }
	</script>
</body>

</html>