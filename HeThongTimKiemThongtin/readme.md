# ĐỒ ÁN TÌM HIỂU THƯ VIỆN LUCENE

## thực hiện:

+ 20C12007 - Trần Đình Lâm
+ 20C12030 - Huỳnh Lâm Phú Sĩ

## References:

+ https://www.programmersought.com/article/36231500859/
+ https://www.programmersought.com/article/6597405831/
+ https://www.programmersought.com/article/54002035220
+ https://www.programmersought.com/article/49503678348/
+ https://github.com/Apress/practical-apache-lucene-8
+ Lucene in action
+ https://en.wikipedia.org/wiki/Apache_Lucene

_______
![img.png](img/home.png)

# Phần 1: Tổng quan

## Giới thiệu Lucene

+ Apache Lucene core là một thư viện mã nguồn mở Java cung cấp các tính năng lập chỉ mục và tìm kiếm mạnh mẽ.
+ Tác giả gốc: Doug Cutting (1999) - co-founder của Apache Hadoop.
+ Là sản phẩm công nghiệp, Lucene đã chứng minh được sự ổn định cũng như thành tích đổi mới qua các phiên bản
+ Được mở rộng ra nhiều ngôn ngữ như Pascal, Perl, C#, C++, Python, Rupy, PHP.

+ Các phiên bản của Lucene: https://lucene.apache.org/core/6_6_1/changes/Changes.html
    + Release 1.0: (04-10-2000)
    + Release 2.0.0 [2006-05-26]
    + Release 3.0.0 [2009-11-25]
    + Release 4.0.0 [2012-10-12]
    + Release 5.0.0 [2015-02-20]
    + Release 6.0.0 [2016-04-08]
    + Release 6.6.0 [2017-06-06]
    + Release 7.0.0 [2017-09-20]
    + 7.7.3 ( 2020-04-28)
    + 8.8.2 (12/04/2021)
+ Lucene là core của các dự án lớn nổi tiếng như:
    + Apache Solr
    + Elastic Search (2010)
    + Apache Nutch
    + MongoDB Atlas Search

____

## Chức năng
    - Định dạng index của Lucene cung cấp độc lập với ứng dụng. Nó định nghĩa tập hợp các tập tin chỉ mục dựa trên octet  mà cho phép các hệ thống hoặc ứng dụng chạy trên các nền tảng khác nhau chia sẻ các tập tin chỉ mục này.
    - Dựa trên inverted index của các công cụ full-text search truyền thống, các khối chỉ mục được cài đặt và thiết lập các file index nhỏ cho một file mới giúp cải thiện tốc độ đánh index. Sau đó kết hợp với chỉ mục gốc để tối ưu hoá chỉ mục.
    - Xây dựng dựa trên kiến trúc hướng đối tượng, giúp cho việc ứng dụng Lucene dễ dàng và hỗ trợ thuận lợi cho việc mở rộng và cài đặt các tính năng mới.
    - Bộ phân tích văn bản được cài đặt độc lập với ngôn ngữ cài đặt và định dạng tập tin. Phía lập chỉ mục tạo ra tập tin chỉ mục bằng cách chấp nhận một Token Stream. Ngươì sử dụng có thể sử dụng ngôn ngữ và định dạng file mới mà chỉ cần cài đặt interface cho bộ phân tích văn bản.
    - Công cụ query mạnh mẽ được cài đặt sẵn trong Lucene. Người dùng không cần phải tự cài đặt công cụ của riêng họ. Kể cả khi hệ thống có được khả năng query mạnh thì Lucene vẫn có khả năng query theo các Boolean operation, fuzzy search, group query,...

    Ngoài các chức năng chính về kĩ thuật như trên, Lucene còn có các đặc điểm khiến nó trở thành một công cụ full-text search mạnh mẽ như:
    - Nó là phần mềm mã nguồn mở theo giấp phép Apache, giúp nó không những là công cụ mà còn có thể nghiên cứu và pháp triển các kĩ thuật full-text search khách dựa trên nó.
    - Vì được xây dựng trên lí thuyết hướng đối tượng nên nó có khả năng mở rộng to lớn. Các lập trình viên có thể dễ dàng sử thay đổi các component trong Lucene để cung cấp khả năng xử lí trên HTML, XML cùng các định dạng PDF khác trên nhiều ngôn ngữ như Tiếng Trung, Tiếng Hàn, Tiếng Pháp,...

### Search và Index

![img.png](img/features.png)

## Đặc điểm

_______

# Phần 2: Mô hình

## Mô hình trừu tượng, concept

## Mô hình cài đặt vật lý bằng Java

_______

# Phần 3: Đối sánh

## Đối sánh với mô hình chuẩn

## Đối sánh với một mô hình tương đương

_______

# Phần 4: Demo Lucene

## Demo cơ bản

## Demo nâng cao

_______


