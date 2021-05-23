package com.kharis.expense.tracker.repository;

import com.kharis.expense.tracker.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryRepo extends JpaRepository<Category, Long> {
}
