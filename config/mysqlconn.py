import mysql.connector
from mysql.connector import Error, errors

def create_connection(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
            database=db_name
        )
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection

def create_connection_db_check(host_name, user_name, user_password, db_name):
    connection = None
    try:
        connection = mysql.connector.connect(
            host=host_name,
            user=user_name,
            passwd=user_password,
        )
        mycursor = connection.cursor()
        mycursor.execute("SHOW DATABASES LIKE '"+str(db_name)+"'")
    except Error as e:
        print(f"The error '{e}' occurred")
    return connection


def execute_read_query(connection, query):
    cursor = connection.cursor()
    result = None
    try:
        cursor.execute(query)
        result = cursor.fetchall()
        return result
    except errors as e:
        print(f"The error '{e}' occurred")
