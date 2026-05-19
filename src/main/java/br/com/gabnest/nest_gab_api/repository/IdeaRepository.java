package br.com.gabnest.nest_gab_api.repository;

import br.com.gabnest.nest_gab_api.model.Idea;
import br.com.gabnest.nest_gab_api.model.enums.IdeaStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IdeaRepository extends JpaRepository<Idea, Long> {
    List<Idea> findByStatus(IdeaStatus status);
    List<Idea> findBySubmittedById(Long userId);
    List<Idea> findByStatusOrderByPriorityAsc(IdeaStatus status);
}