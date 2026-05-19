package br.com.gabnest.nest_gab_api.repository;

import br.com.gabnest.nest_gab_api.model.StrategicGuideline;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface StrategicGuidelineRepository extends JpaRepository<StrategicGuideline, Long> {
    List<StrategicGuideline> findByActiveTrue();
}