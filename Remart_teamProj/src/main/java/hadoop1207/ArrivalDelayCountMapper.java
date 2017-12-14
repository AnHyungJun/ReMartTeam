package hadoop1207;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

public class ArrivalDelayCountMapper extends
  Mapper<LongWritable, Text, Text, IntWritable> {

  // map 출력�?
  private final static IntWritable outputValue = new IntWritable(1);
  // map 출력?��
  private Text outputKey = new Text();

  public void map(LongWritable key, Text value, Context context)
    throws IOException, InterruptedException {

    AirlinePerformanceParser parser = new AirlinePerformanceParser(value);

    // 출력?�� ?��?��
    outputKey.set(parser.getYear() );
    context.write(outputKey, new IntWritable(parser.getAll_price()));
  }
}