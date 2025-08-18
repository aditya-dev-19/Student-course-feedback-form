package com.project.dao;

import com.project.model.Feedback;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackDAO {
	
	private static final String DB_URL = "jdbc:mysql://localhost:3306/student_feedback_portal?useSSL=false&serverTimezone=UTC";
	private static final String DB_USER = "root";
	private static final String DB_PASSWORD = "root";

	public void saveFeedback(Feedback feedback) {
		String sql = "INSERT INTO feedbacks (name, email, course, rating, comments, date) VALUES (?, ?, ?, ?, ?, ?)";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, feedback.getName());
				pstmt.setString(2, feedback.getEmail());
				pstmt.setString(3, feedback.getCourse());
				pstmt.setInt(4, feedback.getRating());
				pstmt.setString(5, feedback.getComments());
				pstmt.setTimestamp(6, Timestamp.valueOf(feedback.getDate()));
				pstmt.executeUpdate();
			}
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException("Error saving feedback", e);
		}
	}

	public List<Feedback> getAllFeedbacks() {
		List<Feedback> feedbacks = new ArrayList<>();
		String sql = "SELECT * FROM feedbacks ORDER BY date DESC";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				 Statement stmt = conn.createStatement();
				 ResultSet rs = stmt.executeQuery(sql)) {
				while (rs.next()) {
					feedbacks.add(mapResultSetToFeedback(rs));
				}
			}
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException("Error retrieving feedbacks", e);
		}
		return feedbacks;
	}

	public Feedback getFeedbackById(int id) {
		String sql = "SELECT * FROM feedbacks WHERE id = ?";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setInt(1, id);
				ResultSet rs = pstmt.executeQuery();
				if (rs.next()) {
					return mapResultSetToFeedback(rs);
				}
			}
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException("Error retrieving feedback", e);
		}
		return null;
	}

	public List<Feedback> getFeedbacksByCourse(String course) {
		List<Feedback> feedbacks = new ArrayList<>();
		String sql = "SELECT * FROM feedbacks WHERE course = ? ORDER BY date DESC";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
				 PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, course);
				ResultSet rs = pstmt.executeQuery();
				while (rs.next()) {
					feedbacks.add(mapResultSetToFeedback(rs));
				}
			}
		} catch (SQLException | ClassNotFoundException e) {
			throw new RuntimeException("Error retrieving feedbacks by course", e);
		}
		return feedbacks;
	}

	private Feedback mapResultSetToFeedback(ResultSet rs) throws SQLException {
		Feedback feedback = new Feedback();
		feedback.setId(rs.getInt("id"));
		feedback.setName(rs.getString("name"));
		feedback.setEmail(rs.getString("email"));
		feedback.setCourse(rs.getString("course"));
		feedback.setRating(rs.getInt("rating"));
		feedback.setComments(rs.getString("comments"));
		feedback.setDate(rs.getTimestamp("date").toLocalDateTime());
		return feedback;
	}
}



