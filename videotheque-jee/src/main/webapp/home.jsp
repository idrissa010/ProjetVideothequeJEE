<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/main.css">
    <title>FlixGo – Popular Movies</title>
</head>

<body>
    <!-- Header -->
    <header class="header">
        <div class="header__wrap">
            <div class="container">
                <div class="header__content">
                    <a href="#" class="header__logo">
                        <img src="img/logo.svg" alt="FlixGo Logo">
                    </a>
                </div>
            </div>
        </div>
    </header>

    <!-- Section -->
    <section class="home">
        <div class="container">
            <h1 class="home__title"><b>Popular Movies</b> This Season</h1>
            <div class="row">
                <div class="owl-carousel home__carousel">
                    <c:forEach var="movie" items="${movies}">
                        <div class="item">
                            <div class="card">
                                <div class="card__cover">
                                    <img src="https://image.tmdb.org/t/p/w500${movie.poster_path}" alt="${movie.title}">
                                    <a href="#" class="card__play">
                                        <i class="icon ion-ios-play"></i>
                                    </a>
                                </div>
                                <div class="card__content">
                                    <h3 class="card__title">
                                        <a href="#">${movie.title}</a>
                                    </h3>
                                    <span class="card__rate">
                                        <i class="icon ion-ios-star"></i> ${movie.vote_average}
                                    </span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <p>FlixGo &copy; 2024. All rights reserved.</p>
        </div>
    </footer>

    <!-- JS -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
</body>

</html>
