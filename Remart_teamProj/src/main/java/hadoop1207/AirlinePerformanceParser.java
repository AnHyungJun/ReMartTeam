package hadoop1207;

import org.apache.hadoop.io.Text;

public class AirlinePerformanceParser {

  private String year;
  private int all_price;

  public AirlinePerformanceParser(Text text) {
    try {
      String[] colums = text.toString().split(",");

      
      year = colums[0].substring(2,colums[0].length());

 
      all_price = Integer.parseInt(colums[1]);
   
    
    } catch (Exception e) {
      System.out.println("Error parsing a record :" + e.getMessage());
    }
  }

  public String getYear() { return year; }

  public int getAll_price() { return all_price; }


}
