package com.kharis.expense.tracker.model.request;

import lombok.Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

@Data
public class CreateTransactionRequest {
    @NotNull
    private double amount;

    @Max(value = 100)
    private String notes;
}