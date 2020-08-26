package com.Services;

import com.Domain.Lesson;
import com.Repos.LessonRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LessonService {

    @Autowired
    private LessonRepo lessonRepo;

    public Iterable<Lesson> findAll() {
        return lessonRepo.findAll();
    }

    public Page<Lesson> listAll(int pageNumber) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1,5);
        return lessonRepo.findAll(pageRequest);
    }

}
