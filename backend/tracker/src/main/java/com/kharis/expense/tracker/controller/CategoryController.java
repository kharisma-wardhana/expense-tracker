package com.kharis.expense.tracker.controller;

import com.kharis.expense.tracker.model.ApiResponse;
import com.kharis.expense.tracker.model.request.CreateCategoryRequest;
import com.kharis.expense.tracker.model.response.CategoryResponse;
import com.kharis.expense.tracker.service.CategoryService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/v1/category")
@AllArgsConstructor
public class CategoryController {
    @Autowired
    private final CategoryService categoryService;

    @PostMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<CategoryResponse> create(
            @Valid @RequestBody CreateCategoryRequest request
    ) {
        CategoryResponse categoryResponse = categoryService.create(request);
        return ApiResponse.<CategoryResponse>builder()
                .code(HttpStatus.CREATED.value())
                .status(HttpStatus.CREATED.name())
                .message("Category successfully created")
                .data(categoryResponse)
                .build();
    }

    @GetMapping(
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<List<CategoryResponse>> getAllCategory() {
        List<CategoryResponse> allCategories = categoryService.getAllCategory();
        return ApiResponse.<List<CategoryResponse>>builder()
                .code(HttpStatus.OK.value())
                .status(HttpStatus.OK.name())
                .message("Successfully Get All Categories")
                .data(allCategories)
                .build();
    }

    @GetMapping(
            value = "/{categoryid}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<CategoryResponse> getCategoryDetail(
            @PathVariable("categoryid") Long categoryId
    ) {
        CategoryResponse categoryResponse = categoryService.getCategoryDetail(categoryId);
        return ApiResponse.<CategoryResponse>builder()
                .code(HttpStatus.OK.value())
                .status(HttpStatus.OK.name())
                .message("Successfully Get Category Details from Id " + categoryId)
                .data(categoryResponse)
                .build();
    }
}