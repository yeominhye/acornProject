package com.acorn.project.map;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Marker {
	private double latitude;
	private double longitude;
	private String markerInfo;
}
