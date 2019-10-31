<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <div class="row">
            <div class="col-4">
                <h1>Welcome, ${sessionScope.user.username}!</h1>
                <img src="http://placehold.jp/300x300.png" alt="Placeholder Image">
                <h5>Username</h5>
                <p>${sessionScope.user.username}</p>
                <h5>Email</h5>
                <p>${sessionScope.user.email}</p>
            </div>

            <div class="col-8 border-left">
            <c:forEach var="ad" items="${ads}">
                <div class="card text-center my-3">
                    <h3 class="card-header">${ad.title}</h3>
                    <div class="card-body">
                        <p class="card-text">${ad.description}</p>

                        <c:forEach var="cat" items="${ad.categories}">
                            <span class="badge badge-light mb-1">${cat}</span>
                        </c:forEach>
                        <hr>
                            <button type="button" class="btn btn-primary">Edit</button>
                            <a href="/ad/delete?id=${ad.id}" class="btn btn-danger">Delete</a>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>

    </div>

</body>
</html>
