# Student Course Feedback Portal

A complete web application for collecting and managing student course feedback using Enterprise Java technologies.

## Technology Stack

- **JSP** (JavaServer Pages) for front-end pages
- **Servlets** for handling HTTP requests and form submissions
- **JSTL & EL** (JSP Standard Tag Library & Expression Language) for dynamic content
- **Hibernate ORM** for database operations and entity mapping
- **Spring MVC** for admin authentication and controller management
- **MySQL** database for data persistence
- **CSS** for modern responsive styling
- **JavaScript** for form validation and UI enhancements

## Features

### Student Module
- Interactive feedback form with course selection dropdown
- Star rating system (1-5 stars)
- Form validation (client-side and server-side)
- Success confirmation after submission
- Data stored in database via Hibernate

### Admin Module
- Secure login (username: `admin`, password: `admin123`)
- Dashboard to view all submitted feedbacks
- Filter feedbacks by course
- Statistics display (total feedbacks, average rating)
- Professional card-based layout

## Project Structure

```
StudentFeedbackPortal/
├── src/
│   ├── com/project/controller/
│   │   ├── SubmitFeedbackServlet.java
│   │   └── AdminLoginController.java
│   ├── com/project/model/
│   │   └── Feedback.java
│   ├── com/project/dao/
│   │   └── FeedbackDAO.java
│   └── com/project/util/
│       └── HibernateUtil.java
├── WebContent/
│   ├── WEB-INF/
│   │   ├── web.xml
│   │   └── applicationContext.xml
│   ├── jsp/
│   │   ├── feedbackForm.jsp
│   │   ├── success.jsp
│   │   ├── adminLogin.jsp
│   │   ├── viewFeedback.jsp
│   │   └── error.jsp
│   └── css/
│       └── style.css
├── hibernate.cfg.xml
└── pom.xml
```

## Database Schema

The application uses a `feedbacks` table with the following structure:

```sql
CREATE TABLE feedbacks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    course VARCHAR(100) NOT NULL,
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comments VARCHAR(255),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

## Setup Instructions

### Prerequisites
- Java 21 or higher
- Maven 3.6+
- MySQL 8.0+
- Tomcat 10

### Installation Steps

1. **Clone/Download the project**
   ```bash
   cd /path/to/project
   ```

2. **Install dependencies**
   ```bash
   sudo apt update
   sudo apt install -y openjdk-21-jdk maven mysql-server tomcat10
   ```

3. **Start MySQL and create database**
   ```bash
   sudo systemctl start mysql
   sudo mysql -e "CREATE DATABASE IF NOT EXISTS student_feedback_portal DEFAULT CHARACTER SET utf8mb4;"
   ```

4. **Configure database connection**
   - Edit `hibernate.cfg.xml`
   - Update username/password for your MySQL installation
   - Default: username=`root`, password=`root`

5. **Build the project**
   ```bash
   mvn clean package -DskipTests
   ```

6. **Deploy to Tomcat**
   ```bash
   sudo cp target/StudentFeedbackPortal.war /var/lib/tomcat10/webapps/
   sudo systemctl restart tomcat10
   ```

## Usage

### Access the Application

- **Feedback Form**: `http://localhost:8080/StudentFeedbackPortal/jsp/feedbackForm.jsp`
- **Admin Login**: `http://localhost:8080/StudentFeedbackPortal/admin/login`

### Admin Credentials
- Username: `admin`
- Password: `admin123`

### Available Courses
- Enterprise Java
- Spring Framework
- Hibernate ORM
- JSP & Servlets
- Web Development
- Database Management

## Features in Detail

### Form Validation
- Client-side JavaScript validation
- Server-side Java validation
- Email format validation
- Required field validation
- Rating range validation (1-5)

### Responsive Design
- Modern glassmorphism UI
- Mobile-friendly responsive layout
- Interactive star rating system
- Smooth animations and hover effects
- Professional card-based design

### Security Features
- Session management for admin access
- Input sanitization
- SQL injection prevention via Hibernate
- XSS protection

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Verify MySQL is running: `sudo systemctl status mysql`
   - Check credentials in `hibernate.cfg.xml`
   - Ensure database exists: `sudo mysql -e "SHOW DATABASES;"`

2. **Tomcat Deployment Issues**
   - Check Tomcat logs: `sudo journalctl -u tomcat10 -n 50`
   - Verify WAR file exists in webapps directory
   - Check file permissions

3. **Build Errors**
   - Ensure Java 21 is installed: `java -version`
   - Verify Maven is working: `mvn -version`
   - Check all dependencies are resolved

### Logs Location
- Tomcat logs: `/var/log/tomcat10/`
- Application logs: `/var/lib/tomcat10/logs/`

## Development

### Adding New Features
1. Create model classes in `src/com/project/model/`
2. Add DAO methods in `src/com/project/dao/`
3. Create controllers in `src/com/project/controller/`
4. Add JSP pages in `WebContent/jsp/`
5. Update CSS in `WebContent/css/style.css`

### Database Changes
1. Modify the `Feedback` entity class
2. Update `hibernate.cfg.xml` if needed
3. Set `hibernate.hbm2ddl.auto=update` for auto-schema updates

## License

This project is created for academic purposes and demonstrates Enterprise Java development practices.

## Support

For issues or questions:
1. Check the troubleshooting section above
2. Review Tomcat and MySQL logs
3. Verify all prerequisites are installed correctly
