package com.kharis.expense.tracker.service.impl;

import com.kharis.expense.tracker.entity.Transaction;
import com.kharis.expense.tracker.model.request.CreateTransactionRequest;
import com.kharis.expense.tracker.model.response.TransactionResponse;
import com.kharis.expense.tracker.repository.TransactionRepo;
import com.kharis.expense.tracker.service.TransactionService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private final TransactionRepo transactionRepo;

    @Override
    public TransactionResponse create(CreateTransactionRequest request) {
        Transaction newTransaction = Transaction.builder()
                .userId(request.getUserId())
                .categoryId(request.getCategoryId())
                .amount(request.getAmount())
                .notes(request.getNotes())
                .createdAt(new Date())
                .build();
        newTransaction = transactionRepo.save(newTransaction);
        return TransactionResponse.builder()
                .transactionId(newTransaction.getTransactionId())
                .amount(newTransaction.getAmount())
                .notes(newTransaction.getNotes())
                .createdAt(newTransaction.getCreatedAt())
                .build();
    }

    @Override
    public TransactionResponse getTransactionDetail(Long transactionId) {
        Optional<Transaction> transaction = transactionRepo.findById(transactionId);
        TransactionResponse transactionResponse = new TransactionResponse();
        if (transaction.isPresent()) {
            transactionResponse = TransactionResponse.builder()
                    .transactionId(transaction.get().getTransactionId())
                    .amount(transaction.get().getAmount())
                    .notes(transaction.get().getNotes())
                    .createdAt(transaction.get().getCreatedAt())
                    .build();
        }
        return transactionResponse;
    }

    @Override
    public List<TransactionResponse> getAllTransactionByUserId(Long userId) {
        Optional<Transaction> allTransaction = transactionRepo.findByUserId(userId);
        List<TransactionResponse> allTransactionResponse = new ArrayList<>();
        if (allTransaction.isPresent()) {
            TransactionResponse transactionResponse = TransactionResponse.builder()
                    .amount(allTransaction.get().getAmount())
                    .notes(allTransaction.get().getNotes())
                    .createdAt(allTransaction.get().getCreatedAt())
                    .build();
            allTransactionResponse.add(transactionResponse);
        }
        return allTransactionResponse;
    }
}
