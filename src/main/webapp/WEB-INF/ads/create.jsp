<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />    <div class="container">
        <h1>Create a new Event</h1>
        <p class="text-danger">${sessionScope.error}</p>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label for="location">Location</label>
                <input id="location" name="location" class="form-control" type="text">
            </div>

<%--            Category Checkbox--%>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" name="categoryCheckbox" id="concert" value="1">
                <label class="form-check-label" for="concert">Concert</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" name="categoryCheckbox" id="movie" value="2">
                <label class="form-check-label" for="movie">Movie</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" name="categoryCheckbox" id="charity" value="3">
                <label class="form-check-label" for="charity">Charity</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" name="categoryCheckbox" id="sports" value="4">
                <label class="form-check-label" for="sports">sports</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" name="categoryCheckbox" id="musical" value="5">
                <label class="form-check-label" for="musical">musical</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox" name="categoryCheckbox" id="arts" value="6">
                <label class="form-check-label" for="arts">arts</label>
            </div>
            <input type="submit" class="btn btn-block btn-primary">
        </form>
    </div>
</body>
</html>
