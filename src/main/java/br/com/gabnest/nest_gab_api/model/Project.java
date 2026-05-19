package br.com.gabnest.nest_gab_api.model;

import br.com.gabnest.nest_gab_api.model.enums.ProjectStage;
import br.com.gabnest.nest_gab_api.model.enums.ProjectStatus;
import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "TB_PROJECT")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_project")
    @SequenceGenerator(name = "seq_project", sequenceName = "SEQ_PROJECT", allocationSize = 1)
    private Long id;

    @Column(name = "TITLE", nullable = false, length = 150)
    private String title;

    @Column(name = "DESCRIPTION", nullable = false, length = 4000)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(name = "STATUS", nullable = false, length = 20)
    private ProjectStatus status = ProjectStatus.PLANNING;

    @Enumerated(EnumType.STRING)
    @Column(name = "STAGE", nullable = false, length = 20)
    private ProjectStage stage = ProjectStage.IDEATION;

    @Column(name = "INVESTMENT", nullable = false, precision = 15, scale = 2)
    private BigDecimal investment;

    @Column(name = "EXPECTED_RETURN", nullable = false, precision = 15, scale = 2)
    private BigDecimal expectedReturn;

    @Column(name = "ACTUAL_RETURN", precision = 15, scale = 2)
    private BigDecimal actualReturn;

    @Column(name = "PRODUCTIVITY_GAIN", precision = 5, scale = 2)
    private BigDecimal productivityGain;

    @Column(name = "START_DATE", nullable = false)
    private LocalDate startDate;

    @Column(name = "END_DATE")
    private LocalDate endDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CREATED_BY", nullable = false)
    private User createdBy;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "IDEA_ID")
    private Idea idea;

    @CreationTimestamp
    @Column(name = "CREATED_AT", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "UPDATED_AT", nullable = false)
    private LocalDateTime updatedAt;
}