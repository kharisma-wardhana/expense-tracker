package com.kharis.expense.tracker.entity;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(
        name = "users",
        uniqueConstraints = {
                @UniqueConstraint(name="email_unique", columnNames = "email"),
                @UniqueConstraint(name="username_unique", columnNames = "username")
        }
)
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id", updatable = false)
    private Long userId;

    @Column(nullable = false)
    private String username;

    @Column(nullable = false)
    private String email;

    @Column(name = "phone", length = 15)
    private String mobilePhone;

    @Column(length = 100, nullable = false)
    private String password;

    @Column(name = "auth_token", length = 10)
    private String authToken;

    @Column(name = "login_count",length = 10)
    private Integer loginCount;

    @Column(length = 2)
    private Integer status;

    @Column(name = "last_login")
    private Date lastLogin;

    @Column(name = "created_at")
    private Date createdAt;

    @Column(name = "updated_at")
    private Date updatedAt;

}
