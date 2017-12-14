package hadoop1207;

import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Mapper.Context;

public class MemberCountMapper extends
Mapper<LongWritable, Text, Text, IntWritable> {

// map 출력�?
private final static IntWritable outputValue = new IntWritable(1);
// map 출력?��
private Text outputKey = new Text();

public void map(LongWritable key, Text value, Context context)
	throws IOException, InterruptedException {

MemberPerformanceParser parser = new MemberPerformanceParser(value);

// 출력?�� ?��?��
outputKey.set(parser.getSex());
context.write(outputKey, outputValue);
}
}
