<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="View Current Ad"/>
        </jsp:include>
    </head>
    <body>
        <jsp:include page="/WEB-INF/partials/navbar.jsp"/>

        <div class="container">
            <div class="card text-center">
                <div class="card-header display-4">${ad.title}</div>

                <div class="card-body">
                    <p class="card-text">${ad.description}</p>

                    <c:forEach var="cat" items="${ad.categories}">
                        <span class="badge badge-light mb-1">${cat}</span>
                    </c:forEach>
                    <hr>
                    <c:if test="${user.id == ad.userId}">
                        <a href="/ads/update?id=${ad.id}" class="btn btn-primary">Edit</a>
                        <a href="/ad/delete?id=${ad.id}" class="btn btn-danger">Delete</a>
                    </c:if>

                </div>
            </div>
            <div style="width: 100%; height: 500px" id="map"></div>

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
