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
@AllArgsConstructor
@ToString
@NoArgsConstructor
@Builder
public class QuestionDto {
	
	String qsid;	// 문의 ID
	String qscategory;	//문의 카테고리
	String qstitle;	//문의 제목
	String userid;	//작성자 ID
	Date qsdate;	//문의 작성날짜
	String qsprocess;	//문의 처리상태
	Date asdate;	//답변 작성날짜
	String ascontent;	//답변 내용
	String qscontent;	//문의 내용
	String picture;		//첨부파일사진
}