package br.com.gabnest.nest_gab_api.service;

import br.com.gabnest.nest_gab_api.dto.idea.IdeaRequest;
import br.com.gabnest.nest_gab_api.dto.idea.IdeaResponse;
import br.com.gabnest.nest_gab_api.dto.idea.IdeaReviewRequest;
import br.com.gabnest.nest_gab_api.dto.user.UserSummary;
import br.com.gabnest.nest_gab_api.model.Idea;
import br.com.gabnest.nest_gab_api.model.User;
import br.com.gabnest.nest_gab_api.model.enums.IdeaStatus;
import br.com.gabnest.nest_gab_api.repository.IdeaRepository;
import br.com.gabnest.nest_gab_api.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class IdeaService {

    private final IdeaRepository ideaRepository;
    private final UserRepository userRepository;

    public IdeaResponse create(IdeaRequest request, Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));

        Idea idea = Idea.builder()
                .title(request.getTitle())
                .description(request.getDescription())
                .status(IdeaStatus.PENDING)
                .submittedBy(user)
                .build();

        return toResponse(ideaRepository.save(idea));
    }

    public List<IdeaResponse> findAll() {
        return ideaRepository.findAll()
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public List<IdeaResponse> findByStatus(IdeaStatus status) {
        return ideaRepository.findByStatus(status)
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public List<IdeaResponse> findMyIdeas(Long userId) {
        return ideaRepository.findBySubmittedById(userId)
                .stream()
                .map(this::toResponse)
                .toList();
    }

    public IdeaResponse findById(Long id) {
        return toResponse(findOrThrow(id));
    }

    public IdeaResponse review(Long id, IdeaReviewRequest request, Long reviewerId) {
        Idea idea = findOrThrow(id);

        User reviewer = userRepository.findById(reviewerId)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "User not found"));

        idea.setStatus(request.getStatus());
        idea.setPriority(request.getPriority());
        idea.setReviewedBy(reviewer);
        idea.setReviewedAt(LocalDateTime.now());

        return toResponse(ideaRepository.save(idea));
    }

    private Idea findOrThrow(Long id) {
        return ideaRepository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Idea not found"));
    }

    private UserSummary toUserSummary(User user) {
        if (user == null) return null;
        return UserSummary.builder()
                .id(user.getId())
                .name(user.getName())
                .role(user.getRole())
                .build();
    }

    private IdeaResponse toResponse(Idea idea) {
        return IdeaResponse.builder()
                .id(idea.getId())
                .title(idea.getTitle())
                .description(idea.getDescription())
                .status(idea.getStatus())
                .priority(idea.getPriority())
                .submittedBy(toUserSummary(idea.getSubmittedBy()))
                .reviewedBy(toUserSummary(idea.getReviewedBy()))
                .reviewedAt(idea.getReviewedAt())
                .createdAt(idea.getCreatedAt())
                .updatedAt(idea.getUpdatedAt())
                .build();
    }
}