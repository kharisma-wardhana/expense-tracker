package com.kharis.expense.tracker.service.impl;

import com.kharis.expense.tracker.entity.User;
import com.kharis.expense.tracker.model.request.CreateUserRequest;
import com.kharis.expense.tracker.model.response.UserResponse;
import com.kharis.expense.tracker.repository.UserRepo;
import com.kharis.expense.tracker.service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    @Autowired
    private final UserRepo userRepo;

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

    @Override
    public List<UserResponse> getAllUser() {
        List<User> allUsers = userRepo.findAll();
        List<UserResponse> allUserResponse = new ArrayList<>();
        for (User user : allUsers) {
            UserResponse userResponse = UserResponse.builder()
                    .id(user.getUserId())
                    .username(user.getUsername())
                    .email(user.getEmail())
                    .mobilePhone(user.getMobilePhone())
                    .build();
            allUserResponse.add(userResponse);
        }

        return allUserResponse;
    }
}
