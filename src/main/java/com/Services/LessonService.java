package com.Services;

import com.Domain.Lesson;
import com.Exception.ResourceNotFoundException;
import com.Repos.LessonRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LessonService {

    private final LessonRepo lessonRepo;

    @Autowired
    public LessonService(LessonRepo lessonRepo) {
        this.lessonRepo = lessonRepo;
    }

    public Iterable<Lesson> findAll() {
        return lessonRepo.findAll();
    }

    public Page<Lesson> listAll(int pageNumber) {
        PageRequest pageRequest = PageRequest.of(pageNumber - 1,5);
        return lessonRepo.findAll(pageRequest);
    }

    public ResponseEntity<Map<String, Boolean>> deleteLessonById(Long id) {
        Lesson lesson = lessonRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("There is not any Lesson With such ID: " + id));
        lessonRepo.delete(lesson);
        Map<String, Boolean> deletedSuccessfully = new HashMap<>();
        deletedSuccessfully.put("deleted Successfully", Boolean.TRUE);
        return ResponseEntity.ok(deletedSuccessfully);
    }

    public ResponseEntity<Lesson> updateById(Long id, Lesson lessonDetails) {
        Lesson lesson = lessonRepo.findById(id).orElseThrow(() -> new ResourceNotFoundException("There is not any lesson With such ID: " + id));
        lesson.setTitle(lessonDetails.getTitle());
        lesson.setDescription(lessonDetails.getDescription());
        lesson.setFilename(lessonDetails.getFilename());

        Lesson updatedLesson = lessonRepo.save(lesson);

        return ResponseEntity.ok(updatedLesson);
    }

}
