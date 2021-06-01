package com.kharis.expense.tracker.repository;

import com.kharis.expense.tracker.entity.Transaction;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import javax.websocket.server.PathParam;
import java.util.List;

public interface TransactionRepo extends JpaRepository<Transaction, Long> {
    @Query("SELECT t FROM Transaction t WHERE t.user.id = :userId")
    List<Transaction> findByUserId(@PathParam("userId") Long userId);

    @Query("SELECT t FROM Transaction t WHERE t.category.id = :categoryId AND t.user.id = :userId")
    List<Transaction> findByUserIdAndCategoryId(
            @PathParam("userId") Long userId,
            @PathParam("categoryId") Long categoryId
    );
}
