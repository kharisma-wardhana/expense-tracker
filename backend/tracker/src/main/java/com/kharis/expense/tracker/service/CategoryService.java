package com.kharis.expense.tracker.service;

import com.kharis.expense.tracker.model.request.CreateCategoryRequest;
import com.kharis.expense.tracker.model.request.CreateUserRequest;
import com.kharis.expense.tracker.model.response.CategoryResponse;

public interface CategoryService {
    public CategoryResponse create(CreateCategoryRequest request);
}