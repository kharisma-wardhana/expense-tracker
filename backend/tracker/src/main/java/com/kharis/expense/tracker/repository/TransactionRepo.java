package com.kharis.expense.tracker.repository;

import com.kharis.expense.tracker.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface TransactionRepo extends JpaRepository<Transaction, Long> {
    Optional<Transaction> findByUserId(Long userId);
}
