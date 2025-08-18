<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Feedbacks</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <script>
        function filterByCourse() {
            const course = document.getElementById('filterCourse').value;
            const url = new URL(window.location.href);
            if (course) {
                url.searchParams.set('course', course);
            } else {
                url.searchParams.delete('course');
            }
            window.location.href = url.toString();
        }
    </script>
</head>
<body class="bg">
<div class="container">
    <div class="topbar">
        <div class="brand">Admin Dashboard</div>
        <div class="actions">
            <a class="btn secondary" href="<c:url value='/jsp/feedbackForm.jsp' />">Feedback Form</a>
            <a class="btn danger" href="<c:url value='/admin/logout' />">Logout</a>
        </div>
    </div>

    <div class="stats glass-card">
        <div class="stat">
            <div class="label">Total Feedbacks</div>
            <div class="value">${total}</div>
        </div>
        <div class="stat">
            <div class="label">Average Rating</div>
            <div class="value">${average}</div>
        </div>
        <div class="stat">
            <div class="label">Filter by Course</div>
            <select id="filterCourse" onchange="filterByCourse()">
                <option value="">All Courses</option>
                <c:set var="courses">
                    <c:out value='Enterprise Java,Spring Framework,Hibernate ORM,JSP &amp; Servlets,Web Development,Database Management' />
                </c:set>
                <c:forEach var="c" items="${fn:split(courses, ',')}">
                    <option value="${c}" <c:if test="${selectedCourse == c}">selected</c:if>>${c}</option>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="grid">
        <c:choose>
            <c:when test="${empty feedbacks}">
                <div class="glass-card center">No feedbacks found.</div>
            </c:when>
            <c:otherwise>
                <c:forEach var="fb" items="${feedbacks}">
                    <div class="card">
                        <div class="card-header">
                            <div class="title">${fb.name}</div>
                            <div class="rating">
                                <c:forEach begin="1" end="5" var="i">
                                    <c:choose>
                                        <c:when test="${i <= fb.rating}">★</c:when>
                                        <c:otherwise>☆</c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row"><span>Email:</span> ${fb.email}</div>
                            <div class="row"><span>Course:</span> ${fb.course}</div>
                            <c:if test="${not empty fb.comments}">
                                <div class="row"><span>Comments:</span> ${fb.comments}</div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>

    <footer>© <script>document.write(new Date().getFullYear())</script> Student Feedback Portal</footer>
</div>
</body>
</html>


