package com.kharis.expense.tracker.service.impl;

import com.kharis.expense.tracker.entity.Transaction;
import com.kharis.expense.tracker.model.request.CreateTransactionRequest;
import com.kharis.expense.tracker.model.response.TransactionResponse;
import com.kharis.expense.tracker.repository.TransactionRepo;
import com.kharis.expense.tracker.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionRepo transactionRepo;

    @Override
    public TransactionResponse create(CreateTransactionRequest request) {
        Transaction newTransaction =  Transaction.builder()
                .amount(request.getAmount())
                .notes(request.getNotes())
                .build();
        newTransaction = transactionRepo.save(newTransaction);
        return TransactionResponse.builder()
                .transactionId(newTransaction.getTransactionId())
                .amount(newTransaction.getAmount())
                .notes(newTransaction.getNotes())
                .build();
    }
}
