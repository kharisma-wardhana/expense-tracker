package com.kharis.expense.tracker.service;

import com.kharis.expense.tracker.model.request.CreateCategoryRequest;
import com.kharis.expense.tracker.model.response.CategoryResponse;

import java.util.List;

public interface CategoryService {
    CategoryResponse create(CreateCategoryRequest request);

    CategoryResponse getCategoryDetail(Long categoryId);

    List<CategoryResponse> getAllCategory();
}