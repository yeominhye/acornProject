package com.acorn.project.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SearchCondition {
	String condition;
	String keyword;
	int board_type;
}
