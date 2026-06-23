CREATE TABLE Location_Master (
    station_id INT PRIMARY KEY,

    state_code VARCHAR(20),
    state_name VARCHAR(100),

    district_code VARCHAR(20),
    district_name VARCHAR(100),

    station_name VARCHAR(255),

    basin VARCHAR(255),
    sub_basin VARCHAR(255),

    latitude_gd DECIMAL(10,6),
    longitude_gd DECIMAL(10,6),

    latitude_imd_rain DECIMAL(10,6),
    longitude_imd_rain DECIMAL(10,6),

    latitude_imd_temp DECIMAL(10,6),
    longitude_imd_temp DECIMAL(10,6),

    rain_lat_diff DECIMAL(10,6),
    rain_lon_diff DECIMAL(10,6),

    temp_lat_diff DECIMAL(10,6),
    temp_lon_diff DECIMAL(10,6),

    imd_matched VARCHAR(20)
);

CREATE TABLE Groundwater_Data (
    gw_record_id BIGINT PRIMARY KEY,

    station_id INT NOT NULL,

    original_id VARCHAR(100),

    record_date DATE,

    year INT,
    month INT,

    season VARCHAR(50),
    source VARCHAR(100),

    currentlevel DECIMAL(12,4),
    prev_level DECIMAL(12,4),

    level_diff DECIMAL(12,4),

    groundwater_status VARCHAR(100),

    CONSTRAINT fk_groundwater_station
        FOREIGN KEY (station_id)
        REFERENCES Location_Master(station_id)
);

CREATE TABLE Climate_Data (
    climate_record_id BIGINT PRIMARY KEY,

    station_id INT NOT NULL,

    year INT,
    month INT,

    rain_mm_monthly DECIMAL(12,4),

    rain_category VARCHAR(50),

    tmax_c_mean DECIMAL(8,2),
    tmin_c_mean DECIMAL(8,2),

    temp_range_c DECIMAL(8,2),

    CONSTRAINT fk_climate_station
        FOREIGN KEY (station_id)
        REFERENCES Location_Master(station_id)
);

select * from Location_Master;

select * from Groundwater_Data;

select * from Climate_Data;

select count(*) from Location_Master;

select count(*) from Groundwater_Data;

select count(*) from Climate_Data;