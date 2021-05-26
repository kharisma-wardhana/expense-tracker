package com.kharis.expense.tracker.service.impl;

import com.kharis.expense.tracker.entity.Category;
import com.kharis.expense.tracker.model.request.CreateCategoryRequest;
import com.kharis.expense.tracker.model.response.CategoryResponse;
import com.kharis.expense.tracker.repository.CategoryRepo;
import com.kharis.expense.tracker.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
@AllArgsConstructor
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private final CategoryRepo categoryRepo;

    @Override
    public CategoryResponse create(CreateCategoryRequest request) {
        Category newCategory = Category.builder()
                .categoryName(request.getCategoryName())
                .categoryDesc(request.getCategoryDesc())
                .createdAt(new Date())
                .build();
        newCategory = categoryRepo.save(newCategory);
        return CategoryResponse.builder()
                .categoryId(newCategory.getCategoryId())
                .categoryName(newCategory.getCategoryName())
                .categoryDesc(newCategory.getCategoryDesc())
                .createdAt(newCategory.getCreatedAt())
                .build();
    }

    @Override
    public CategoryResponse getCategoryDetail(Long categoryId) {
        Optional<Category> category = categoryRepo.findById(categoryId);
        CategoryResponse categoryResponse = new CategoryResponse();
        if (category.isPresent()) {
            categoryResponse = CategoryResponse.builder()
                    .categoryId(category.get().getCategoryId())
                    .categoryName(category.get().getCategoryName())
                    .categoryDesc(category.get().getCategoryDesc())
                    .createdAt(category.get().getCreatedAt())
                    .build();
        }
        return categoryResponse;
    }

    @Override
    public List<CategoryResponse> getAllCategory() {
        List<Category> allCategory = categoryRepo.findAll();
        List<CategoryResponse> allCategoryResponses = new ArrayList<>();
        for (Category category : allCategory) {
            CategoryResponse categoryResponse = CategoryResponse.builder()
                    .categoryId(category.getCategoryId())
                    .categoryName(category.getCategoryName())
                    .categoryDesc(category.getCategoryDesc())
                    .createdAt(category.getCreatedAt())
                    .build();
            allCategoryResponses.add(categoryResponse);
        }
        return allCategoryResponses;
    }
}