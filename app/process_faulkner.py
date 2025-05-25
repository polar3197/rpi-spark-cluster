from pyspark.sql import SparkSession
from pyspark.sql.functions import monotonically_increasing_id
import nltk
from nltk.tokenize import sent_tokenize

nltk.download('punkt_tab')


#nltk.download('punkt')

spark = SparkSession.builder \
    .appName("FaulknerSentenceSplitter") \
    .master("spark://coord:7077") \
    .getOrCreate()

with open("/data/faulkner/the-sound-and-the-fury.txt", "r") as f:
    text = f.read()

sentences = sent_tokenize(text)
df = spark.createDataFrame([(s,) for s in sentences], ["sentence"]) \
         .withColumn("id", monotonically_increasing_id())

df.write.mode("overwrite").parquet("/data/processed/safury_sentences.parquet")

print(f"Wrote {df.count()} sentences to /data/processed/")
spark.stop()
