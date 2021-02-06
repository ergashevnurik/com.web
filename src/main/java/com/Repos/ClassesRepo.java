package com.Repos;

import com.Domain.EdsClasses;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import java.awt.print.Pageable;
import java.util.List;

public interface ClassesRepo extends PagingAndSortingRepository<EdsClasses, Long> {

    @Modifying
    @Query("delete from EdsClasses e where e.title = ?1")
    void deleteByTitle(String title);

}
