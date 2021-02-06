package com.Services;

import com.Domain.MySubjects;
import com.Repos.MySubjectsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class MySubjectsService {

    @Autowired
    private MySubjectsRepo mySubjectsRepo;

    public Page<MySubjects> listAll() {
        PageRequest pageRequest = PageRequest.of(0, 10);
        return mySubjectsRepo.findAll(pageRequest);
    }


}
