<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course Feedback</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <script>
        function selectRating(value) {
            document.getElementById('rating').value = value;
            const stars = document.querySelectorAll('.star');
            stars.forEach((s, idx) => {
                s.classList.toggle('selected', idx < value);
            });
        }
        function validateForm() {
            const name = document.getElementById('name').value.trim();
            const email = document.getElementById('email').value.trim();
            const course = document.getElementById('course').value.trim();
            const rating = document.getElementById('rating').value.trim();
            if (!name) { alert('Name is required'); return false; }
            if (!email || !/^([A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+)$/.test(email)) { alert('Valid email is required'); return false; }
            if (!course) { alert('Course is required'); return false; }
            if (!rating || parseInt(rating) < 1 || parseInt(rating) > 5) { alert('Please select a rating between 1 and 5'); return false; }
            return true;
        }
    </script>
</head>
<body class="bg">
<div class="container">
    <div class="glass-card">
        <h1>Student Course Feedback</h1>
        <c:if test="${not empty error}">
            <div class="alert">${error}</div>
        </c:if>
        <form action="<c:url value='/submitFeedback'/>" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Your full name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="you@example.com" required>
            </div>
            <div class="form-group">
                <label for="course">Course</label>
                <select id="course" name="course" required>
                    <option value="">-- Select Course --</option>
                    <option>Enterprise Java</option>
                    <option>Spring Framework</option>
                    <option>Hibernate ORM</option>
                    <option>JSP &amp; Servlets</option>
                    <option>Web Development</option>
                    <option>Database Management</option>
                </select>
            </div>
            <div class="form-group">
                <label>Rating</label>
                <div class="stars">
                    <span class="star" onclick="selectRating(1)">★</span>
                    <span class="star" onclick="selectRating(2)">★</span>
                    <span class="star" onclick="selectRating(3)">★</span>
                    <span class="star" onclick="selectRating(4)">★</span>
                    <span class="star" onclick="selectRating(5)">★</span>
                </div>
                <input type="hidden" id="rating" name="rating" value="">
            </div>
            <div class="form-group">
                <label for="comments">Comments</label>
                <textarea id="comments" name="comments" rows="4" placeholder="Share your thoughts (optional)"></textarea>
            </div>
            <div class="actions">
                <button type="submit" class="btn primary">Submit Feedback</button>
                <a class="btn secondary" href="<c:url value='/admin/login' />">Admin Login</a>
            </div>
        </form>
    </div>
    <footer>© <script>document.write(new Date().getFullYear())</script> Student Feedback Portal</footer>
    </div>
</body>
</html>



