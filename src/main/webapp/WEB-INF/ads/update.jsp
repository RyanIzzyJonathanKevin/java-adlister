<%--
  Created by IntelliJ IDEA.
  User: 13uttsoup
  Date: 2019-10-30
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update Your Event" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />    <div class="container">


    <h1>Edit Your Ad</h1>
    <p class="text-danger">${sessionScope.error}</p>
    <form action="/ads/update" method="post">
        <div class="form-group">
            <label  for="update-title">Title</label>
            <input id="update-title" name="title" class="form-control" value="${ad.title}" type="text">
        </div>
        <input type="hidden" name="id" value="${ad.id}">
        <div class="form-group">
            <label for="update-description">Description</label>
            <textarea id="update-description" name="description" class="form-control"  type="text">${ad.description}</textarea>
        </div>
        <div class="form-group">
            <label for="location">Location</label>
            <input id="location" name="location" class="form-control" type="text">
        </div>
        <%--            Category Checkbox--%>
        <p>Please select categories</p>
        <div class="form-check form-check-inline">
            <input class="form-check-input " type="checkbox" name="categoryCheckbox" id="concert" value="1">
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
