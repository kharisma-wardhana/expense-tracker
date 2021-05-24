package com.kharis.expense.tracker.model.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TransactionResponse {
    private Long transactionId;
    private String categoryName;
    private double amount;
    private String notes;
    private Date createdAt;
    private Date updateAt;
}