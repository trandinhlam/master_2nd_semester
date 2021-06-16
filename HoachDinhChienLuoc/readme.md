# ĐỒ ÁN MÔN HỌC: HOẠCH ĐỊNH CHIẾN LƯỢC, PHÂN TÍCH VÀ TRIỂN KHAI HỆ THỐNG THÔNG TIN

### Nhóm thực hiện:

+ 20C12007: Trần Đình Lâm
+ 20C12030: Huỳnh Lâm Phú Sĩ

# Tên đề tài: "Hệ thống quản lý chăm sóc khách hàng thân thiết cho chuỗi cửa hàng điện thoại di động"

## Mô tả mục đích: Hệ thống đáp ứng nhu cầu tra cứu, cập nhật thông tin khách hàng thân thiết của một chuỗi cửa hàng kinh doanh điện thoại di động, nhằm mang đến kịp thời các ưu đãi, dịch vụ chăm sóc khách hàng,... thống nhất cho tất cả các chuỗi cửa hàng, hướng đến mục tiêu mở rộng kinh doanh

Cấu trúc của một đồ án nên bao gồm những nội dung sau:

## I. Tổng quan về dự án phát triển hệ thống

+ _Giới thiệu chung về dự án (mô tả bối cảnh, công ty/đơn vị, lãnh vực hoạt động, phạm vi, tổ chức đơn vị, …)_

+ Mục tiêu: liệt kê và diễn giải các mục tiêu của gự án (vd: theo chỉ đạo của …, nâng cao hiệu suất, mở rộng hoạt động
  sản xuất kinh doanh, …)
+ Giá trị: liệt kê các giá trị ước lương sẽ mang lại (ở mức tổng quát, vd: gia tăng bán hàng …%, giảm chi phí hoạt
  động…%, cải thiện sản xuất… Chi tiết sẽ được làm rõ ở phần phân tích khả thi kinh tế)
+ Ràng buộc hoặc rũi ro (vd: thời gian, nhân lực, người dùng, kinh phí, môi trường triển khai…)

____
@@@ __Nội dung:__

+ Lĩnh vực kinh doanh: thiết bị điện tử, điện thoại di động
+ Phòng ban thực hiện nghiệp vụ: bộ phận chăm sóc khách hàng
+ Phạm vi hệ thống: toàn khu vực miền Nam
+ Bối cảnh nghiệp vụ: Hiện tại đang quản lí thông tin khách hàng bằng thẻ vật lí, khách hàng đi đến các cửa hàng của
  chuỗi phải mang theo thẻ để được nhận ưu đãi, tích điểm, khuyến mãi và chính sách giao hàng. Điều này gây ra phiền
  toái cho khách hàng (khó tổng hợp thông tin)
+ Mục tiêu của dự án:
    - Ngắn hạn: Giải quyết các bất cập khi sử dụng thẻ vật lí, giảm thời gian chờ đợi, thủ tục
    - Dài hạn: Tạo tiền đề để mở rộng quy mô chuỗi, tăng doanh số khách hàng nhờ vào quản lí khách hàng đồng bộ.
+ Giá trị: Tiết kiệm chi phí làm thẻ, tiết kiệm thời gian cho khách hàng, không cần thực hiện quản lí thẻ, dễ dàng thu
  thập thông tin khách hàng, dễ dàng triển khai các chương trình khuyến mãi, marketing.
+ Ràng buộc về rủi ro:
    - Chi phí và con người (kinh phí hạn chế)
    - Cấp lãnh đạo không duyệt
    - Chính sách quyền riêng tư và thu thập dữ liệu của khách hàng
    - Vấn đề về trải nghiệm khách hàng.

___ 

## II. Phân tích

___ 

### 1. Phân tích hiện trạng

+ Tổng quan về nghiệp vụ và phạm vi (mô tả bằng văn bản tổng quan nghiệp vụ, dung sơ đồ use case nghiệp vụ để trình bày
  đi kèm giúp cho người đọc thấy được toàn cảnh, rồi giới hạn phạm vi nghiệp vụ mà dự án tập trung vào)
+ Phân tích qui trình nghiệp vụ (ứng với từng nghiệp vụ mà dự án tập trung tin học hóa, mô tả và phân tích):
    + Mô tả bằng văn bản, mô hình hóa qui trình (dùng activity diagram, business object diagram)
    + Nêu và phân tích các vấn đề tồn tại (vd: không đồng bộ, xử lý cầu kỳ, chi phí cao, thời gian dài, …)
    + Phân tích cải tiến (có thể liên hệ các phương pháp phân tích BPA, BPI, BPR để đưa ra giải pháp cho vấn đề nêu
      trên). Vẽ lại qui trình (activity diagram) nếu qui trình nghiệp vụ thay đổi. Hiện trạng CNT T: nêu tình trạng về
      mạng, phần cứng,
+ phần mềm và phân tích khả năng đáp ứng.

### 2. Đánh giá khả thi (các bạn tham khảo thêm tài liệu môn học, làm tối đa có thể)

+ Khả thi kinh tế (làm rõ chi phí – lợi ích, chú ý: lợi ích là làm rõ giá trị được liệt kê ở mục 1.3)
+ Khả thi kỹ thuật
+ Hoạt động
+ Luật và hợp đồng

___ 

### 3. Kế hoạch thực hiện

___ 

### 4. Mô hình hóa phân tích hệ thống

+ Mô tả yêu cầu hệ thống
    + Liệt kê và mô tả các yêu cầu chức năng hệ thống (ứng với từng nghiệp vụ hoặc từng loại người dùng)
    + Sơ đồ use case hệ thống (system use-case)
    + Liệt kê và mô tả yêu cầu phi chức năng

+ Sơ đồ cấu trúc (analysis class diagram)

___ 

## III. Thiết kế hệ thống (phần này không bắt buộc nhưng có thể làm nếu được)

+ Thiết chức năng
+ Thiết kế CSDL
+ Thiết kế giao diện
+ Thiết kế kiến trúc (mô hình cơ sở hạ tầng kiến trúc và các cấu hình phần cứng/thiết bị để cài đặt và triển khai hệ
  thống. Chú ý kiến trúc phải được thiết kế đáp ứng các nhu cầu phi chức năng liên quan)

## IV. Triển khai (mô hình và kế hoạch triển khai)

