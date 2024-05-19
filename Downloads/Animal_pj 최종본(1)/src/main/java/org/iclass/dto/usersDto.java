package org.iclass.dto;

import java.sql.Date;

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

public class usersDto {
	private String userid;		//사용자 id
	private String usercate;	//사용자 유형
	private String userpass;	//사용자 비밀번호
	private String username;	//사용자 이름
	private String usernick;	//사용자 닉네임
	private int userage;		//사용자 나이
	private String usercity;	//사용자 도시
	private String useremail;	//사용자 이메일
	private String userphone;	//사용자 전화번호
	private Date userdate;		//가입날짜
}
