<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg bg-light">
    <a class="navbar-brand" href="/ads">Adlister</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a href="/ads/create" class="nav-link">Create Ad</a></li>
            <c:choose>
                <c:when test="${sessionScope.user != null}">
                    <li class="nav-item"><a href="/logout" class="nav-link">Logout</a></li>
                </c:when>
                <c:otherwise>
                    <li class="nav-item"><a href="/login" class="nav-link">Login</a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>
