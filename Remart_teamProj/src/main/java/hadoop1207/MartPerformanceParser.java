package hadoop1207;

import org.apache.hadoop.io.Text;

public class MartPerformanceParser {
	  private String martmonth;
	  private int price;
	  public MartPerformanceParser(Text text) {
	    try {
	      String[] colums = text.toString().split(",");

	      
	      martmonth = colums[0]+"/"+colums[2];
	      price=Integer.parseInt(colums[1]);
	 
	    
	    } catch (Exception e) {
	      System.out.println("Error parsing a record :" + e.getMessage());
	    }
	  }

	  public String getMartmonth() { return martmonth; }
	  public int getPrice() { return price; }

}
