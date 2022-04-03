package com.beet.HWABO.member.model.vo;

import java.util.Map;

public class PrincipalDetails {
	private Member member;
	private Map<String, Object> attributes;
	
	public PrincipalDetails(Member member) {
		this.member = member;
	}
	
	public PrincipalDetails(Member member, Map<String, Object> attributes) {
		this.member =member;	
		this.attributes = attributes;
		
		
	}
}
