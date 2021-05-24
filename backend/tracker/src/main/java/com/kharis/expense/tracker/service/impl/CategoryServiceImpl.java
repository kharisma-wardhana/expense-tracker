package com.kharis.expense.tracker.service.impl;

import com.kharis.expense.tracker.model.request.CreateCategoryRequest;
import com.kharis.expense.tracker.model.response.CategoryResponse;
import com.kharis.expense.tracker.repository.CategoryRepo;
import com.kharis.expense.tracker.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepo categoryRepo;

    @Override
    public CategoryResponse create(CreateCategoryRequest request) {
        return null;
    }
}