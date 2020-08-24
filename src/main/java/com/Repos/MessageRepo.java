package com.Repos;

import com.Domain.Message;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface MessageRepo extends PagingAndSortingRepository<Message, Long> {
    List<Message> findByTag(String tag);
}
