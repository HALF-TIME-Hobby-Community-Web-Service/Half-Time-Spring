package com.hf.domain;

import java.math.BigDecimal;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@Component
@AllArgsConstructor
public class CommuConst {
	private BigDecimal capacity;
	private BigDecimal ageLimitMin;
	private BigDecimal ageLimitMax;
	private BigDecimal gender;
	
	private BigDecimal memberCnt;
}
