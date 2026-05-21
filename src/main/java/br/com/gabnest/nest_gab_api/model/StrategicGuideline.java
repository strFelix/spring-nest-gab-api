package br.com.gabnest.nest_gab_api.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "TB_STRATEGIC_GUIDELINE")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StrategicGuideline {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_strategic_guideline")
    @SequenceGenerator(name = "seq_strategic_guideline", sequenceName = "SEQ_STRATEGIC_GUIDELINE", allocationSize = 1)
    private Long id;

    @Column(name = "TITLE", nullable = false, length = 150)
    private String title;

    @Column(name = "CONTENT", nullable = false, length = 4000)
    private String content;

    @Column(name = "ACTIVE", nullable = false)
    @org.hibernate.annotations.JdbcTypeCode(java.sql.Types.SMALLINT)
    @Builder.Default
    private Boolean active = true;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CREATED_BY", nullable = false)
    private User createdBy;

    @CreationTimestamp
    @Column(name = "CREATED_AT", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "UPDATED_AT", nullable = false)
    private LocalDateTime updatedAt;
}