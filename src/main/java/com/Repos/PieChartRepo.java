package com.Repos;

import com.Domain.PieChartData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PieChartRepo extends JpaRepository<PieChartData, Long> {
}
