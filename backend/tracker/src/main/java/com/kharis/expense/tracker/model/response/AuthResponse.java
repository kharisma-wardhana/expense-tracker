package com.kharis.expense.tracker.model.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.annotation.Version;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class AuthResponse {
    @Id
    private String id;

    private String apiKey;

    @Version
    private Long version;

    @CreatedDate
    private Long createdAt;

    @LastModifiedDate
    private Long updatedAt;
}
