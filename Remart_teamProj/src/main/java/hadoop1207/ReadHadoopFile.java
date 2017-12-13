package hadoop1207;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileStatus;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class ReadHadoopFile {
	  public static void main(String[] args) {
		  
		  ReadHadoopFile rh = new ReadHadoopFile();
		  rh.toDisplay();
	}
	 
	  public  void toDisplay() {
		    try {
		String inhadoop="hdfs://localhost:50071/user/HuyngJun/ch01/dasdsa.txt";
		Configuration conf = new Configuration();
		conf.set("fs.defaultFS", inhadoop); 
		FileSystem fileSystem = FileSystem.get(conf);
		Path srcPath = new Path(inhadoop);
		String filename = inhadoop.substring(inhadoop.lastIndexOf('.') 
				+ 1, inhadoop.length());
		FileStatus fileStatus = fileSystem.getFileStatus(srcPath);
		 
		System.out.println("file type(Ȯ����)-->"+filename);
		System.out.println("file��-->"+fileStatus.getPath());
	   
	   BufferedReader br 
	   = new BufferedReader(new InputStreamReader(fileSystem.open(srcPath),"UTF-8"));
	    String line = br.readLine();
	      while(line != null) {
		            System.out.println(line);
		            line = br.readLine();
		            
		        }
		        br.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		}
	 
	}