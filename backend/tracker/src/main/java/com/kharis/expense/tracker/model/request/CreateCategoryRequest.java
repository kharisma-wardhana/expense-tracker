package com.kharis.expense.tracker.model.request;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotBlank;

@Data
public class CreateCategoryRequest {
    @NotBlank
    private String categoryName;

    @Max(value = 100)
    private String categoryDesc;
}