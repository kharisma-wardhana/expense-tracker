package com.kharis.expense.tracker.service;

import com.kharis.expense.tracker.model.request.CreateTransactionRequest;
import com.kharis.expense.tracker.model.response.TransactionResponse;

import java.util.List;

public interface TransactionService {
    TransactionResponse create(CreateTransactionRequest request);

    List<TransactionResponse> getAllTransactionByUserId(Long userId);

    List<TransactionResponse> getAllTransactionByCategoryId(Long userId, Long categoryId);

    TransactionResponse getTransactionDetail(Long transactionId);
}
