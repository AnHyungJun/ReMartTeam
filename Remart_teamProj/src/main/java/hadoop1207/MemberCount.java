package hadoop1207;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.input.TextInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.mapreduce.lib.output.TextOutputFormat;

public class MemberCount {
	public static void main(String[] args) throws Exception {
	    Configuration conf = new Configuration();
	   
		  String inhadoop="hdfs://localhost:50071/user/sist48/ch01/member.csv";
	      String outhadoop 
	      = "hdfs://localhost:50071/user/sist48/ch01/Member";
	   
	      Job job = new Job(conf, "FoodCount");
	      
	      FileInputFormat.addInputPath(job, new Path(inhadoop));
	      FileOutputFormat.setOutputPath(job, new Path(outhadoop));    
	      job.setJarByClass(MemberCount.class);    // Mapper 
	      job.setMapperClass(MemberCountMapper.class);    // Reducer 
	      job.setReducerClass(DelayCountReducer.class);    //
	      job.setInputFormatClass(TextInputFormat.class);
	      job.setOutputFormatClass(TextOutputFormat.class);    // 

	    job.setOutputKeyClass(Text.class);
	    job.setOutputValueClass(IntWritable.class);
	    job.waitForCompletion(true);
	}
}
