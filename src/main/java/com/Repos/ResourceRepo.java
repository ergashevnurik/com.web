package com.Repos;

import com.Domain.Resource;
import org.springframework.data.repository.CrudRepository;

public interface ResourceRepo extends CrudRepository<Resource, Long> {
}
