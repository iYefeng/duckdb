add_subdirectory(version)
add_subdirectory(sqlite)
add_library_unity(
  duckdb_func_table
  OBJECT
  arrow.cpp
  range.cpp
  repeat.cpp
  copy_csv.cpp
  read_csv.cpp
  sqlite_functions.cpp
  table_scan.cpp)

set(ALL_OBJECT_FILES
    ${ALL_OBJECT_FILES} $<TARGET_OBJECTS:duckdb_func_table>
    PARENT_SCOPE)
