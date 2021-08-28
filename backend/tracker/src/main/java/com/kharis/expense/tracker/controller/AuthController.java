package com.kharis.expense.tracker.controller;

import com.kharis.expense.tracker.model.ApiResponse;
import com.kharis.expense.tracker.model.request.AuthRequest;
import com.kharis.expense.tracker.model.response.AuthResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {
    @PostMapping(
            value = "/",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public final ApiResponse<AuthResponse> authenticateUser(AuthRequest request){
        AuthResponse response = AuthResponse.builder().build();
        return ApiResponse.<AuthResponse>builder()
                .code(HttpStatus.OK.value())
                .status(HttpStatus.OK.name())
                .message("Successfully authentication")
                .data(response)
                .build();
    }
}
