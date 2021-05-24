package com.kharis.expense.tracker.controller;

import com.kharis.expense.tracker.model.ApiResponse;
import com.kharis.expense.tracker.model.request.CreateTransactionRequest;
import com.kharis.expense.tracker.model.response.TransactionResponse;
import com.kharis.expense.tracker.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/transaction")
public class TransactionController {
    @Autowired
    private TransactionService transactionService;

    @PostMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<TransactionResponse> create (@RequestBody CreateTransactionRequest request){
        TransactionResponse transactionResponse = transactionService.create(request);
        return ApiResponse.<TransactionResponse>builder()
                .code(HttpStatus.CREATED.value())
                .status(HttpStatus.CREATED.name())
                .message("Transaction created successfully")
                .data(transactionResponse)
                .build();
    }
}