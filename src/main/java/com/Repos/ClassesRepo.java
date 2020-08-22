package com.Repos;

import com.Domain.EdsClasses;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

public interface ClassesRepo extends JpaRepository<EdsClasses, Long> {
    List<EdsClasses> findByTitle(String title);
}
