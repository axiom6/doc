import org.apache.spark.SparkContext
object WordCountSpark {
  def main(args: Array[String]) {
    val ctx = new SparkContext(...)
    val file = ctx.textFile(args(0))
    val counts = file.flatMap(
      line => line.split("\\W+"))
      .map(word => (word, 1))
      .reduceByKey(_ + _)
    counts.saveAsTextFile(args(1))
  }
}