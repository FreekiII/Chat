package com.chatapp.Data;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Table(name = "room")
public class Room {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @NotNull
    @Size(max = 30)
    private String name;

    private boolean is_private;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "owner_id")
    @OnDelete(action = OnDeleteAction.NO_ACTION)
    private User owner;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(name = "room_user",
            joinColumns = @JoinColumn(name = "room_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"))
    private Set<User> user_list;

    public Room() {

    }

    public Room(String name, User owner, boolean is_private) {
        this.name = name;
        this.owner = owner;
        this.is_private = is_private;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public Set<User> getUser_list() {
        return user_list;
    }

    public void setUser_list(Set<User> user_list) {
        this.user_list = user_list;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean is_private() {
        return is_private;
    }

    public void setIs_private(boolean is_private) {
        this.is_private = is_private;
    }

    public void addUser(User user) {
        user_list.add(user);
    }

    public void deleteUser(User user) {
        user_list.remove(user);
    }

    public boolean isUserListEmpty() {
        return user_list.isEmpty();
    }
}
