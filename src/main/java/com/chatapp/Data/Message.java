package com.chatapp.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "msg")
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String text;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "usr_id")
    private User author;

    private LocalDateTime time_published;

    public Message() {

    }

    public Message(String text, User user) {
        this.text = text;
        this.author = user;
        System.out.println(LocalDateTime.now());
    }

    public LocalDateTime getTimestamp() {
        return time_published;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.time_published = timestamp;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }
}