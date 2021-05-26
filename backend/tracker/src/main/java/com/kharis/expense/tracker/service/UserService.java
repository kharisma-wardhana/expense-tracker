package com.kharis.expense.tracker.service;

import com.kharis.expense.tracker.model.request.CreateUserRequest;
import com.kharis.expense.tracker.model.response.UserResponse;

import java.util.List;

public interface UserService {
    UserResponse create(CreateUserRequest request);

    List<UserResponse> getAllUser();
}
