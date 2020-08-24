package com.Services;

import com.Domain.Message;
import com.Repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class MessageService {
    @Autowired
    private MessageRepo messageRepo;

    public Page<Message> listAll(int pageNumber) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1, 5);
        return messageRepo.findAll(pageRequest);
    }

}
