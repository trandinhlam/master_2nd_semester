# I. Đặt vấn đề:

## Tên đề tài:

### Xây dựng hệ thống hỗ trợ tư vấn đầu tư chứng khoán, dựa trên dữ liệu chứng khoán Việt Nam

## Vai trò của  người sử dụng hệ thống:

### Bộ phận phân tích, tư vấn đầu tư của một quỹ đầu tư chứng khoán

## Nghiệp vụ:

+ Tính toán, Phân tích các chỉ số cơ bản của một cổ phiếu/ nhóm cổ phiếu
+ Phân tích xu hướng tăng giảm của một nhóm cổ phiếu ngành (Ngân hàng, xây dựng, bất động sản, tiêu dùng,bảo hiểm,
  CNTT,...)
+ Phân tích xu hướng tăng giảm của nhóm cổ phiếu gía cao (bluechip)
+ Phân tích xu hướng tăng giảm của nhóm cổ phiếu gía thấp (penny)
+ So sánh 2 cổ phiếu khác nhau theo một số tiêu chí như giá, EPS, P/E, tỉ lệ tăng giảm gần đây, tỉ lệ tăng giảm từ đầu
  năm

## Dữ liệu dự kiến thu thập được:

+ Dữ liệu lịch sử biến động giá của từng cổ phiếu trên 2 sàn HSX và HNX thống kê mỗi ngày từ năm 2003 (cophieu68.vn),
  định dạng file txt hoặc csv
+ Dữ liệu giá của từng cổ phiếu trên 2 sàng HSX và HNX theo từng ngày (cophieu68.vn), định dạng file txt hoặc csv
+ Dữ liệu mua/bán cổ phiếu của khối ngoại đối với từng cổ phiếu theo ngày (cafef.vn), định dạng table, chưa tìm được
  cách download
+ Dữ liệu giao hàng ngày của các cổ đông lớn/nội bộ của công ty (stockbiz.vn)
+ Thông tin tên công ty, loại ngành, thuộc sàn, Khối lượng đã niêm yết,... của từng mã cổ phiếu (finance.vietstock.vn)
+ ....

**Note:**

+ Các dữ liệu của các nhà cung cấp chủ yếu ở dạng format đầu vào cho các phần mềm phân tích chứng khoán chuyên dụng (
  Metastock,AmiBroker,...) nên khá chi tiết theo ngày
+ Dữ liệu có thể được export thành file excel được cung cấp sẵn, có thể sử dụng để làm đầu vào cho datasource hoặc là
  datasource theo dạng file
+ Dữ liệu có thể lấy được bằng API mà trang web đó đang sử dụng
+ Dữ liệu không được tổng hợp theo file, thì có thể được lưu thủ công bằng tay trong khoảng thời gian ngắn gần đây

____

## Lựa chọn 2 nghiệp vụ nhóm sẽ hiện thực hóa trong đồ án:

### 1 Nghiệp vụ trong phân tích cơ bản: So sánh tình trạng 1 cổ phiếu so với toàn ngành

### 1 Nghiệp vụ trong phân tích kỹ thuật: So sánh giá trị giữa 2 mã cổ phiếu tùy ý đã chọn