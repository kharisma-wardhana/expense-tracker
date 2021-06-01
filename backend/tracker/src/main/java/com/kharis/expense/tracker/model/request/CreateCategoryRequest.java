package com.kharis.expense.tracker.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;

@Data
public class CreateCategoryRequest {
    @NotBlank(message = "Category Name is required")
    @JsonProperty("category_name")
    private String categoryName;

    @Length(max = 100)
    @JsonProperty("category_desc")
    private String categoryDesc;
}