<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/animations.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body class="bg">
<div class="container">
    <div class="glass-card">
        <h1>Admin Login</h1>
        <p class="hint">Use demo credentials: <strong>admin / admin123</strong></p>
        <c:if test="${not empty error}">
            <div class="alert">${error}</div>
        </c:if>
        <form action="<c:url value='/admin/login'/>" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="actions">
                <button type="submit" class="btn primary">Login</button>
                <a class="btn secondary" href="<c:url value='/jsp/feedbackForm.jsp' />">Back to Form</a>
            </div>
        </form>
    </div>
    <footer>© <script>document.write(new Date().getFullYear())</script> Student Feedback Portal</footer>
    </div>
</body>
</html>



