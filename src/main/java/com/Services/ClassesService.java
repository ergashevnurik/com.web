package com.Services;

import com.Domain.EdsClasses;
import com.Repos.ClassesRepo;
import com.Repos.ClassesServiceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.List;
import java.util.Optional;

@Service
public class ClassesService implements ClassesServiceRepo {

    @Autowired
    private ClassesRepo classesRepo;

    public Iterable<EdsClasses> findAll() {
        return classesRepo.findAll();
    }

    public Optional<EdsClasses> getClassesById(Long id) {
       return classesRepo.findById(id);
    }

    public Page<EdsClasses> listAll(int pageNumber, String sortField, String sortDirection) {
        Sort sort = Sort.by(sortField);
        sort = sortDirection.equals("asc") ? sort.ascending() : sort.descending();
        PageRequest pageable = PageRequest.of(pageNumber - 1, 5, sort);
        return classesRepo.findAll(pageable);
    }

    public EdsClasses get(Long id) {
        return classesRepo.findById(id).get();
    }


    public void updateTable(String title, String bookTitle, String description, Integer extendedDate,
                            Integer dueDate, String submissionMethod, String status, EdsClasses edsClasses) {

        if (!StringUtils.isEmpty(title) &&
            !StringUtils.isEmpty(bookTitle) &&
        !StringUtils.isEmpty(description) &&
        !StringUtils.isEmpty(extendedDate) &&
        !StringUtils.isEmpty(dueDate) &&
        !StringUtils.isEmpty(submissionMethod) &&
        !StringUtils.isEmpty(status)) {
            edsClasses.setTitle(title);
            edsClasses.setBookTitle(bookTitle);
            edsClasses.setDescription(description);
            edsClasses.setDueDate(dueDate);
            edsClasses.setExtendedDate(extendedDate);
            edsClasses.setSubmissionMethod(submissionMethod);
            edsClasses.setStatus(status);
        }

    }

}

