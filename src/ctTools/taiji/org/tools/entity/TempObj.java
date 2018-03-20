package taiji.org.tools.entity;


/**
 * @author Archmage
 */
public class TempObj {
	public Object target;
	public boolean  isSuccess = false;
	
	
	public void clear(){
		 isSuccess = false;
		 target = null;
	}
	
}
