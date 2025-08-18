package com.project.controller;

import com.project.dao.FeedbackDAO;
import com.project.model.Feedback;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class SubmitFeedbackServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/feedbackForm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");
        String ratingStr = request.getParameter("rating");
        String comments = request.getParameter("comments");

        String error = validate(name, email, course, ratingStr);
        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("/jsp/feedbackForm.jsp").forward(request, response);
            return;
        }

        int rating = Integer.parseInt(ratingStr);
        Feedback feedback = new Feedback(name.trim(), email.trim(), course.trim(), rating, comments == null ? null : comments.trim());

        try {
            new FeedbackDAO().saveFeedback(feedback);
            request.setAttribute("name", name);
            request.getRequestDispatcher("/jsp/success.jsp").forward(request, response);
        } catch (Exception ex) {
            // Log full exception for debugging
            getServletContext().log("Failed to save feedback", ex);
            request.setAttribute("errorMessage", "An error occurred while saving feedback. Please try again.");
            request.getRequestDispatcher("/jsp/error.jsp").forward(request, response);
        }
    }

    private String validate(String name, String email, String course, String ratingStr) {
        if (name == null || name.trim().isEmpty()) return "Name is required";
        if (email == null || email.trim().isEmpty()) return "Email is required";
        if (!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$")) return "Invalid email format";
        if (course == null || course.trim().isEmpty()) return "Course is required";
        if (ratingStr == null || ratingStr.trim().isEmpty()) return "Rating is required";
        try {
            int r = Integer.parseInt(ratingStr);
            if (r < 1 || r > 5) return "Rating must be between 1 and 5";
        } catch (NumberFormatException e) {
            return "Rating must be a number";
        }
        return null;
    }
}



