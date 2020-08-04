package com.Repos;

import com.Domain.EdsClasses;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClassesRepo extends CrudRepository<EdsClasses, Long> {
    List<EdsClasses> findByTitle(String title);
}
