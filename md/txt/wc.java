import org.apache.hadoop.io.*;
import org.apache.hadoop.mapred.*;
import java.util.StringTokenizer;
class WCMapper extends MapReduceBase
  implements Mapper<LongWritable, Text, Text, IntWritable> {
  static final IntWritable one = new IntWritable(1);
  static final Text word = new Text; // Value will be set in a non-thread-safe way!
  @Override
  public void map(LongWritable key, Text valueDocContents,
                    OutputCollector<Text, IntWritable> output, Reporter reporter) {
        String[] tokens = valueDocContents.toString.split("\\s+");
        for (String wordString: tokens) {
            if (wordString.length > 0) {
                word.set(wordString.toLowerCase);
                output.collect(word, one);
            }
        }
    }
}
class Reduce extends MapReduceBase
        implements Reducer[Text, IntWritable, Text, IntWritable] {
public void reduce(Text keyWord, java.util.Iterator<IntWritable> valuesCounts,
        OutputCollector<Text, IntWritable> output, Reporter reporter) {
        int totalCount = 0;
        while (valuesCounts.hasNext) {
          totalCount += valuesCounts.next.get;
        }
        output.collect(keyWord, new IntWritable(totalCount));
        }
        }