package org.iclass.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
 
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class shelterDto {

    private Long careidx; // Assuming "careidx" is of type NUMBER in the database
    private String careTel;
    private String careAddr;
    private String careName;
	
}
