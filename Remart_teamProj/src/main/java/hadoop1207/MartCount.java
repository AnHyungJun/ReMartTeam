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

public class MartCount {
	public static void main(String[] args) throws Exception {
	    Configuration conf = new Configuration();
	    // ����� ������ ��� Ȯ��  hdfs://211.238.142.247:9000/user/hadoop/dir5/
		  String inhadoop="hdfs://localhost:50071/user/HuyngJun/ch01/mart.csv";
	      String outhadoop 
	      = "hdfs://localhost:50071/user/HuyngJun/ch01/Mart1";
	   
	      Job job = new Job(conf, "MartCount");
	      // 입출력 데이터 경로 설정
	      FileInputFormat.addInputPath(job, new Path(inhadoop));
	      FileOutputFormat.setOutputPath(job, new Path(outhadoop));    // Job 클래스 설정
	      job.setJarByClass(MartCount.class);    // Mapper 클래스 설정
	      job.setMapperClass(MartCountMapper.class);    // Reducer 클래스 설정
	      job.setReducerClass(DelayCountReducer.class);    // 입출력 데이터 포맷 설정
	      job.setInputFormatClass(TextInputFormat.class);
	      job.setOutputFormatClass(TextOutputFormat.class);    // 출력키 및 출력값 유형 설정

	    job.setOutputKeyClass(Text.class);
	    job.setOutputValueClass(IntWritable.class);
	    job.waitForCompletion(true);
	}
}
