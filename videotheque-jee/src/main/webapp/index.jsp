<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- CSS -->
	<link rel="stylesheet" href="css/bootstrap-reboot.min.css">
	<link rel="stylesheet" href="css/bootstrap-grid.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/plyr.css">
	<link rel="stylesheet" href="css/photoswipe.css">
	<link rel="stylesheet" href="css/default-skin.css">
	<link rel="stylesheet" href="css/main.css">

	<title>FlixGo – Online Movies, TV Shows & Cinema</title>
</head>

<body>
	<!-- header -->
	<header class="header">
		<div class="header__wrap">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="header__content">
							<!-- logo -->
							<a href="index.html" class="header__logo">
								<img src="img/logo.svg" alt="FlixGo Logo">
							</a>

							<!-- header auth -->
							<div class="header__auth">
								<button class="header__search-btn" type="button">
									<i class="icon ion-ios-search"></i>
								</button>

								<a href="signin.html" class="header__sign-in">
									<i class="icon ion-ios-log-in"></i>
									<span>Sign In</span>
								</a>
							</div>
							<!-- end header auth -->

							<!-- header menu -->
							<button class="header__btn" type="button">
								<span></span>
								<span></span>
								<span></span>
							</button>
							<!-- end header menu -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- end header -->

	<!-- home -->
	<section class="home">
		<div class="container">
			<div class="row">
				<div class="col-12">
            		<h1 class="home__title"><b>Popular Movies</b> This Season</h1>
				</div>

				<!-- Movies Carousel -->
				<div class="col-12">
					<div class="owl-carousel home__carousel">
						<c:forEach var="movie" items="${movies}">
							<div class="item">
								<!-- Movie Card -->
								<div class="card card--big">
									<div class="card__cover">
										<img src="https://image.tmdb.org/t/p/w500${movie['poster_path']}" alt="${movie['title']}">
										<a href="#" class="card__play">
											<i class="icon ion-ios-play"></i>
										</a>
									</div>
									<div class="card__content">
										<h3 class="card__title">
											<a href="#">${movie['title']}</a>
										</h3>
										<span class="card__category">
											<c:forEach var="genre" items="${movie['genres']}">
												<a href="#">${genre}</a>
											</c:forEach>
										</span>
										<span class="card__rate">
											<i class="icon ion-ios-star"></i>${movie['vote_average']}
										</span>
									</div>
								</div>
								<!-- end movie card -->
							</div>
						</c:forEach>
					</div>
				</div>
				<!-- end movies carousel -->
			</div>
		</div>
	</section>
	<!-- end home -->

	<!-- footer -->
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="footer__copyright">
						<small>
							<a target="_blank" href="https://www.templateshub.net">MHB</a>
						</small>
						<ul>
							<li><a href="#">Master DAS</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end footer -->

	<!-- JS -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>
