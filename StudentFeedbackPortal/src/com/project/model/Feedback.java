package com.project.model;

import java.time.LocalDateTime;

public class Feedback {

    private Integer id;
    private String name;
    private String email;
    private String course;
    private Integer rating;
    private String comments;
    private LocalDateTime date;

    public Feedback() {
    }

    public Feedback(String name, String email, String course, Integer rating, String comments) {
        this.name = name;
        this.email = email;
        this.course = course;
        this.rating = rating;
        this.comments = comments;
        this.date = LocalDateTime.now();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }



    @Override
    public String toString() {
        return "Feedback{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", course='" + course + '\'' +
                ", rating=" + rating +
                ", comments='" + comments + '\'' +
                ", date=" + date +
                '}';
    }
}


