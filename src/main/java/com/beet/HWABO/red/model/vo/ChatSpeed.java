package com.beet.HWABO.red.model.vo;

public class ChatSpeed {
	private int speed;
	private String fk;
	
	
	
	public ChatSpeed(int speed, String fk) {
		super();
		this.speed = speed;
		this.fk = fk;
	}



	@Override
	public String toString() {
		return "ChatSpeed [speed=" + speed + ", fk=" + fk + "]";
	}



	public int getSpeed() {
		return speed;
	}



	public void setSpeed(int speed) {
		this.speed = speed;
	}



	public String getFk() {
		return fk;
	}



	public void setFk(String fk) {
		this.fk = fk;
	}



	public ChatSpeed() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
