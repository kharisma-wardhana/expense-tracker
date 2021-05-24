package com.kharis.expense.tracker.controller;

import com.kharis.expense.tracker.model.ApiResponse;
import com.kharis.expense.tracker.model.request.CreateCategoryRequest;
import com.kharis.expense.tracker.model.response.CategoryResponse;
import com.kharis.expense.tracker.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @PostMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<CategoryResponse> create(@RequestBody CreateCategoryRequest request){
        CategoryResponse categoryResponse = categoryService.create(request);
        return ApiResponse.<CategoryResponse>builder()
                .code(HttpStatus.CREATED.value())
                .status(HttpStatus.CREATED.name())
                .message("Category successfully created")
                .data(categoryResponse)
                .build();
    }
}