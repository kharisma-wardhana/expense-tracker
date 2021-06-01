package com.kharis.expense.tracker.service.impl;

import com.kharis.expense.tracker.entity.Category;
import com.kharis.expense.tracker.entity.Transaction;
import com.kharis.expense.tracker.entity.User;
import com.kharis.expense.tracker.model.request.CreateTransactionRequest;
import com.kharis.expense.tracker.model.response.TransactionResponse;
import com.kharis.expense.tracker.repository.CategoryRepo;
import com.kharis.expense.tracker.repository.TransactionRepo;
import com.kharis.expense.tracker.repository.UserRepo;
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

    @Autowired
    private final UserRepo userRepo;

    @Autowired
    private final CategoryRepo categoryRepo;

    @Override
    public TransactionResponse create(CreateTransactionRequest request) {
        Optional<User> user = userRepo.findById(request.getUserId());
        Optional<Category> category = categoryRepo.findById(request.getCategoryId());
        Transaction newTransaction = Transaction.builder()
                .user(user.get())
                .category(category.get())
                .amount(request.getAmount())
                .notes(request.getNotes())
                .createdAt(new Date())
                .updateAt(new Date())
                .build();
        newTransaction = transactionRepo.save(newTransaction);
        return TransactionResponse.builder()
                .transactionId(newTransaction.getTransactionId())
                .categoryName(category.get().getCategoryName())
                .amount(newTransaction.getAmount())
                .notes(newTransaction.getNotes())
                .createdAt(newTransaction.getCreatedAt())
                .updateAt(newTransaction.getUpdateAt())
                .build();
    }

    @Override
    public TransactionResponse getTransactionDetail(Long transactionId) {
        Optional<Transaction> transaction = transactionRepo.findById(transactionId);
        TransactionResponse transactionResponse = new TransactionResponse();
        if (transaction.isPresent()) {
            transactionResponse = TransactionResponse.builder()
                    .transactionId(transaction.get().getTransactionId())
                    .categoryName(transaction.get().getCategory().getCategoryName())
                    .amount(transaction.get().getAmount())
                    .notes(transaction.get().getNotes())
                    .createdAt(transaction.get().getCreatedAt())
                    .updateAt(transaction.get().getUpdateAt())
                    .build();
        }
        return transactionResponse;
    }

    @Override
    public List<TransactionResponse> getAllTransactionByUserId(Long userId) {
        List<Transaction> allTransaction = transactionRepo.findByUserId(userId);
        List<TransactionResponse> allTransactionResponse = new ArrayList<>();
        for(Transaction transaction : allTransaction) {
            TransactionResponse transactionResponse = TransactionResponse.builder()
                    .transactionId(transaction.getTransactionId())
                    .categoryName(transaction.getCategory().getCategoryName())
                    .amount(transaction.getAmount())
                    .notes(transaction.getNotes())
                    .createdAt(transaction.getCreatedAt())
                    .updateAt(transaction.getUpdateAt())
                    .build();
            allTransactionResponse.add(transactionResponse);
        }
        return allTransactionResponse;
    }

    @Override
    public List<TransactionResponse> getAllTransactionByCategoryId(Long userId, Long categoryId) {
        List<Transaction> allTransaction = transactionRepo.findByUserIdAndCategoryId(userId, categoryId);
        List<TransactionResponse> allTransactionResponse = new ArrayList<>();
        for(Transaction transaction : allTransaction) {
            TransactionResponse transactionResponse = TransactionResponse.builder()
                    .transactionId(transaction.getTransactionId())
                    .categoryName(transaction.getCategory().getCategoryName())
                    .amount(transaction.getAmount())
                    .notes(transaction.getNotes())
                    .createdAt(transaction.getCreatedAt())
                    .updateAt(transaction.getUpdateAt())
                    .build();
            allTransactionResponse.add(transactionResponse);
        }
        return allTransactionResponse;
    }


}
