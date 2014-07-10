#Factory Notes
**Factory for WGS84 Projection**

```
wgs84_proj4 = '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'
wgs84_wkt = <<WKT
  GEOGCS["WGS 84",
    DATUM["WGS_1984",
      SPHEROID["WGS 84",6378137,298.257223563,
        AUTHORITY["EPSG","7030"]],
      AUTHORITY["EPSG","6326"]],
    PRIMEM["Greenwich",0,
      AUTHORITY["EPSG","8901"]],
    UNIT["degree",0.01745329251994328,
      AUTHORITY["EPSG","9122"]],
    AUTHORITY["EPSG","4326"]]
WKT

wgs84_factory = RGeo::Geographic.spherical_factory(:srid => 4326,
  :proj4 => wgs84_proj4, :coord_sys => wgs84_wkt)
  
space_needle = wgs84_factory.point(-122.34978, 47.620578)
```
**Factory designed to handle the "NAD83 / Washington North" projection**

```
north_wa_proj4 = '+proj=lcc +lat_1=48.73333333333333 +lat_2=47.5 ' +
  '+lat_0=47 +lon_0=-120.8333333333333 +x_0=500000.0001016001 ' +
  '+y_0=0 +ellps=GRS80 +datum=NAD83 +to_meter=0.3048006096012192 ' +
  '+no_defs'
north_wa_wkt = <<WKT
  PROJCS["NAD83 / Washington North (ftUS)",
    GEOGCS["NAD83",
      DATUM["North_American_Datum_1983",
        SPHEROID["GRS 1980",6378137,298.257222101,
          AUTHORITY["EPSG","7019"]],
        AUTHORITY["EPSG","6269"]],
      PRIMEM["Greenwich",0,
        AUTHORITY["EPSG","8901"]],
      UNIT["degree",0.01745329251994328,
        AUTHORITY["EPSG","9122"]],
      AUTHORITY["EPSG","4269"]],
    UNIT["US survey foot",0.3048006096012192,
      AUTHORITY["EPSG","9003"]],
    PROJECTION["Lambert_Conformal_Conic_2SP"],
    PARAMETER["standard_parallel_1",48.73333333333333],
    PARAMETER["standard_parallel_2",47.5],
    PARAMETER["latitude_of_origin",47],
    PARAMETER["central_meridian",-120.8333333333333],
    PARAMETER["false_easting",1640416.667],
    PARAMETER["false_northing",0],
    AUTHORITY["EPSG","2285"],
    AXIS["X",EAST],
    AXIS["Y",NORTH]]
WKT
north_wa_factory = RGeo::Cartesian.factory(:srid => 2285,
  :proj4 => north_wa_proj4, :coord_sys => north_wa_wkt)
```