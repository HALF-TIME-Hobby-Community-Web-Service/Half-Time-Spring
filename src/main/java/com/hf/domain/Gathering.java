package com.hf.domain;

import java.math.BigDecimal;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@Component
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Gathering {
	private String title;
	private String text;
	private String commuID;
	private String organizer;
	private String startTime;
	private String endTime;
	private BigDecimal price;
	private String location;
	private BigDecimal capacity;
}
