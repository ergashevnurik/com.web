package com.Repos;

import com.Domain.Lesson;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface LessonRepo extends PagingAndSortingRepository<Lesson, Long> {

}
