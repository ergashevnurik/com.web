package com.Repos;

import com.Domain.AssignmentSubmission;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AssignmentSubmissionRepo extends JpaRepository<AssignmentSubmission, Long> {
}
