package com.kharis.expense.tracker.service;

import com.kharis.expense.tracker.model.request.CreateUserRequest;
import com.kharis.expense.tracker.model.response.UserResponse;

public interface UserService {
    public UserResponse create(CreateUserRequest request);
}
