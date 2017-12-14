package hadoop1207;

import org.apache.hadoop.io.Text;

public class FoodPerformanceParser {

	  private String food_name;
	  private int qty;

	  public FoodPerformanceParser(Text text) {
	    try {
	      String[] colums = text.toString().split("/");

	      
	      food_name = colums[0];

	 
	      qty = Integer.parseInt(colums[1]);
	   
	    
	    } catch (Exception e) {
	      System.out.println("Error parsing a record :" + e.getMessage());
	    }
	  }

	  public String getYear() { return food_name; }

	  public int getAll_price() { return qty; }

}
