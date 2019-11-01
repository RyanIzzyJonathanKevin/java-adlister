<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="View Current Event"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

        <div class="container mt-5">
            <h1>${ad.title}</h1>
            <div class="row">
                <div class="col-md-8">
                    <p>${ad.description}</p>
                    <c:if test="${user.id == ad.userId}">
                        <a href="/ads/update?id=${ad.id}" class="btn btn-primary">Edit</a>
                        <a href="/ad/delete?id=${ad.id}" class="btn btn-danger">Delete</a>
                    </c:if>
                </div>
                <div class="col-md-4">
                    <div style="width: 100%; height: 300px" id="map"></div>
                </div>
            </div>
            <c:forEach var="cat" items="${ad.categories}">
                <span class="badge badge-light mb-1">${cat}</span>
            </c:forEach>
        </div>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDzaeV4w3j9zQXWGSJ9tBkIH00rZzO0m4E&callback=initMap" async defer></script>
        <script>
            let map;

            let latlong = {lat: ${ad.lat}, lng: ${ad.lon}};

            function initMap() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: latlong,
                    zoom: 17,
                    mapTypeId: 'roadmap'
                });

                let marker = new google.maps.Marker({
                    position: latlong,
                    map: map,
                    title: `${ad.title}`
                });
            }
        </script>
    </body>
</html>
