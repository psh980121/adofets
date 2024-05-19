package org.iclass.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class postDto {
	private int postidx;
	private String usernick;
	private String postcontent;
	private Date posttime;
	private int likecnt;
	private int viewcnt;
	private String postcate;
	private String postitle;
	private int commentcnt;
	private String postpic;
}
