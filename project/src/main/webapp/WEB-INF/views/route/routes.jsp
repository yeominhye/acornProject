<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Routes</title>
</head>
<body>
    <h1>Routes</h1>
    <ul>
        <c:forEach var="route" items="${routes}">
            <li>
                <a href="/routes/${route.id}">${route.title}</a>
            </li>
        </c:forEach>
    </ul>
</body>
</html>
