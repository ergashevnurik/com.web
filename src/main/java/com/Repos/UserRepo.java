package com.Repos;

import com.Domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UserRepo extends PagingAndSortingRepository<User, Long> {
    User findByUsername(String username);

    User findByActivationCode(String code);
}
