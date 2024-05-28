package com.acorn.project.route;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DayPlanDTO {
    private int day;
    private String comments;
    private double latitude; 
    private double longitude; 
}
