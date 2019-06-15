package com.chatapp.Repository;

import com.chatapp.Data.Message;
import com.chatapp.Data.Room;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findByRoom(Room room);
}
