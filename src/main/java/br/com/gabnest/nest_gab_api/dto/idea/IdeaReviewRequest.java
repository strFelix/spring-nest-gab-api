package br.com.gabnest.nest_gab_api.dto.idea;

import br.com.gabnest.nest_gab_api.model.enums.IdeaStatus;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class IdeaReviewRequest {

    @NotNull(message = "Status is required")
    private IdeaStatus status;

    @Min(value = 1, message = "Priority must be at least 1")
    @Max(value = 100, message = "Priority must not exceed 100")
    private Integer priority;
}
