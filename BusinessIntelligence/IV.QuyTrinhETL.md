# Quy trình ETL cho dữ liệu NDS:

## Rule thanh lọc data lịch sửa giá theo ngày

+ Loại bỏ các mã cổ phiếu không có giao dịch trong ngày (volume=0)
+ Loại bỏ các mã cổ phiếu không niêm yết trên các sàn CK Việt Nam (vd mã tiền ảo, mã OTC,...)
+ Giá cổ phiếu trong ngày phải có biên độ giao động trong mức cho phép:
    + Theo quy định thì biên độ dao động của sàn HOSE, HNX và UpCom lần lượt là 7%, 10% và 15%.
    + Giá trị biên độ phải phù hợp với quy định bước giá chia hết.
    + Giá tri biên độ làm tròn phải bé hơn giá trị biên độ lý thuyết khi nhân với % biên độ theo quy định của từng sàn.


