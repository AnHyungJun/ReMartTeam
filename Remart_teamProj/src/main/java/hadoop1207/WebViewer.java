
package hadoop1207;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FSDataInputStream;
import org.apache.hadoop.fs.FSDataOutputStream;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;

public class WebViewer {

   public Map<String, Long> toWordCount(String inhadoop) {
      try {
         BufferedReader br = readHDFS(inhadoop);
         Map<String, Long> map = br.lines()
               .flatMap(s -> {
                  String m[] = s.split(" ");
                  return Arrays.stream(m);
               })
               .filter(name -> !name.equals(""))
               .collect(Collectors.groupingBy(
                     String::toString,
                     Collectors.mapping(String::toString,Collectors.counting())));
         
         br.close();
         return map;
      }catch(Exception e) {
         e.printStackTrace();
      }
      return null;
   }
   
   public BufferedReader readHDFS(String inhadoop) throws IOException {
      String hdfsname = "hdfs://localhost:50071/user/sist48" + inhadoop;
      System.out.println(hdfsname);
      
      Configuration conf = new Configuration();
      conf.set("fs.defaultFS", hdfsname);
      FileSystem fs = FileSystem.get(conf);
      Path path = new Path(hdfsname);
      BufferedReader br = new BufferedReader(new InputStreamReader(fs.open(path)));
      return br;
   }
   
   public void writeHDFS(String line, String outhadoop) {
      String hdfsname = "hdfs://localhost:50071/user/sist48" + outhadoop;
      System.out.println(hdfsname);
      
      try {
         Configuration conf = new Configuration();
         conf.set("fs.defalutFS", hdfsname);
         FileSystem hdfs = FileSystem.get(conf);
         Path path = new Path(hdfsname);
         if(hdfs.exists(path)) {
            hdfs.delete(path, true);
         }
         
         FSDataOutputStream outStream = hdfs.create(path);
         outStream.writeUTF(line);
         outStream.close();
         
         FSDataInputStream inputStream = hdfs.open(path);
         String inputString = inputStream.readUTF();
         inputStream.close();
         System.out.println("Input Data : " + inputString);
      }catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   public List<String> toList(String inhadoop) {
      try {
         BufferedReader br = readHDFS(inhadoop);
         List<String> li = br.lines()
               .collect(Collectors.toList());
         System.out.println(li.size());
         br.close();
       
         return li;
      }catch(Exception e) {
         e.printStackTrace();
      }
      return null;
   }

}