<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Feedback Portal - Welcome</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/animations.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/buttons.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Add ripple effect to buttons
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(btn => {
                btn.addEventListener('click', function(e) {
                    let x = e.clientX - e.target.offsetLeft;
                    let y = e.clientY - e.target.offsetTop;
                    
                    let ripple = document.createElement('span');
                    ripple.className = 'ripple';
                    ripple.style.left = x + 'px';
                    ripple.style.top = y + 'px';
                    
                    this.appendChild(ripple);
                    
                    setTimeout(() => ripple.remove(), 600);
                });
            });
        });
    </script>
    <style>
        /* Button animations */
        @keyframes buttonPulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.02); }
            100% { transform: scale(1); }
        }
        
        @keyframes rippleEffect {
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        .hero {
            text-align: center;
            padding: 60px 20px;
        }
        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 1.5rem;
            color: #ffffff;
            text-shadow: 0 2px 10px rgba(56, 189, 248, 0.3);
            font-weight: 700;
            letter-spacing: -1px;
        }
        @keyframes titleAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }
        .hero p {
            font-size: 1.25rem;
            color: #ffffff;
            margin-bottom: 2rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
            opacity: 0.9;
        }
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 2rem;
            padding: 2rem 0;
        }
        .feature-card {
            background: rgba(30, 41, 59, 0.5);
            border: 1px solid rgba(148, 163, 184, 0.1);
            border-radius: 16px;
            padding: 2rem;
            text-align: center;
            transition: transform 0.3s ease;
            color: #ffffff;
        }
        .feature-card h3 {
            color: #ffffff;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }
        .feature-card p {
            color: #ffffff;
            opacity: 0.9;
        }
        .feature-card:hover {
            transform: translateY(-10px);
        }
        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #ffffff;
            opacity: 0.9;
            text-shadow: 0 2px 10px rgba(255, 255, 255, 0.2);
        }
        .cta-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }
        .btn.primary {
            background: linear-gradient(135deg, #38bdf8, #818cf8);
            color: white;
            padding: 1rem 2rem;
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: all 0.3s ease;
        }
        .btn.primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 25px rgba(56, 189, 248, 0.3);
        }
        .btn.secondary {
            background: rgba(30, 41, 59, 0.8);
            color: #e2e8f0;
            border: 1px solid rgba(148, 163, 184, 0.2);
        }
    </style>
</head>
<body class="bg">
    <div class="container">
        <div class="hero card-enter">
            <h1>Student Course Feedback Portal</h1>
            <p>Share your valuable insights and help us improve the learning experience. Your feedback shapes the future of education.</p>
            <div class="cta-buttons">
                <a href="<c:url value='/jsp/feedbackForm.jsp'/>" class="btn primary">Submit Feedback</a>
                <a href="<c:url value='/jsp/adminLogin.jsp'/>" class="btn secondary">Admin Login</a>
            </div>
        </div>

        <div class="features">
            <div class="feature-card card-enter float">
                <div class="feature-icon">📝</div>
                <h3>Easy Submission</h3>
                <p>Submit your feedback quickly and easily through our intuitive interface</p>
            </div>
            <div class="feature-card card-enter float">
                <div class="feature-icon">⭐</div>
                <h3>Course Ratings</h3>
                <p>Rate your courses and provide detailed feedback to help improve the curriculum</p>
            </div>
            <div class="feature-card card-enter float">
                <div class="feature-icon">🔒</div>
                <h3>Secure & Anonymous</h3>
                <p>Your feedback is handled securely and can be submitted anonymously</p>
            </div>
        </div>
    </div>
</body>
</html>
