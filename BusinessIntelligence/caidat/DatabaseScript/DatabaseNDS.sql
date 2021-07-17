-- Database: StockDatabaseNDS

DROP DATABASE IF EXISTS "StockDatabaseNDS";

CREATE DATABASE "StockDatabaseNDS"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

\connect StockDatabaseNDS;
BEGIN;

-- Table: public.SanGiaoDich

DROP TABLE IF EXISTS public."SanGiaoDich" CASCADE;

CREATE TABLE public."SanGiaoDich"
(
    "id" serial NOT NULL,
    "MaSanGiaoDich" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TruSo" text COLLATE pg_catalog."default" NOT NULL,
    "DiaChi" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "SanGiaoDich_pkey" PRIMARY KEY ("id")
)


TABLESPACE pg_default;

ALTER TABLE public."SanGiaoDich"
    OWNER to postgres;


-- Table: public.NganhKinhDoanh

DROP TABLE IF EXISTS public."NganhKinhDoanh" CASCADE;

CREATE TABLE public."NganhKinhDoanh"
(
    "id" serial NOT NULL,
    "MaNganh" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TenNganh" text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "NganhKinhDoanh_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."NganhKinhDoanh"
    OWNER to postgres;

-- Table: public.LoaiChiSo

DROP TABLE IF EXISTS public."LoaiChiSo" CASCADE;

CREATE TABLE public."LoaiChiSo"
(
    "id" serial NOT NULL,
    "MaChiSo" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TenChiSo" text COLLATE pg_catalog."default" NOT NULL,
    "ChuThich" text COLLATE pg_catalog."default",
    CONSTRAINT "LoaiChiSo_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."LoaiChiSo"
    OWNER to postgres;

-- Table: public.LoaiLenh

DROP TABLE IF EXISTS public."LoaiLenh" CASCADE;

CREATE TABLE public."LoaiLenh"
(
    id serial NOT NULL,
    "MaLoai" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "TenLoai" text COLLATE pg_catalog."default",
    CONSTRAINT "LoaiLenh_pkey" PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public."LoaiLenh"
    OWNER to postgres;

-- Table: public.LichSuGia

DROP TABLE IF EXISTS public."LichSuGia" CASCADE;

CREATE TABLE public."LichSuGia"
(
    "id" serial NOT NULL,
    "MaCoPhieu" text NOT NULL,
    "NgayGiaoDich" date NOT NULL,
    "GiaMoCua" bigint NOT NULL,
    "GiaCaoNhat" bigint NOT NULL,
    "GiaThapNhat" bigint NOT NULL,
    "GiaDongCua" bigint NOT NULL,
    "KhoiLuongGiaoDich" bigint NOT NULL,
    CONSTRAINT "LichSuGia_pkey" PRIMARY KEY ("id", "NgayGiaoDich")
)

TABLESPACE pg_default;

ALTER TABLE public."LichSuGia"
    OWNER to postgres;

-- Table: public.GiaoDichKhoiNgoai

DROP TABLE IF EXISTS public."GiaoDichKhoiNgoai" CASCADE;

CREATE TABLE public."GiaoDichKhoiNgoai"
(
    "id" serial NOT NULL,
    "MaCoPhieu" text COLLATE pg_catalog."default" NOT NULL,
    "NgayGiaoDich" date NOT NULL,
    "LoaiLenh" text COLLATE pg_catalog."default" NOT NULL,
    "KhoiLuongGiaoDich" bigint NOT NULL,
    CONSTRAINT "GiaoDichKhoiNgoai_pkey" PRIMARY KEY ("id", "MaCoPhieu", "NgayGiaoDich", "LoaiLenh")
)

TABLESPACE pg_default;

ALTER TABLE public."GiaoDichKhoiNgoai"
    OWNER to postgres;


-- Table: public.ThongKeDatLenh

DROP TABLE IF EXISTS public."ThongKeDatLenh" CASCADE;

CREATE TABLE public."ThongKeDatLenh"
(
    "id" serial NOT NULL,
    "MaCoPhieu" text COLLATE pg_catalog."default" NOT NULL,
    "Ngay" date NOT NULL,
    "LoaiLenh" text COLLATE pg_catalog."default" NOT NULL,
    "SoLenhDataMua" bigint NOT NULL,
    "SoLenhDataBan" bigint NOT NULL,
    CONSTRAINT "ThongKeDatLenh_pkey" PRIMARY KEY ("id", "MaCoPhieu", "Ngay", "LoaiLenh")
)

TABLESPACE pg_default;

ALTER TABLE public."ThongKeDatLenh"
    OWNER to postgres;

-- Table: public.ChiSo

DROP TABLE IF EXISTS public."ChiSo" CASCADE;

CREATE TABLE public."ChiSo"
(
    "id" bigint NOT NULL,
    "MaLoai" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "MaCoPhieu" text COLLATE pg_catalog."default" NOT NULL,
    "Ngay" text COLLATE pg_catalog."default",
    "GiaTri" bigint NOT NULL,
    CONSTRAINT "ChiSo_pkey" PRIMARY KEY ("id", "MaLoai")
)

TABLESPACE pg_default;

ALTER TABLE public."ChiSo"
    OWNER to postgres;

-- Table: public.CoPhieu

DROP TABLE IF EXISTS public."CoPhieu" CASCADE;

CREATE TABLE public."CoPhieu"
(
    "id" bigint NOT NULL,
    "MaCoPhieu" text COLLATE pg_catalog."default" UNIQUE NOT NULL,
    "MaLoaiChiSo" text COLLATE pg_catalog."default" NOT NULL,
    "TenCongTy" text COLLATE pg_catalog."default" NOT NULL,
    "MaNganh" text COLLATE pg_catalog."default" NOT NULL,
    "MaSanGiaoDich" text COLLATE pg_catalog."default" NOT NULL,
    "TongLuongCoPhieu" bigint NOT NULL,
    CONSTRAINT "CoPhieu_pkey" PRIMARY KEY ("id")
)

TABLESPACE pg_default;

ALTER TABLE public."CoPhieu"
    OWNER to postgres;

ALTER TABLE public."CoPhieu"
    ADD CONSTRAINT "FK_San" FOREIGN KEY ("MaSanGiaoDich")
    REFERENCES public."SanGiaoDich" ("MaSanGiaoDich")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

ALTER TABLE public."CoPhieu"
    ADD CONSTRAINT "FK_Nganh" FOREIGN KEY ("MaNganh")
    REFERENCES public."NganhKinhDoanh" ("MaNganh")
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
COMMIT;