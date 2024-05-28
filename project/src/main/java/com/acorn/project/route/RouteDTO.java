package com.acorn.project.route;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RouteDTO {

	private Long id;
    private String userCode;
    private String coverImage;
    private String title;
    private String date;
    private String region;
    private String category;
    private List<DayPlanDTO> dayPlans;
    private String overallComments;
    
}
