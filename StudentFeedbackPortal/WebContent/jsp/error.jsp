<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body class="bg">
<div class="container">
    <div class="glass-card center">
        <h1>Something went wrong</h1>
        <p>${errorMessage != null ? errorMessage : 'An unexpected error occurred. Please try again later.'}</p>
        <div class="actions">
            <a class="btn primary" href="<c:url value='/jsp/feedbackForm.jsp' />">Back to Feedback Form</a>
            <a class="btn secondary" href="<c:url value='/admin/login' />">Admin Login</a>
        </div>
    </div>
    <footer>© <script>document.write(new Date().getFullYear())</script> Student Feedback Portal</footer>
    </div>
</body>
</html>



