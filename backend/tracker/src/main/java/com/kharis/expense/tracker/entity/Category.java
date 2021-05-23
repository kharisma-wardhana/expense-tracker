package com.kharis.expense.tracker.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(
        name = "category",
        uniqueConstraints = {
                @UniqueConstraint(name="category_name_unique", columnNames = "category_name")
        }
)
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private Long categoryId;

    @OneToMany
    private User user;

    @Column(name = "category_name")
    private String categoryName;

    @Column(name = "category_desc", length = 500)
    private String categoryDesc;

    @Column(name = "created_at")
    private Date createdAt;

    @Column(name = "updated_at")
    private Date updatedAt;
}
