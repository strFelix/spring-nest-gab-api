package br.com.gabnest.nest_gab_api.controller;

import br.com.gabnest.nest_gab_api.dto.auth.AuthRequest;
import br.com.gabnest.nest_gab_api.dto.auth.AuthResponse;
import br.com.gabnest.nest_gab_api.dto.auth.RegisterRequest;
import br.com.gabnest.nest_gab_api.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody @Valid AuthRequest request) {
        return ResponseEntity.ok(authService.login(request));
    }

    @PostMapping("/register")
    public ResponseEntity<AuthResponse> register(@RequestBody @Valid RegisterRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(authService.register(request));
    }
}