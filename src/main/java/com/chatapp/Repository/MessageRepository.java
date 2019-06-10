package com.chatapp.Repository;

import com.chatapp.Data.Message;
import org.springframework.data.repository.CrudRepository;

public interface MessageRepository extends CrudRepository<Message, Long> {

}
