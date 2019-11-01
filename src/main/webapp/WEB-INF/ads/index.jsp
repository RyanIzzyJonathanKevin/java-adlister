<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Viewing All The Ads"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

        <form action="/ads">
            <input type="text" class="form-control" name="search">
            <button class="btn">Search</button>
        </form>

        <div class="container">
            <div class="row">
                <c:forEach var="ad" items="${ads}">
                    <div class="col-md-3 mb-4">
                        <div class="card">
                            <img class="card-img-top" src="https://via.placeholder.com/150" alt="">
                            <div class="card-body">
                                <h5 class="card-title text-truncate"><a href="/ad?id=${ad.id}">${ad.title}</a></h5>
                                <p class="card-text text-truncate">${ad.description}</p>
                                <c:forEach var="cat" items="${ad.categories}">
                                    <span class="badge badge-light">${cat}</span>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>


        </div>

    </body>
</html>
