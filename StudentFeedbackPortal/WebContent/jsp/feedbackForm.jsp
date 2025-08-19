<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Course Feedback</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/animations.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        .stars {
            display: inline-flex;
            gap: 4px;
            font-size: 28px;
            cursor: pointer;
        }
        .star {
            transition: all 0.3s ease;
            transform-origin: center;
        }
        .star:hover {
            transform: scale(1.2);
        }
        .star.selected {
            color: #fbbf24;
            text-shadow: 0 0 15px rgba(251, 191, 36, 0.5);
            animation: starPop 0.3s ease-out;
        }
        @keyframes starPop {
            0% { transform: scale(1); }
            50% { transform: scale(1.3); }
            100% { transform: scale(1); }
        }
        .stars:hover .star {
            color: #fbbf24;
        }
        .stars .star:hover ~ .star {
            color: #64748b;
        }
        .star-rating-value {
            margin-top: 8px;
            font-size: 14px;
            color: #94a3b8;
            text-align: center;
            min-height: 20px;
        }
    </style>
    <script>
        function selectRating(value) {
            document.getElementById('rating').value = value;
            const stars = document.querySelectorAll('.star');
            const ratingValue = document.getElementById('rating-value');
            
            stars.forEach((s, idx) => {
                if (idx < value) {
                    s.classList.add('selected');
                    s.style.color = '#fbbf24';
                } else {
                    s.classList.remove('selected');
                    s.style.color = '#64748b';
                }
            });

            // Update rating text
            const ratingTexts = [
                'Not Rated',
                'Poor',
                'Fair',
                'Good',
                'Very Good',
                'Excellent'
            ];
            ratingValue.textContent = ratingTexts[value];
        }

        // Initialize stars hover effect
        document.addEventListener('DOMContentLoaded', function() {
            const stars = document.querySelectorAll('.star');
            const ratingValue = document.getElementById('rating-value');
            const ratingInput = document.getElementById('rating');

            stars.forEach((star, index) => {
                // Show rating text on hover
                star.addEventListener('mouseenter', () => {
                    const ratingTexts = [
                        'Poor',
                        'Fair',
                        'Good',
                        'Very Good',
                        'Excellent'
                    ];
                    ratingValue.textContent = ratingTexts[index];
                });

                // Restore selected rating text when mouse leaves
                star.addEventListener('mouseleave', () => {
                    const selectedRating = ratingInput.value;
                    const ratingTexts = [
                        'Not Rated',
                        'Poor',
                        'Fair',
                        'Good',
                        'Very Good',
                        'Excellent'
                    ];
                    ratingValue.textContent = selectedRating ? ratingTexts[selectedRating] : 'Not Rated';
                });
            });
        });

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
                <div class="rating-container">
                    <div class="stars">
                        <span class="star" onclick="selectRating(1)" title="Poor">★</span>
                        <span class="star" onclick="selectRating(2)" title="Fair">★</span>
                        <span class="star" onclick="selectRating(3)" title="Good">★</span>
                        <span class="star" onclick="selectRating(4)" title="Very Good">★</span>
                        <span class="star" onclick="selectRating(5)" title="Excellent">★</span>
                    </div>
                    <div id="rating-value" class="star-rating-value">Not Rated</div>
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



