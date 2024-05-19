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
public class ProductDto {
	private int pdtcode;		//상품코드
	private String pdtcate; 	//상품카테고리
	private int pdtprice;		//상품가격
	private Date pdtdate;		//등록날짜
	private String pdtcontent;	//상품설명
	private String pdtname;		//상품이름
	private String usernick;	//판매자닉네임
	private String userid;		//판매자ID
	private String pdttype;		//상품타입
	private String pdtpicture;	//상품사진
	
}