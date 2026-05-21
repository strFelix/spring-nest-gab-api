package br.com.gabnest.nest_gab_api.service;

import br.com.gabnest.nest_gab_api.dto.project.ProjectSummary;
import br.com.gabnest.nest_gab_api.model.enums.ProjectStatus;
import br.com.gabnest.nest_gab_api.repository.IdeaRepository;
import br.com.gabnest.nest_gab_api.repository.ProjectRepository;
import br.com.gabnest.nest_gab_api.model.enums.IdeaStatus;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Service
@RequiredArgsConstructor
public class DashboardService {

    private final ProjectRepository projectRepository;
    private final IdeaRepository ideaRepository;
    private final ProjectService projectService;

    public DashboardResponse getDashboard() {
        var projects = projectRepository.findAll();
        var completedProjects = projectRepository.findByStatus(ProjectStatus.COMPLETED);

        BigDecimal totalInvestment = projects.stream()
                .map(p -> p.getInvestment() != null ? p.getInvestment() : BigDecimal.ZERO)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        BigDecimal totalActualReturn = completedProjects.stream()
                .map(p -> p.getActualReturn() != null ? p.getActualReturn() : BigDecimal.ZERO)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        BigDecimal roi = BigDecimal.ZERO;
        if (totalInvestment.compareTo(BigDecimal.ZERO) > 0) {
            roi = totalActualReturn.subtract(totalInvestment)
                    .divide(totalInvestment, 4, RoundingMode.HALF_UP)
                    .multiply(BigDecimal.valueOf(100));
        }

        BigDecimal savings = totalActualReturn.subtract(totalInvestment);

        long ideasImplemented = ideaRepository.findByStatus(IdeaStatus.APPROVED).size();

        List<ProjectSummary> summaries = projects.stream()
                .map(p -> projectService.findById(p.getId()))
                .map(r -> ProjectSummary.builder()
                        .id(r.getId())
                        .title(r.getTitle())
                        .status(r.getStatus())
                        .stage(r.getStage())
                        .investment(r.getInvestment())
                        .expectedReturn(r.getExpectedReturn())
                        .actualReturn(r.getActualReturn())
                        .productivityGain(r.getProductivityGain())
                        .startDate(r.getStartDate())
                        .endDate(r.getEndDate())
                        .build())
                .toList();

        return DashboardResponse.builder()
                .totalRoi(roi)
                .totalSavings(savings.max(BigDecimal.ZERO))
                .completedProjects((long) completedProjects.size())
                .ideasImplemented(ideasImplemented)
                .projects(summaries)
                .build();
    }

    @Data
    @Builder
    public static class DashboardResponse {
        private BigDecimal totalRoi;
        private BigDecimal totalSavings;
        private Long completedProjects;
        private Long ideasImplemented;
        private List<ProjectSummary> projects;
    }
}