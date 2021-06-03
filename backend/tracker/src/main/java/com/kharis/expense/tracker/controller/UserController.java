package com.kharis.expense.tracker.controller;

import com.kharis.expense.tracker.model.ApiResponse;
import com.kharis.expense.tracker.model.request.CreateUserRequest;
import com.kharis.expense.tracker.model.response.UserResponse;
import com.kharis.expense.tracker.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/v1/user")
@AllArgsConstructor
public class UserController {
    @Autowired
    private final UserService userService;

    @PostMapping(
            value = "/signup",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<UserResponse> create(
            @Valid @RequestBody CreateUserRequest request
    ) {
        UserResponse userResponse = userService.create(request);
        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.CREATED.value())
                .status(HttpStatus.CREATED.name())
                .message("User created successfully")
                .data(userResponse)
                .build();
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ApiResponse<List<UserResponse>> getAllUser() {
        List<UserResponse> allUser = userService.getAllUser();
        return ApiResponse.<List<UserResponse>>builder()
                .code(HttpStatus.OK.value())
                .status(HttpStatus.OK.name())
                .message("Successfully get all users")
                .data(allUser)
                .build();
    }

    @GetMapping(
            value = "/{userid}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<UserResponse> getUserDetails(@PathVariable("userid") Long userId) {
        UserResponse userResponse = userService.getUserDetails(userId);
        return ApiResponse.<UserResponse>builder()
                .code(HttpStatus.OK.value())
                .status(HttpStatus.OK.name())
                .message("Successfully get user details")
                .data(userResponse)
                .build();
    }
}
