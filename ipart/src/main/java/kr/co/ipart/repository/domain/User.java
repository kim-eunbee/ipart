package kr.co.ipart.repository.domain;

import lombok.Data;

@Data
public class User {
	private int userNo;
	private String userName;
	private String userEmail;
	private String password;
}