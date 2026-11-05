import sqlite3
from sqlite3 import Error


def openConnection(_dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Open database: ", _dbFile)

    conn = None
    try:
        conn = sqlite3.connect(_dbFile)
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")

    return conn

def closeConnection(_conn, _dbFile):
    print("++++++++++++++++++++++++++++++++++")
    print("Close database: ", _dbFile)

    try:
        _conn.close()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def createTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Create table")

    statement = """
        CREATE TABLE warehouse (
            w_warehousekey decimal(9,0) not null,
            w_name char(100) not null,
            w_capacity decimal(6,0) not null,
            w_suppkey decimal(9,0) not null,
            w_nationkey decimal(2,0) not null
        )"""

    try:
        _conn.execute(statement)
        _conn.commit()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def dropTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Drop tables")

    statement = "DROP TABLE IF EXISTS warehouse"

    try:
        _conn.execute(statement)
        _conn.commit()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def populateTable(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Populate table")

    # per (supplier, customer nation): lineitem count and total part size,
    # keep top 3 nations by count (ties alphabetical), capacity = 3 * max size
    statement = """
        INSERT INTO warehouse
        WITH per_nation AS (
            SELECT s_suppkey, s_name, n_nationkey, n_name,
                   COUNT(*) AS cnt, SUM(p_size) AS total_size
            FROM supplier
            JOIN lineitem ON l_suppkey = s_suppkey
            JOIN part ON p_partkey = l_partkey
            JOIN orders ON o_orderkey = l_orderkey
            JOIN customer ON c_custkey = o_custkey
            JOIN nation ON n_nationkey = c_nationkey
            GROUP BY s_suppkey, n_nationkey
        ),
        ranked AS (
            SELECT *,
                   ROW_NUMBER() OVER (PARTITION BY s_suppkey ORDER BY cnt DESC, n_name) AS rn,
                   3 * MAX(total_size) OVER (PARTITION BY s_suppkey) AS cap
            FROM per_nation
        )
        SELECT ROW_NUMBER() OVER (ORDER BY s_suppkey, rn),
               s_name || '___' || n_name, cap, s_suppkey, n_nationkey
        FROM ranked
        WHERE rn <= 3"""

    try:
        _conn.execute(statement)
        _conn.commit()
        print("success")
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q1(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q1")

    outputFile = None
    header = "{:>10} {:<40} {:>10} {:>10} {:>10}"
    query = "SELECT * FROM warehouse ORDER BY w_warehousekey"

    try:
        outputFile = open('output/1.out', 'w')
        outputFile.write((header.format("wId", "wName", "wCap", "sId", "nId")) + '\n')

        for warehouse in _conn.execute(query):
            outputFile.write(header.format(*warehouse) + '\n')

        outputFile.close()
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q2(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q2")

    outputFile = None
    header = "{:<40} {:>10} {:>10}"
    query = """
        SELECT n_name, COUNT(*) AS numw, SUM(w_capacity) AS totcap
        FROM warehouse JOIN nation ON n_nationkey = w_nationkey
        GROUP BY n_name
        ORDER BY numw DESC, totcap DESC, n_name"""

    try:
        outputFile = open('output/2.out', 'w')
        outputFile.write((header.format("nation", "numW", "totCap")) + '\n')

        for nationTotal in _conn.execute(query):
            outputFile.write(header.format(*nationTotal) + '\n')

        outputFile.close()
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q3(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q3")

    inputFile = None
    outputFile = None
    nation = ""
    header = "{:<20} {:<20} {:<40}"
    rowFormat = "{:<20} {:<20} {}"
    query = """
        SELECT s_name, sn.n_name, w_name
        FROM warehouse
        JOIN nation wn ON wn.n_nationkey = w_nationkey
        JOIN supplier ON s_suppkey = w_suppkey
        JOIN nation sn ON sn.n_nationkey = s_nationkey
        WHERE wn.n_name = ?
        ORDER BY s_name"""

    try:
        inputFile = open("input/3.in", "r")
        nation = inputFile.readline().strip()
        inputFile.close()

        outputFile = open('output/3.out', 'w')
        outputFile.write((header.format("supplier", "nation", "warehouse")) + '\n')

        for supplier in _conn.execute(query, (nation,)):
            outputFile.write(rowFormat.format(*supplier) + '\n')

        outputFile.close()
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q4(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q4")

    inputFile = None
    outputFile = None
    region = ""
    capacity = 0
    header = "{:<40} {:>10}"
    query = """
        SELECT w_name, w_capacity
        FROM warehouse
        JOIN nation ON n_nationkey = w_nationkey
        JOIN region ON r_regionkey = n_regionkey
        WHERE r_name = ? AND w_capacity > ?
        ORDER BY w_capacity DESC"""

    try:
        inputFile = open("input/4.in", "r")
        region = inputFile.readline().strip()
        capacity = int(inputFile.readline().strip())
        inputFile.close()

        outputFile = open('output/4.out', 'w')
        outputFile.write((header.format("warehouse", "capacity")) + '\n')

        for warehouse in _conn.execute(query, (region, capacity)):
            outputFile.write(header.format(*warehouse) + '\n')

        outputFile.close()
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def Q5(_conn):
    print("++++++++++++++++++++++++++++++++++")
    print("Q5")

    inputFile = None
    outputFile = None
    nation = ""
    header = "{:<20} {:>20}"
    # LEFT JOIN keeps regions with no matching warehouses -> 0
    query = """
        SELECT r_name, COALESCE(SUM(w.w_capacity), 0)
        FROM region
        LEFT JOIN (
            SELECT w_capacity, wn.n_regionkey
            FROM warehouse
            JOIN nation wn ON wn.n_nationkey = w_nationkey
            JOIN supplier ON s_suppkey = w_suppkey
            JOIN nation sn ON sn.n_nationkey = s_nationkey
            WHERE sn.n_name = ?
        ) w ON w.n_regionkey = r_regionkey
        GROUP BY r_name
        ORDER BY r_name"""

    try:
        inputFile = open("input/5.in", "r")
        nation = inputFile.readline().strip()
        inputFile.close()

        outputFile = open('output/5.out', 'w')
        outputFile.write((header.format("region", "capacity")) + '\n')

        for regionTotal in _conn.execute(query, (nation,)):
            outputFile.write(header.format(*regionTotal) + '\n')

        outputFile.close()
    except Error as e:
        print(e)

    print("++++++++++++++++++++++++++++++++++")


def main():
    database = r"tpch.sqlite"

    # create a database connection
    conn = openConnection(database)
    with conn:
        dropTable(conn)
        createTable(conn)
        populateTable(conn)

        Q1(conn)
        Q2(conn)
        Q3(conn)
        Q4(conn)
        Q5(conn)

    closeConnection(conn, database)


if __name__ == '__main__':
    main()
