package com.kharis.expense.tracker.repository;

import com.kharis.expense.tracker.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
}
