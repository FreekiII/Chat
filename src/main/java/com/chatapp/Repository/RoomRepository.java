package com.chatapp.Repository;

import com.chatapp.Data.Room;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoomRepository extends JpaRepository<Room, Long> {
}

