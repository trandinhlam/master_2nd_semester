package lamtd.com.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@AllArgsConstructor
@Getter
public enum Nganh {
    _100(100, "Sản xuất nông nghiệp"),
    _200(200, "Khai khoáng"),
    _300(300, "Tiện ích"),
    _400(400, "Xây dựng và Bất động sản"),
    _500(500, "Sản xuất"),
    _600(600, "Bán buôn"),
    _700(700, "Bán lẻ"),
    _800(800, "Vận tải và kho bãi"),
    _900(900, "Công nghệ và thông tin"),
    _1000(1000, "Tài chính và bảo hiểm"),
    _1100(1100, "Thuê và cho thuê"),
    _1200(1200, "Dịch vụ chuyên môn, khoa học và công nghệ"),
    _1300(1300, "Quản trị doanh nghiệp"),
    _1400(1400, "Dịch vụ hỗ trợ (hành chính, du lịch, an ninh, kiểm định…) và xử lý rác thải"),
    _1500(1500, "Dịch vụ giáo dục"),
    _1600(1600, "Chăm sóc sức khỏe và hoạt động trợ giúp xã hội"),
    _1700(1700, "Nghệ thuật, vui chơi và giải trí"),
    _1800(1800, "Dịch vụ lưu trú và ăn uống"),
    _1900(1900, "Dịch vụ khác (ngoại trừ hành chính công)"),
    _2000(2000, "Hành chính công");
    private int id;
    private String name;
}
