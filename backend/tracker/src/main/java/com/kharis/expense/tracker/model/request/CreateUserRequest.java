package com.kharis.expense.tracker.model.request;


import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

@Data
public class CreateUserRequest {
    @NotBlank
    private String username;

    @NotBlank
    private String email;

    @Max(value = 15)
    private String mobilePhone;

    @NotBlank
    @Min(value = 8)
    private String password;
}
