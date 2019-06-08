package com.chatapp.Repository;

import com.chatapp.Data.Message;
import org.springframework.data.repository.CrudRepository;

import java.util.UUID;

public interface MessageRepository extends CrudRepository<Message, UUID> {

}
