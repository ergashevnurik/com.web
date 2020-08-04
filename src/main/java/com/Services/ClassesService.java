package com.Services;

import com.Domain.EdsClasses;
import com.Repos.ClassesRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

@Service
public class ClassesService {

    @Autowired
    private ClassesRepo classesRepo;

    public Iterable<EdsClasses> findAll() {
        return classesRepo.findAll();
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

