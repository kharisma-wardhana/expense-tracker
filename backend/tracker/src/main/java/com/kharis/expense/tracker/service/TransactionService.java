package com.kharis.expense.tracker.service;

import com.kharis.expense.tracker.model.request.CreateTransactionRequest;
import com.kharis.expense.tracker.model.response.TransactionResponse;

public interface TransactionService {
    public TransactionResponse create(CreateTransactionRequest request);
}
