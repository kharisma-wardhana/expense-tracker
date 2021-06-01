package com.kharis.expense.tracker.model.request;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

@Data
public class CreateTransactionRequest {
    @NotNull(message = "User Id is required")
    @JsonProperty("user_id")
    private Long userId;

    @NotNull(message = "Category Id is required")
    @JsonProperty("category_id")
    private Long categoryId;

    @NotNull(message = "Amount is required")
    @Min(value = 1)
    private double amount;

    @Length(max = 100)
    private String notes;
}