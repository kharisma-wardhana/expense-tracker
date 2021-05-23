package com.kharis.expense.tracker.validation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.ConstraintViolationException;
import javax.validation.Validator;

@Component
public class ValidationUtil {
    @Autowired
    private Validator validator;

    public void validate(T) throws ConstraintViolationException {
        result = validator.validate(T);
        if(result.size != 0){
            throw new ConstraintViolationException(result);
        }
    }
}
