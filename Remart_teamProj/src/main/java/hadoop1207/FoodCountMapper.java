package hadoop1207;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.Mapper.Context;

public class FoodCountMapper extends
		Mapper<LongWritable, Text, Text, IntWritable> {

	
	private final static IntWritable outputValue = new IntWritable(1);
	
	private Text outputKey = new Text();

	public void map(LongWritable key, Text value, Context context)
			throws IOException, InterruptedException {

		FoodPerformanceParser parser = new FoodPerformanceParser(value);

	
		outputKey.set(parser.getYear());
		context.write(outputKey, new IntWritable(parser.getAll_price()));
	}
}
