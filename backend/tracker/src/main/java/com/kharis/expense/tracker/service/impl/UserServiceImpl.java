package com.kharis.expense.tracker.service.impl;

import com.kharis.expense.tracker.entity.User;
import com.kharis.expense.tracker.model.request.CreateUserRequest;
import com.kharis.expense.tracker.model.response.UserResponse;
import com.kharis.expense.tracker.repository.UserRepo;
import com.kharis.expense.tracker.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepo userRepo;

    @Override
    public UserResponse create(CreateUserRequest request) {
        User newUser = User.builder()
                .username(request.getUsername())
                .email(request.getEmail())
                .mobilePhone(request.getMobilePhone())
                .password(request.getPassword())
                .build();
        newUser = userRepo.save(newUser);
        return UserResponse.builder()
                .id(newUser.getUserId())
                .username(newUser.getUsername())
                .email(newUser.getEmail())
                .mobilePhone(newUser.getMobilePhone())
                .build();
    }
}
