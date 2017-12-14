package hadoop1207;

import org.apache.hadoop.io.Text;

public class MemberPerformanceParser {

	  private String sex;
	
	  public MemberPerformanceParser(Text text) {
	    try {
	      String[] colums = text.toString().split("/");

	      
	      sex = colums[0];

	 
	    
	    } catch (Exception e) {
	      System.out.println("Error parsing a record :" + e.getMessage());
	    }
	  }

	  public String getSex() { return sex; }

}
