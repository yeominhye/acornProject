package com.acorn.project.board;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class PagingHandler {

	int  currentPage;          //현재페이지
	 int  totRecords ;          // 총 레코드 수 	 
	 int  pageSize ;              //페이지 사이즈  (데이터 건수 , 한 페이지에 보이는 레코드 수 )	 	 
	 int  totalPage;             // 총 페이지수: 전체 페이수   
	  
	 int  grpSize=5 ;             // 한 그룹에 5개씩 보겟다
	 int  currentGrp ;  	      // 현재그룹
	 int  grpStartPage;           // 현재그룹의 시작번호
	 int  grpEndPage;             // 현재그룹의 마지막번호
	
	 
	 public PagingHandler() {
		// TODO Auto-generated constructor stub
	}
	 
	
}

