package br.com.gabnest.nest_gab_api.repository;

import br.com.gabnest.nest_gab_api.model.User;
import br.com.gabnest.nest_gab_api.model.enums.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    List<User> findByRole(UserRole role);
    boolean existsByEmail(String email);
}