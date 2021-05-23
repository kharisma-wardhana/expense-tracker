package com.kharis.expense.tracker.repository;

import com.kharis.expense.tracker.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TransactionRepo extends JpaRepository<Transaction, Long> {
}
