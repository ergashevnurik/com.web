package com.Services;

import com.Domain.EdsClasses;
import com.Repos.ClassesRepo;
import com.Repos.ClassesServiceRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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

