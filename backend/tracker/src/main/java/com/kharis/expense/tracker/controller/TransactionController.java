package com.kharis.expense.tracker.controller;

import com.kharis.expense.tracker.exception.BadRequestException;
import com.kharis.expense.tracker.model.ApiResponse;
import com.kharis.expense.tracker.model.request.CreateTransactionRequest;
import com.kharis.expense.tracker.model.response.TransactionResponse;
import com.kharis.expense.tracker.service.TransactionService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/transaction")
@AllArgsConstructor
public class TransactionController {
    @Autowired
    private final TransactionService transactionService;

    @PostMapping(
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<TransactionResponse> create(
            @RequestBody CreateTransactionRequest request
    ) {
        try {
            TransactionResponse transactionResponse = transactionService.create(request);
            return ApiResponse.<TransactionResponse>builder()
                    .code(HttpStatus.CREATED.value())
                    .status(HttpStatus.CREATED.name())
                    .message("Transaction created successfully")
                    .data(transactionResponse)
                    .build();
        } catch (Exception ex) {
            return ApiResponse.<TransactionResponse>builder()
                    .code(HttpStatus.INTERNAL_SERVER_ERROR.value())
                    .status(HttpStatus.INTERNAL_SERVER_ERROR.name())
                    .message("Transaction failed to created " + ex.getMessage())
                    .build();
        }
    }

    @GetMapping(
            value = "/{transactionid}",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<TransactionResponse> getTransactionDetail(
            @PathVariable("transactionid") Long transactionId
    ) {
        TransactionResponse transactionResponse = transactionService.getTransactionDetail(transactionId);
        return ApiResponse.<TransactionResponse>builder()
                .code(HttpStatus.OK.value())
                .status(HttpStatus.OK.name())
                .message("Successfully Get Transaction Data")
                .data(transactionResponse)
                .build();
    }

    @GetMapping(
            value = "",
            produces = MediaType.APPLICATION_JSON_VALUE
    )
    public ApiResponse<List<TransactionResponse>> getAllTransactionUserId(
            @RequestParam(name = "userid") Long userId,
            @RequestParam(name = "page", defaultValue = "1") String page,
            @RequestParam(name = "size", defaultValue = "25") String size
    ) {
        try {
            List<TransactionResponse> allTransaction = transactionService.getAllTransactionByUserId(userId);
            return ApiResponse.<List<TransactionResponse>>builder()
                    .code(HttpStatus.OK.value())
                    .status(HttpStatus.OK.name())
                    .message("Successfully get all transaction data from user id " + userId)
                    .data(allTransaction)
                    .build();
        } catch (BadRequestException ex) {
            return ApiResponse.<List<TransactionResponse>>builder()
                    .code(HttpStatus.BAD_REQUEST.value())
                    .status(HttpStatus.BAD_REQUEST.name())
                    .message(ex.getMessage())
                    .build();
        } catch (Exception ex) {
            return ApiResponse.<List<TransactionResponse>>builder()
                    .code(HttpStatus.INTERNAL_SERVER_ERROR.value())
                    .status(HttpStatus.INTERNAL_SERVER_ERROR.name())
                    .message("Transaction failed to created " + ex.getMessage())
                    .build();
        }
    }
}