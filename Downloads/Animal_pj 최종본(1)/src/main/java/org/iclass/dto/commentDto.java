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
public class commentDto {
	private int commentidx;	//댓글 idx
	private int postidx;	//메인글 idx
	private String commentid;//사용자 id
	private String commentnick;	//댓글 작성자 닉네임
	private String commentContent;
	private Date commentDate;
	private int commentlike;
}
