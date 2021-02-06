package com.Repos;

import com.Domain.MySubjects;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface MySubjectsRepo extends PagingAndSortingRepository<MySubjects, Long> {

}
