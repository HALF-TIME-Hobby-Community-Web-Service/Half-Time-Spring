package com.hf.domain;

import org.springframework.stereotype.Component;

import lombok.Data;


@Data
@Component
public class Criteria {
    private Integer start;   
    private Integer perPage;

    public Criteria() {
        this.start = 1;
        this.perPage = 5; 
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.start = 1;
        } else {
            this.start = page;
        }
    }

    public void setPerPage(int perPage) {
        if (perPage <= 0 || perPage > 100) { 
            this.perPage = 5;
        } else {
            this.perPage = perPage;
        }
    }

    public int getStart() {
        return (start - 1) * perPage;
    }
}
