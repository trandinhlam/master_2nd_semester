# Phần 2: Mô hình

## 2.1 Mô hình trừu tượng, concept

### information indexing

![img.png](img/img.png)

### information retrieval

## 2.2 Mô hình cài đặt vật lý bằng Java

### Các thành phần chính trong Indexing:

+ IndexWriter:
    + Là thành phần trung tâm của quá trình index, đảm nhiệm việc tạo index và đưa document vào index
+ Directory:
    + Thành phần abstract quản lý nơi lưu trữ các index file. Một số cài đặt cụ thể:
        + FSDirectory
        + RAMDirectory

+ Analyzer:
    + Trước khi text được index, sẽ được qua một bộ Analyzer. Bộ này trích xuất các token ra khỏi text, giữ lại các
      token và loại bỏ các phần khác.
    + Ví dụ điển hình của Analyzer là loại bỏ các "stop word".
+ Document:
    + Là tập hợp các fields, thể hiện cho một đoạn (chunk) của dữ liệu ta muốn tìm kiếm.
+ Field:
    + Keyword
    + UnIndexed
    + UnStored
    + Text

### Các thành phần chính trong Searching:

+ IndexSearcher:
    + Dùng để load và đọc index lên
+ Term:
    + Là đơn vị cơ bản nhỏ nhất của quá trình search
+ Query:
    + TermQuery
    + BooleanQuery
    + PhraseQuery
    + PrefixQuery
    + PhrasePrefixQuery
    + RangeQuery
    + FilteredQuery
    + SpanQuery
+ TermQuery
+ Hits:
    + Lưu chứa một đoạn kết quả trả về (đã được ranking)

### Sử dụng Term vector

+ Term Frequency Vector

### Segment:

+ Lucene sau khi nhận dữ liệu, index sẽ được generate vào cache, sau đó định đưa vào Segment, lúc này Segment có thể
  được sử dụng ngay. Điều này làm cho Lucene xử lý gần như real time.

### Index Type

+ stored: Loại index này lưu trữ toàn bộ input thành văn bản
+ tokenized: kết quả của mỗi từ được xem như một term (là key) gắn với các Document (inverted index)
+ termVector: Dành cho keyword highlighting và similarity matching
+ omitNorm: This saves memory, but at the expense of scoring quality (length normalization will be disabled), and if you
  omit norms, you cannot use index-time boosts.
+ indexOptions:
    + NONE: Nothing saved
    + DOCS: stores only DocId
    + DOCS_AND_FREQS: storing DocId AND FREQUENCY (Term Freq)
    + DOCS_AND_FREQS_AND_POSITIONS: storage doc_id, term frequency (Term Freq) and a position
    + DOCS_AND_FREQS_AND_POSITIONS_AND_OFFSETS: storage doc_id, term frequency (Term Freq), position and offset (offset)

+ docValuesType
+ dimension

## Similarity:

https://lucene.apache.org/core/3_0_3/api/core/org/apache/lucene/search/Similarity.html#formula_norm

+ Đây là class định nghĩa các thành phần tính điểm tương đồng trong Lucene:

### VSM Score:

+ Lucene kết hợp Boolean model và Vector Space Model: document chọn bởi BM sẽ được tính điểm bởi VSM
+ document và query được biểu diễn dưới dạng vector trọng số trong không gian nhiều chiều, mỗi term là một chiều, và
  trọng số là giá trị tf-idf
+ Gọi term t và document/query x, ta có Tf(t,x)xidf(t) là trọng số trên mỗi chiều của vector V(q) và V(d). Ta tính điểm
  giữa document d và query q bằng Cosine Similarity.
  ![img_1.png](img/img_1.png)

### Lucene's Conceptual Scoring Formula

![img_2.png](img/img_2.png)

### Lucene's Practical Scoring Function

_______

