package com.acorn.project.map;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Maps {
    private String boardCode;
    private List<Day> days;
}
