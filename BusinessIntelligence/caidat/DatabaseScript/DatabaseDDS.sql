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

DROP TABLE IF EXISTS public."ThoiGian-GiaTriCoPhieu" CASCADE;

CREATE TABLE public."ThoiGian-GiaTriCoPhieu"
(
    "id" serial NOT NULL UNIQUE NOT NULL,
    "Ngay" bigint NOT NULL,
    "Thang" bigint NOT NULL,
    "Nam" bigint NOT NULL,
    CONSTRAINT "ThoiGian-GiaTriCoPhieu_pkey" PRIMARY KEY ("id")
);


ALTER TABLE public."ThoiGian-GiaTriCoPhieu"
    OWNER to postgres;

COMMENT ON TABLE public."ThoiGian-GiaTriCoPhieu"
    IS 'Bang Chieu Thoi Gian Cua Co Phieu';

-- Table: public.SanGiaoDich

DROP TABLE IF EXISTS public."SanGiaoDich" CASCADE;

CREATE TABLE public."SanGiaoDich"
(
    "id" serial NOT NULL,
    "MaSan" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TruSo" text COLLATE pg_catalog."default",
    "DiaChi" text COLLATE pg_catalog."default",
    CONSTRAINT "SanGiaoDich_pkey" PRIMARY KEY ("id")
);


ALTER TABLE public."SanGiaoDich"
    OWNER to postgres;

COMMENT ON TABLE public."SanGiaoDich"
    IS 'Bang Chieu San Giao Dich';

-- Table: public.CongTyPhatHanh

DROP TABLE IF EXISTS public."CongTyPhatHanh" CASCADE;

CREATE TABLE public."CongTyPhatHanh"
(
    "id" serial NOT NULL,
    "MaCongTy" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TenCongTy" text COLLATE pg_catalog."default",
    "VonDieuLe" bigint,
    CONSTRAINT "CongTyPhatHanh_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."CongTyPhatHanh"
    OWNER to postgres;

COMMENT ON TABLE public."CongTyPhatHanh"
    IS 'Bang Chieu Cong ty phat hanh co phieu';

    -- Table: public.CoPhieu

DROP TABLE IF EXISTS public."CoPhieu" CASCADE;

CREATE TABLE public."CoPhieu"
(
    "id" serial NOT NULL,
    "MaCoPhieu" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TenCoPhieu" text COLLATE pg_catalog."default",
    "PhanLoaiGiaTri" text COLLATE pg_catalog."default",
    "LinhVuc" text COLLATE pg_catalog."default",
    CONSTRAINT "CoPhieu_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."CoPhieu"
    OWNER to postgres;

COMMENT ON TABLE public."CoPhieu"
    IS 'Bang Chieu Co Phieu';

-- Table: public.RoomLinhVuc

DROP TABLE IF EXISTS public."RoomLinhVuc" CASCADE;

CREATE TABLE public."RoomLinhVuc"
(
    "id" serial NOT NULL,
    "MaLinhVuc" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TiLeSoHuuToiDa" double precision,
    CONSTRAINT "RoomLinhVuc_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."RoomLinhVuc"
    OWNER to postgres;

COMMENT ON TABLE public."RoomLinhVuc"
    IS 'Bang chieu cho room linh vuc cua nha dau tu khoi ngoai';

-- Table: public.PhapNhanGiaoDich

DROP TABLE IF EXISTS public."PhapNhanGiaoDich" CASCADE;

CREATE TABLE public."PhapNhanGiaoDich"
(
    "id" serial NOT NULL,
    "MaToChuc" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TenToChuc" text COLLATE pg_catalog."default" NOT NULL,
    "LoaiToChuc" text COLLATE pg_catalog."default" NOT NULL,
    "MaLinhVuc" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PhapNhanGiaoDich_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."PhapNhanGiaoDich"
    ADD CONSTRAINT "FK_MaLinhVuc" FOREIGN KEY ("MaLinhVuc")
    REFERENCES public."RoomLinhVuc" ("MaLinhVuc")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."PhapNhanGiaoDich"
    OWNER to postgres;

COMMENT ON TABLE public."PhapNhanGiaoDich"
    IS 'Bang Chieu cac tac nhan thuc hien giao dich';

-- Table: public.ThoiGian-BaoCaoTaiChinh

DROP TABLE IF EXISTS public."ThoiGian-BaoCaoTaiChinh" CASCADE;

CREATE TABLE public."ThoiGian-BaoCaoTaiChinh"
(
    "id" serial NOT NULL,
    "Quy" bigint NOT NULL,
    "Nam" bigint NOT NULL,
    CONSTRAINT "ThoiGian-BaoCaoTaiChinh_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."ThoiGian-BaoCaoTaiChinh"
    OWNER to postgres;

COMMENT ON TABLE public."ThoiGian-BaoCaoTaiChinh"
    IS 'Bang Chieu cua thoi gian bao cao tai chinh';

-- Table: public.ThoiGian-GiaoDichCoPhieuDacBiet

DROP TABLE IF EXISTS public."ThoiGian-GiaoDichCoPhieuDacBiet" CASCADE;

CREATE TABLE public."ThoiGian-GiaoDichCoPhieuDacBiet"
(
    "id" serial NOT NULL,
    "Ngay" bigint NOT NULL,
    "Thang" bigint NOT NULL,
    "Nam" bigint NOT NULL,
    "Quy" bigint NOT NULL,
    CONSTRAINT "ThoiGian-GiaoDichCoPhieuDacBiet_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."ThoiGian-GiaoDichCoPhieuDacBiet"
    OWNER to postgres;

COMMENT ON TABLE public."ThoiGian-GiaoDichCoPhieuDacBiet"
    IS 'Bang Chieu cua thoi gian giao dich co phieu dac biet';


-- Table: public.GiaTriCoPhieu

DROP TABLE IF EXISTS public."GiaTriCoPhieu" CASCADE;

CREATE TABLE public."GiaTriCoPhieu"
(
    "id" serial NOT NULL,
    "MaCoPhieu" text COLLATE pg_catalog."default" NOT NULL,
    "MaCongTyPhatHanh" text COLLATE pg_catalog."default" NOT NULL,
    "SanGiaoDich" text COLLATE pg_catalog."default" NOT NULL,
    "NgayGiaoDich" bigint NOT NULL,
    "GiaMoCua" bigint NOT NULL,
    "GiaDongCua" bigint NOT NULL,
    "SoLuongCoPhieu" bigint NOT NULL,
    "PB" double precision NOT NULL,
    "PE" double precision NOT NULL,
    "HeSoThanhKhoan" double precision NOT NULL,
    CONSTRAINT "GiaTriCoPhieu_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."GiaTriCoPhieu"
    ADD CONSTRAINT "FK_ThoiGian" FOREIGN KEY ("NgayGiaoDich")
    REFERENCES public."ThoiGian-GiaTriCoPhieu" ("id")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."GiaTriCoPhieu"
    ADD CONSTRAINT "FK_SanGiaoDich" FOREIGN KEY ("SanGiaoDich")
    REFERENCES public."SanGiaoDich" ("MaSan")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."GiaTriCoPhieu"
    ADD CONSTRAINT "FK_CongTyPhatHanh" FOREIGN KEY ("MaCongTyPhatHanh")
    REFERENCES public."CongTyPhatHanh" ("MaCongTy")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."GiaTriCoPhieu"
    ADD CONSTRAINT "FK_CoPhieu" FOREIGN KEY ("MaCoPhieu")
    REFERENCES public."CoPhieu" ("MaCoPhieu")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."GiaTriCoPhieu"
    OWNER to postgres;

COMMENT ON TABLE public."GiaTriCoPhieu"
    IS 'Bang Fact Gia tri co phieu';

-- Table: public.BaoCaoTaiChinhCongTy

DROP TABLE IF EXISTS public."BaoCaoTaiChinhCongTy" CASCADE;

CREATE TABLE public."BaoCaoTaiChinhCongTy"
(
    "id" serial NOT NULL,
    "MaBaoCao" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "ThoiDiemBaoCao" bigint NOT NULL,
    "CongTyPhatHanh" text COLLATE pg_catalog."default" NOT NULL,
    "ChiPhiHoatDong" bigint NOT NULL,
    "DoanhThu" bigint NOT NULL,
    "LoiNhuan" bigint NOT NULL,
    "VonHoa" bigint NOT NULL,
    "EPS" double precision NOT NULL,
    "ROE" double precision NOT NULL,
    "ROA" double precision NOT NULL,
    CONSTRAINT "BaoCaoTaiChinhCongTy_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."BaoCaoTaiChinhCongTy"
    ADD CONSTRAINT "FK_CongTyPhatHanh" FOREIGN KEY ("CongTyPhatHanh")
    REFERENCES public."CongTyPhatHanh" ("MaCongTy")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."BaoCaoTaiChinhCongTy"
    ADD CONSTRAINT "FK_ThoiGian" FOREIGN KEY ("ThoiDiemBaoCao")
    REFERENCES public."ThoiGian-BaoCaoTaiChinh" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."BaoCaoTaiChinhCongTy"
    OWNER to postgres;

COMMENT ON TABLE public."BaoCaoTaiChinhCongTy"
    IS 'Bang Fact Bao cao tai chinh cong ty';

-- Table: public.GiaoDichCoPhieuDacBiet

DROP TABLE IF EXISTS public."GiaoDichCoPhieuDacBiet" CASCADE;

CREATE TABLE public."GiaoDichCoPhieuDacBiet"
(
    id bigint NOT NULL,
    "MaCoPhieu" text COLLATE pg_catalog."default" NOT NULL,
    "ThoiGianGiaoDich" bigint NOT NULL,
    "SoLuong" bigint NOT NULL,
    "PhapNhanGiaoDich" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "GiaoDichCoPhieuDacBiet_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."GiaoDichCoPhieuDacBiet"
    ADD CONSTRAINT "FK_PhapNhanGiaoDich" FOREIGN KEY ("PhapNhanGiaoDich")
    REFERENCES public."PhapNhanGiaoDich" ("MaToChuc")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."GiaoDichCoPhieuDacBiet"
    ADD CONSTRAINT "FK_ThoiGianGiaoDich" FOREIGN KEY ("ThoiGianGiaoDich")
    REFERENCES public."ThoiGian-GiaoDichCoPhieuDacBiet" (id)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."GiaoDichCoPhieuDacBiet"
    ADD CONSTRAINT "FK_MaCoPhieu" FOREIGN KEY ("MaCoPhieu")
    REFERENCES public."CoPhieu" ("MaCoPhieu")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."GiaoDichCoPhieuDacBiet"
    OWNER to postgres;

COMMENT ON TABLE public."GiaoDichCoPhieuDacBiet"
    IS 'Bang Fact Giao dich co phieu dac biet';
COMMIT;