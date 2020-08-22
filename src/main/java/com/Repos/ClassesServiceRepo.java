package com.Repos;

import com.Domain.EdsClasses;

import java.util.Optional;

public interface ClassesServiceRepo {

    Optional<EdsClasses> getClassesById(Long id);

}
