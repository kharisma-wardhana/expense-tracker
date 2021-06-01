package com.kharis.expense.tracker.model.request;


import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
public class CreateUserRequest {
    @NotBlank(message = "Username is required")
    private String username;

    @NotBlank(message = "Email is required")
    @Email
    private String email;

    @Length(max = 15)
    private String mobilePhone;

    @NotBlank(message = "Password is required")
    @Length(min = 8)
    private String password;
}
