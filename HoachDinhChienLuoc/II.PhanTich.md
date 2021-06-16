# II. Phân tích

___ 

## 1. Phân tích hiện trạng

+ Tổng quan về nghiệp vụ và phạm vi (mô tả bằng văn bản tổng quan nghiệp vụ, dung sơ đồ use case nghiệp vụ để trình bày
  đi kèm giúp cho người đọc thấy được toàn cảnh, rồi giới hạn phạm vi nghiệp vụ mà dự án tập trung vào)
+ Phân tích qui trình nghiệp vụ (ứng với từng nghiệp vụ mà dự án tập trung tin học hóa, mô tả và phân tích):
    + Mô tả bằng văn bản, mô hình hóa qui trình (dùng activity diagram, business object diagram)
    + Nêu và phân tích các vấn đề tồn tại (vd: không đồng bộ, xử lý cầu kỳ, chi phí cao, thời gian dài, …)
    + Phân tích cải tiến (có thể liên hệ các phương pháp phân tích BPA, BPI, BPR để đưa ra giải pháp cho vấn đề nêu
      trên). Vẽ lại qui trình (activity diagram) nếu qui trình nghiệp vụ thay đổi. Hiện trạng CNT T: nêu tình trạng về
      mạng, phần cứng,
+ phần mềm và phân tích khả năng đáp ứng.

___
@@@ __Nội dung:__@@@

### Tổng quan nghiệp vụ và phạm vi

#### 1. Khảo sát thực tế trên địa bàn HCM

+ Hiện nay mảng kinh doanh bán lẻ các thiết bị điện thoại di động ngày càng nở rộ để đáp ứng nhu cầu của người dùng. Khi
  công việc kinh doanh này tăng trưởng, các cửa hàng vừa và nhỏ sẽ gặp phải những khó khăn nhất định trong quá trình duy
  trì bộ máy quản lý hiện tại, cũng như tính toán chiến lược mở rộng quy mô bán hàng. Hiện nay với sự cạnh tranh gắt gao
  từ các chuỗi bán lẻ lớn như Thegioididong, FPT, Viettel,... thì thị phần cho các cửa hàng vừa và nhỏ chỉ còn vài phần
  trăm. Vì thế yêu cầu cải tiến hệ thống để gia tăng chất lượng dịch vụ bán hàng là yêu cầu cấp thiết và sống còn đối
  với các chuỗi cửa hàng vừa và nhỏ.
+ Các chuỗi cửa hàng bán lẻ điện thoại di động trên địa bàn thành phố Hồ Chí Minh đa số đều có các nghiệp vụ cơ bản như
  sau:
    + Quản lý nhập xuất hàng (Nhập sản phẩm vào kho, xuất sản phẩm ra kho, kiểm tra chất lượng)
    + Quản lý thông tin nhân viên (nhân viên bán hàng, nhân viên giao hàng, đội ngũ kỹ thuật)
    + Quản lý khách hàng
    + Quản lý nhà cung cấp điện thoại
    + Quản lý doanh thu và công nợ (trả nợ, nhận bảo hành, trả bảo hành)
    + Kế toán

**Sơ đồ ngữ cảnh toàn bộ nghiệp vụ**

**Tham khảo**
![img.png](img/thamkhaosodongucanh.png)
**Vẽ lại sơ đồ DFD mức 0**
![img.png](img/SoDoNguCanh.png)

**Vẽ lại sơ đồ use case tổng quan của toàn hệ thống**

**Nhận xét**

+ Các nghiệp vụ hiện tại của doanh nghiệp chưa tập trung nhiều vào quản lý thông tin khách hàng, cũng như các quy trình
  xoay quanh quyền lợi, trải nghiệm của khách hàng. Vì vậy dự án này tập trung hướng đến cải tiến các quy trình phục vụ
  quyền lợi và trải nghiệm của đối tượng khách hàng.

#### 2. Giới hạn phạm vi nghiệp vụ mà dự án tập trung cải tiến

Phạm vi nghiệp vụ chủ yếu của dự án HTTT này là tập trung cải tiến quy trình quản lý tài khoản khách hàng, cụ thể là:

+ Quy trình mua hàng của khách hàng
+ Thông tin liên hệ của khách hàng
+ Lịch sử mua hàng của khách hàng
+ Lịch sử đổi trả, bảo hành sản phẩm của khách hàng
+ Quản lý các khuyến mãi, ưu đãi dành cho khách hàng dựa theo cấp độ

#### 3. Phân tích Qui trình nghiệp vụ

**Sơ đồ use case nghiệp vụ chăm sóc khách hàng**
![](./img/HoachdinhChienLuocSoDo-UsecaseNghiepVuKhachHang.png)

Các thừa tác viên tham gia vào quy trình nghiệp vụ này bao gồm:

+ Nhân viên bán hàng
+ Nhân viên chăm sóc khách hàng
+ Nhân viên kỹ thuật

  ![img.png](img/thuatacvien.png)

Các thực thể nghiệp vụ tham gia vào các nghiệp vụ này bao gồm:

+ Hồ sơ tài khoản khách hàng
+ Hóa đơn bán hàng
+ Sản phẩm
+ Phiếu đổi trả
+ Phiếu bảo hành
+ Phiếu ưu đãi/khuyến mãi

![img.png](img/thucthenghiepvu.png)

**Sơ đồ Business object Diagram cho các use case được chọn**

+ use case mua hàng:

![img.png](img/thuthe_usecase_muahang.png)

+ use case xem thông tin cá nhân:

![img.png](img/thuthe_usecase_xemtaikhoan.png)

+ use case nhận khuyến mãi:

![img.png](img/thuthe_usecase_nhankhuyenmai.png)

+ use case gửi yêu cầu hậu mãi:

![img.png](img/thucthe_usecase_haumau.png)

**Sơ đồ Activity Diagram cho các use case được chọn**


___ 

## 2. Đánh giá khả thi (các bạn tham khảo thêm tài liệu môn học, làm tối đa có thể)

+ Khả thi kinh tế (làm rõ chi phí – lợi ích, chú ý: lợi ích là làm rõ giá trị được liệt kê ở mục 1.3)
    1. Xác định chi phí - lợi nhuận:

    - Chi phí của dự án bao gồm:
        - Chí phí ban đầu:
            + Chi phí thuê nhóm phát triển (nhóm phát triển 4 người gồm 2 người backend, 2 người frontend, chi phí cho
              lương mỗi người khoảng 20 triệu đồng/tháng)
            + Chí phí đầu tư hệ thống (máy chủ server)
            + Chi phí đào tạo nhân viên sử dụng hệ thống
        - Chi phí định kì:
            + Chi phí duy trì và bảo trì hệ thống
    - Lợi ích (lợi nhuận mang lại):
        - Lợi nhuận hữu hình:
            + Giảm chi phí, thời gian in ấn, chờ đợi làm thẻ khách hàng khi đổi thẻ, mất thẻ, (mỗi thẻ 100.000 VND x
              số lượng khách hàng thân thiết - 10000 khách hàng thân thiết)
            + Giảm chi phí vận chuyển thẻ (mỗi lô thẻ gồm 100 thẻ có chi phí vận chuyển khoảng 20.000 VND)
            + Giảm chi phí thông tin (cập nhật thông tin khách hàng/thông báo thay đổi chính sách/bảo hành/đổi trả) khi sử dụng điện thoại (2.000.000 VND/tháng)
        - Lợi nhuận vô hình:
            + Giảm công sức bảo quản và kiểm tra thẻ
            + Minh bạch thông tin khách hàng (giảm rủi ro khách hàng khiếu nại về quyền lợi khi sử dụng thẻ)
            + Gia tăng tiện lợi cho khách hàng (không cần mang thẻ khi thanh toán, tự động áp dụng các thay đổi chính sách khách hàng)
            + Thực hiện tốt hơn chính sách hậu mãi, bảo hành cho khách hàng

    2. Tính toán dòng tiền và xác định lợi ích:
       Chi phí ban đầu :

    - Chí phí phát triển hệ thống thông tin: 4 x 10.000.000 = 40.000.000 VND
    - Chi phí mua sắm phần cứng (máy chủ, màn hình, thiết bị mạng,...): 21.000.000 VND
      + Máy chủ server: 15.000.000 VND
      + Thiết bị mạng: 7.000.000 VND
      + Các thiết bị ngoại vi hỗ trợ người sử dụng: 4.000.000 VND
  Chi phí định kì:
    - Chi phí cập nhật và bảo trì phần mềm (cập nhật phần mềm, môi trường, thay đổi chính sách, mở rộng hệ thống): 4.000.000 - 12 tháng
    - Chi phí bảo trì phần cứng (bảo trì hệ thống mạng, kiểm tra hệ thống định kì, vệ sinh hệ thống): 4.000.000 VND - 12 tháng
  Lợi nhuận mang lại:
    - Đối với mỗi khách hàng có thẻ: không cần tốn 100.000 VND cho mỗi thẻ khách hàng.
    - Lượng khách hàng hiện tại là khách hàng thân thiết: 1000 khách hàng
    - Ước lượng số lượng khách hàng thân thiết tăng mỗi tháng: 10 khách hàng đăng kí mỗi tháng
  Ước lượng lợi nhuận:
    Đơn vị: triệu VND

    |Năm|Năm 0|Năm 1|Năm 2| Năm 3|Năm 4|Năm 5|
    |---|-----|-----|-----|------|-----|-----|
    |Lợi nhuận| 0.0| 36| 36| 36| 36| 36|
    |Tỉ lệ giảm 7%| 0.0| 0.93| 0.87| 0.81| 0.76| 0.71|
    |PV lợi nhuận| 0.0| 33.64| 31.44| 29.39| 27.46| 25.67|
    |NPV lợi nhuận luỹ kế | 0.0| 33.64| 65.09| 94.48| 121.94| 194.01|
    |Chi phí ban đầu | 61| | | | | |
    |Chi phí định kì | 0.0| 8| 8| 8| 8| 8|
    |Tỉ lệ giảm 7%| 0.0| 0.91| 0.87| 0.81| 0.76| 0.71|
    |PV chi phí định kỳ| 0.0| 7.48| 6.99| 6.53| 5.7| 5.33|
    |NPV chí phí luỹ kế| 61| 68.47| 75.46| 81.99| 88.1| 93.8|


+ Khả thi kỹ thuật

  |STT| Rủi ro | Đánh giá | Mô tả đánh giá | Mô tả khắc phục |
  |---|--------|----------|----------------|-----------------|
  |1|Sự quen thuộc của người dùng đối với các hệ thống tương tự | Trung bình | Nhân viên đã sử dụng máy tính tốt nhưng chưa có kinh nghiệm vận hành các hệ thống lớn | Training sử dụng hệ thống |
  |2|Sự quen thuộc với tiến trình phát triển hệ thống | Thấp | Nhân viên đã sử dụng quen thuộc các hệ thống khác được sử dụng trong công ty | |
  |3|Thay đổi tổ chức, cơ cấu | Thấp | Không ảnh hưởng nhiều đến hệ thống hiện tại| |
  |4|Thiện chí của nhân viên khi tham gia vào hệ thống | Thấp | Hầu hết nhân viên đều mong muốn hệ thống mới hoạt động để giảm sai sót trong khâu chăm sóc khách hành thân thiết | |
  |5|Sự quen thuộc của nhóm phát triển đối với lĩnh vực đề xuất | Thấp | Nhóm đã phát triển và bảo trì một hệ thống tương tự trước đây | |
  |6|Kích thước hệ thống | Thấp | Hệ thống chỉ phá triển cho các của hàng tại khu vực miền Nam, thời gian phát triển và triển khai ít hơn 4 tháng với 4 thành viên tham gia phát triển | |
+ Hoạt động
    - Mức gắn kết đối với nhu cầu nghiệp vụ và chiến lược công ty: nghiệp vụ nhằm mang lại trải nghiệm mua sắm tốt hơn
      cho khách hàng, giảm chi chí phát sinh và rắc rối liên quan đến thẻ khách hàng vật lí.

    - Tác động với tổ chức:
        + Các nghiệp vụ cũ bị loại bỏ: cấp thẻ, làm thẻ cho khách hàng
        + Tự động hoá các nghiệp vụ: Quản lí khách hàng, thanh toán sử dụng các lợi ích cuả khách hàng thân thiết.
    - Khả thi về lịch thực hiện: Khung thời gian thực hiện trong thời gian cho phép (3 tháng) để nhanh chóng thay thế
      các nghiệp vụ hiện tại, cung cấp trải nghiệp mới cho khách hàng và đồng thời lấy được lợi thế kinh doanh so với
      đối thủ.
+ Luật và hợp đồng
    - Bản quyền: Phần mềm sử dụng các công cụ mã nguồn mở đế phát triển
    - Luật lao động và luật chống độc quyền: Không ảnh hưởng đến hệ thống
    - Luật an toàn và bảo mật thông tin: bảo vệ thông tin khách hàng (thông tin cá nhân, thông tin mua hàng)

___ 

## 3. Kế hoạch thực hiện

___ 

## 4. Mô hình hóa phân tích hệ thống

+ Mô tả yêu cầu hệ thống
  + Tác nhân hệ thống: Khách hàng, Nhân viên chăm sóc khách hàng, nhân viên kĩ thuật
  + Liệt kê và mô tả các yêu cầu chức năng hệ thống (ứng với từng nghiệp vụ hoặc từng loại người dùng)
    + Nhân viên chăm sóc khách hàng:
      + Cung cấp thông tin chính xác thông tin mua hàng, lịch sử khuyến mãi và thông tin khách hàng nhận khuyến mãi
      + Gửi thông tin đến khách hàng qua 1 hoặc nhiều kênh thông tin (email, notification thông qua ứng dụng)
      + Lưu trữ hoá đơn, chứng từ, thông tin sản phẩm mà khách hàng mua hoặc đổi trả
      + Tạo/xem hoá đơn bán hàng
    + Nhân viên kỹ thuật:
      + Hệ thống có khả năng cung cấp thông tin bảo hành, thông tin đổi trả (lịch sử bảo hành, thời hạn bảo hành,...)
      + Hệ thống có khả năng kiểm tra được sản phẩm / hàng hoá do công ty bán hoặc khách hàng đổi trả
      + Hỗ trợ thông báo với khách hàng về sản phẩm bảo hành/đổi trả/sửa chữa
      + Tạo phiếu đổi trả, phiếu bảo hành cho khách hàng
    + Khách hàng:
      + Theo dõi thông tin mua hàng, thông tin khuyến mãi,...
      + Yêu cầu đổi trả/bảo hành/sửa chữa
      + Xem các chương trình khuyến mãi/ưu đãi đang diễn ra hoặc đủ điều kiện tham gia hay áp dụng
      + Nhận thông báo về các ưu đãi/khuyến mãi thông qua các hình thức khách nhau (email, notification,...)
  + Sơ đồ use case hệ thống (system use-case)
  ![img.png](img\System_usecase.png)
  + Liệt kê và mô tả yêu cầu phi chức năng
    + Hệ thống luôn sẵn sàng ít nhất 20 giờ/ngày
    + Kiểm tra và thực hiện cập nhật khuyến mãi/ưu đãi của khách hàng nhanh nhất có thể (tránh chờ đợi lâu khi thực hiện thanh toán)
    + Đảm bảo thông tin khách hàng không bị lộ, mất khi thực hiện các tác vụ hệ thống
    + Tiện lợi, dễ sử dụng cho khách hàng cũng như nhân viên vận hành hệ thống

+ Sơ đồ cấu trúc (analysis class diagram)

  ![img.png](img\ClassDiagram.png)
___
