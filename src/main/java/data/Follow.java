package data;

import java.util.Date;
//
//public record Follow(String code, String owner, String target, Date Followed) {
//
//}

public class Follow {
	User targetUser;
	String code;
	String owner;
	String target;
	Date followed;
	

	public User getTargetUser() {
		return targetUser;
	}

	public void setTargetUser(User targetUser) {
		this.targetUser = targetUser;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public Date getFollowed() {
		return followed;
	}

	public void setFollowed(Date followed) {
		this.followed = followed;
	}
}
