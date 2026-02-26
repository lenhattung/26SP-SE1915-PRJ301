<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Search</title>
    </head>
    <body>

        <jsp:include page="welcome.jsp" />

        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>

        <c:if test="${not empty user}">
            
            <a href="university-form.jsp"> Add </a>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="searchUniversity"/>
                Input name:
                <input type="text" name="keywords" value="${keywords}" />
                <input type="submit" value="Search"/>
            </form>
            <hr/>

            <c:if test="${empty list}">
                No data matching the search criteria found!
            </c:if>

            <c:if test="${not empty list}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Short Name</th>
                            <th>City</th>
                            <th>Region</th>
                            <th>Type</th>
                            <th>Founded Year</th>
                            <th>Students</th>
                            <th>Faculties</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>

                    <c:forEach items="${list}" var="u">
                        <tr>
                            <td>${u.id}</td>
                            <td>${u.name}</td>
                            <td>${u.shortName}</td>
                            <td>${u.city}</td>
                            <td>${u.region}</td>
                            <td>${u.type}</td>
                            <td>${u.foundedYear}</td>
                            <td>${u.totalStudents}</td>
                            <td>${u.totalFaculties}</td>
                            <td>
                                <c:if test="${u.isDraft}">
                                    <a href="MainController?action=updateUniversity&id=${u.id}"/>Update</a>
                                </c:if>
                            </td>
                            <td>
                                <form action="MainController" method="POST"
                                      onsubmit="return confirm('Bạn có chắc chắn muốn xóa trường đại học này không?');">
                                    <input type="hidden" name="action" value="deleteUniversity"/>
                                    <input type="hidden" name="id" value="${u.id}"/>
                                    <input type="hidden" name="keywords" value="${keywords}"/>
                                    <input type="submit" value="Delete"/>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </c:if>
    </body>
</html>
