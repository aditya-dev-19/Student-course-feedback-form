package com.project.controller;

import com.project.dao.FeedbackDAO;
import com.project.model.Feedback;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminLoginController {

    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin123";

    @GetMapping("/login")
    public String loginPage() {
        return "jsp/adminLogin";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            session.setAttribute("admin", Boolean.TRUE);
            return "redirect:/admin/dashboard";
        }
        model.addAttribute("error", "Invalid credentials");
        return "jsp/adminLogin";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }

    @GetMapping("/dashboard")
    public String dashboard(@RequestParam(name = "course", required = false) String course,
                            Model model,
                            HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }
        FeedbackDAO feedbackDAO = new FeedbackDAO();
        List<Feedback> feedbacks = (course == null || course.isEmpty())
                ? feedbackDAO.getAllFeedbacks()
                : feedbackDAO.getFeedbacksByCourse(course);

        double average = feedbacks.stream().mapToInt(Feedback::getRating).average().orElse(0.0);
        model.addAttribute("feedbacks", feedbacks);
        model.addAttribute("total", feedbacks.size());
        model.addAttribute("average", String.format("%.2f", average));
        model.addAttribute("selectedCourse", course == null ? "" : course);
        return "jsp/viewFeedback";
    }
}



