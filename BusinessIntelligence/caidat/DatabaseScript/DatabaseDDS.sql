-- Database: StockDatabase

DROP DATABASE IF EXISTS "StockDatabaseDDS";

CREATE DATABASE "StockDatabaseDDS"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

\connect StockDatabaseDDS;
BEGIN;
-- Table: public.ThoiGian-GiaTriCoPhieu

DROP TABLE IF EXISTS public."thoigian-giatricophieu" CASCADE;

CREATE TABLE public."thoigian-giatricophieu"
(
    "ma-ngay" bigint UNIQUE NOT NULL,
    "date" date NOT NULL UNIQUE NOT NULL,
    "ngay" bigint NOT NULL,
    "thang" bigint NOT NULL,
    "nam" bigint NOT NULL,
    "tuan" bigint NOT NULL,
    CONSTRAINT "ThoiGian-GiaTriCoPhieu_pkey" PRIMARY KEY ("ma-ngay")
);


ALTER TABLE public."thoigian-giatricophieu"
    OWNER to postgres;

COMMENT ON TABLE public."thoigian-giatricophieu"
    IS 'Bang Chieu Thoi Gian Cua Co Phieu';

-- Table: public.SanGiaoDich

DROP TABLE IF EXISTS public."sangiaodich" CASCADE;

CREATE TABLE public."sangiaodich"
(
    "id" serial NOT NULL,
    "ma-san" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "ten-san" text COLLATE pg_catalog."default",
    "ten-day-du" text COLLATE pg_catalog."default",
    "tru-so" text COLLATE pg_catalog."default",
    "dia-chi" text COLLATE pg_catalog."default",
    CONSTRAINT "SanGiaoDich_pkey" PRIMARY KEY ("id")
);


ALTER TABLE public."sangiaodich"
    OWNER to postgres;

COMMENT ON TABLE public."sangiaodich"
    IS 'Bang Chieu San Giao Dich';

-- Table: public.CongTyPhatHanh

DROP TABLE IF EXISTS public."congtyphathanh" CASCADE;

CREATE TABLE public."congtyphathanh"
(
    "ma-cong-ty" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "ten-cong-ty" text COLLATE pg_catalog."default",
    "von-dieu-le" bigint,
    "tong-co-phieu-phat-hanh" bigint,
    "ma-nganh" bigint,
    "ma-phan-nganh" bigint,
    CONSTRAINT "CongTyPhatHanh_pkey" PRIMARY KEY ("ma-cong-ty")
)

TABLESPACE pg_default;

ALTER TABLE public."congtyphathanh"
    OWNER to postgres;

COMMENT ON TABLE public."congtyphathanh"
    IS 'Bang Chieu Cong ty phat hanh co phieu';

    -- Table: public.CoPhieu

DROP TABLE IF EXISTS public."cophieu" CASCADE;

CREATE TABLE public."cophieu"
(
    "ma-co-phieu" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "ten-cong-ty" text COLLATE pg_catalog."default",
    "tong-co-phieu-luu-hanh" bigint,
    "phan-loai-gia-tri" text COLLATE pg_catalog."default",
    "linh-vuc" text COLLATE pg_catalog."default",
    "ma-san" text COLLATE pg_catalog."default",
    CONSTRAINT "CoPhieu_pkey" PRIMARY KEY ("ma-co-phieu")
)

TABLESPACE pg_default;

ALTER TABLE public."cophieu"
    OWNER to postgres;

COMMENT ON TABLE public."cophieu"
    IS 'Bang Chieu Co Phieu';

-- Table: public.nganhkinhdoanh

DROP TABLE IF EXISTS public."nganhkinhdoanh" CASCADE;

CREATE TABLE public."nganhkinhdoanh"
(
    "ma-nganh" bigint UNIQUE NOT NULL,
    "ma-nganh-source" bigint,
    "ten-nganh" text COLLATE pg_catalog."default",
    CONSTRAINT "nganhkinhdoanh_pkey" PRIMARY KEY ("ma-nganh")
)

TABLESPACE pg_default;

ALTER TABLE public."nganhkinhdoanh"
    OWNER to postgres;

COMMENT ON TABLE public."nganhkinhdoanh"
    IS 'Bang chieu cho room linh vuc cua nha dau tu khoi ngoai';

-- Table: public.phannganh

DROP TABLE IF EXISTS public."phannganh" CASCADE;

CREATE TABLE public."phannganh"
(
    "ma-nganh" bigint,
    "ma-phan-nganh" bigint,
    "ten-phan-nganh" text COLLATE pg_catalog."default",
    CONSTRAINT "phannganh_pkey" PRIMARY KEY ("ma-nganh", "ma-phan-nganh")
)

TABLESPACE pg_default;

-- ALTER TABLE public."phapnhangiaodich"
--     ADD CONSTRAINT "FK_MaLinhVuc" FOREIGN KEY ("ma-linh-vuc")
--     REFERENCES public."roomlinhvuc" ("ma-linh-vuc")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

ALTER TABLE public."phapnhangiaodich"
    OWNER to postgres;

COMMENT ON TABLE public."phapnhangiaodich"
    IS 'Bang Chieu cac tac nhan thuc hien giao dich';

-- Table: public.ThoiGian-BaoCaoTaiChinh

DROP TABLE IF EXISTS public."thoigian-baocaotaichinh" CASCADE;

CREATE TABLE public."thoigian-baocaotaichinh"
(
    "date" date NOT NULL,
    "quy" bigint NOT NULL,
    "nam" bigint NOT NULL,
    CONSTRAINT "ThoiGian-BaoCaoTaiChinh_pkey" PRIMARY KEY ("date")
)

TABLESPACE pg_default;

ALTER TABLE public."thoigian-baocaotaichinh"
    OWNER to postgres;

COMMENT ON TABLE public."thoigian-baocaotaichinh"
    IS 'Bang Chieu cua thoi gian bao cao tai chinh';

-- Table: public.ThoiGian-GiaoDichCoPhieuDacBiet

DROP TABLE IF EXISTS public."thoigian-giaodichcophieudacbiet" CASCADE;

CREATE TABLE public."thoigian-giaodichcophieudacbiet"
(
    "date" date NOT NULL,
    "ngay" bigint NOT NULL,
    "thang" bigint NOT NULL,
    "nam" bigint NOT NULL,
    "quy" bigint NOT NULL,
    CONSTRAINT "ThoiGian-GiaoDichCoPhieuDacBiet_pkey" PRIMARY KEY ("date")
)

TABLESPACE pg_default;

ALTER TABLE public."thoigian-giaodichcophieudacbiet"
    OWNER to postgres;

COMMENT ON TABLE public."thoigian-giaodichcophieudacbiet"
    IS 'Bang Chieu cua thoi gian giao dich co phieu dac biet';


-- Table: public.GiaTriCoPhieu

DROP TABLE IF EXISTS public."giatricophieu" CASCADE;

CREATE TABLE public."giatricophieu"
(
    "id" serial NOT NULL,
    "ma-co-phieu" text COLLATE pg_catalog."default",
    "ma-cong-ty-phat-hanh" text COLLATE pg_catalog."default",
    "san-giao-dich" text COLLATE pg_catalog."default",
    "ngay" date,
    "ma-ngay" bigint,
    "gia-mo-cua" double precision,
    "gia-dong-cua" double precision,
    "gia-cao-nhat" double precision,
    "gia-thap-nhat" double precision,
    "so-luong-co-phieu" bigint,
    "he-so-thanh-khoan" double precision,
    "volume" double precision,
    CONSTRAINT "GiaTriCoPhieu_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

-- Table: public.ChiSoTheoNgay

DROP TABLE IF EXISTS public."chisotheongay" CASCADE;

CREATE TABLE public."chisotheongay" 
(
    "id" serial NOT NULL,
    "ma-co-phieu" text COLLATE pg_catalog."default",
    "ma-loai" bigint,
    "ngay" date,
    "ma-ngay" bigint,
    "gia-tri" double precision,
    "ma-nganh" bigint,
    "ma-phan-nganh" bigint,
    CONSTRAINT "ChiSoTheoNgay_pkey" PRIMARY KEY ("ma-co-phieu","ma-loai","ma-ngay")
)

TABLESPACE pg_default;

-- Table: public.ChiSoQuanTrongTheoNgay

DROP TABLE IF EXISTS public."chisoquantrongtheongay" CASCADE;

CREATE TABLE public."chisoquantrongtheongay" 
(
    "id" serial NOT NULL,
    "ma-co-phieu" text COLLATE pg_catalog."default",
    "ngay" date,
    "ma-ngay" bigint,
    "eps" double precision,
    "pe" double precision,
    "von-hoa" double precision,
    CONSTRAINT "ChiSoQuanTrongTheoNgay_pkey" PRIMARY KEY ("ma-co-phieu","ma-ngay")
)

TABLESPACE pg_default;

-- Table: public.Thoigian-chiso

DROP TABLE IF EXISTS public."thoigian-chiso" CASCADE;

CREATE TABLE public."thoigian-chiso" 
(
    "ma-ngay" bigint UNIQUE NOT NULL,
    "date" date,
    "ngay" bigint,
    "thang" bigint,
    "nam" bigint,
    "tuan" bigint,
    CONSTRAINT "thoigian-chiso_pkey" PRIMARY KEY ("ma-ngay")
)

TABLESPACE pg_default;

-- Table: public.Loaichiso

DROP TABLE IF EXISTS public."loaichiso" CASCADE;

CREATE TABLE public."loaichiso" 
(
    "ma-chi-so" bigint UNIQUE NOT NULL,
    "ten-chi-so" text COLLATE pg_catalog."default",
    CONSTRAINT "loaichiso_pkey" PRIMARY KEY ("ma-chi-so")
)

TABLESPACE pg_default;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_ThoiGian" FOREIGN KEY ("ngay")
--     REFERENCES public."thoigian-giatricophieu" ("date")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_SanGiaoDich" FOREIGN KEY ("san-gia-dich")
--     REFERENCES public."sangiaodich" ("ma-san")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_CongTyPhatHanh" FOREIGN KEY ("ma-cong-ty-phat-hanh")
--     REFERENCES public."congtyphathanh" ("ma-cong-ty")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giatricophieu"
--     ADD CONSTRAINT "FK_CoPhieu" FOREIGN KEY ("ma-co-phieu")
--     REFERENCES public."cophieu" ("ma-co-phieu")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

ALTER TABLE public."giatricophieu"
    OWNER to postgres;

COMMENT ON TABLE public."giatricophieu"
    IS 'Bang Fact Gia tri co phieu';

-- Table: public.BaoCaoTaiChinhCongTy

DROP TABLE IF EXISTS public."baocaotaichinhcongty" CASCADE;

CREATE TABLE public."baocaotaichinhcongty"
(
    "id" serial NOT NULL,
    "ma-bao-cao" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "thoi-diem-bao-cao" date NOT NULL,
    "cong-ty-phat-hanh" text COLLATE pg_catalog."default" NOT NULL,
    "chi-phi-hoat-dong" bigint NOT NULL,
    "doanh-thu" bigint NOT NULL,
    "loi-nhuan" bigint NOT NULL,
    "von-hoa" bigint NOT NULL,
    "eps" double precision NOT NULL,
    "roe" double precision NOT NULL,
    "roa" double precision NOT NULL,
    CONSTRAINT "BaoCaoTaiChinhCongTy_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

-- ALTER TABLE public."baocaotaichinhcongty"
--     ADD CONSTRAINT "FK_CongTyPhatHanh" FOREIGN KEY ("cong-ty-phat-hanh")
--     REFERENCES public."congtyphathanh" ("ma-cong-ty")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."baocaotaichinhcongty"
--     ADD CONSTRAINT "FK_ThoiGian" FOREIGN KEY ("thoi-diem-bao-cao")
--     REFERENCES public."thoigian-baocaotaichinh" ("date")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

ALTER TABLE public."baocaotaichinhcongty"
    OWNER to postgres;

COMMENT ON TABLE public."baocaotaichinhcongty"
    IS 'Bang Fact Bao cao tai chinh cong ty';

-- Table: public.GiaoDichCoPhieuDacBiet

DROP TABLE IF EXISTS public."giaodichcophieudacbiet" CASCADE;

CREATE TABLE public."giaodichcophieudacbiet"
(
    "id" serial NOT NULL,
    "ma-co-phieu" text COLLATE pg_catalog."default" NOT NULL,
    "thoi-gian-giao-dich" date NOT NULL,
    "so-luong" bigint NOT NULL,
    "phap-nhan-giao-dich" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "GiaoDichCoPhieuDacBiet_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

-- ALTER TABLE public."giaodichcophieudacbiet"
--     ADD CONSTRAINT "FK_PhapNhanGiaoDich" FOREIGN KEY ("phap-nhan-giao-dich")
--     REFERENCES public."phapnhangiaodich" ("ma-to-chuc")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giaodichcophieudacbiet"
--     ADD CONSTRAINT "FK_ThoiGianGiaoDich" FOREIGN KEY ("thoi-gian-giao-dich")
--     REFERENCES public."thoigian-giaodichcophieudacbiet" ("date")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

-- ALTER TABLE public."giaodichcophieudacbiet"
--     ADD CONSTRAINT "FK_MaCoPhieu" FOREIGN KEY ("ma-co-phieu")
--     REFERENCES public."cophieu" ("ma-co-phieu")
--     ON UPDATE NO ACTION
--     ON DELETE NO ACTION
--     NOT VALID;

ALTER TABLE public."giaodichcophieudacbiet"
    OWNER to postgres;

COMMENT ON TABLE public."giaodichcophieudacbiet"
    IS 'Bang Fact Giao dich co phieu dac biet';
COMMIT;