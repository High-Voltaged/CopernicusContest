import MariaDB from "mariadb";

const pool = MariaDB.createPool({
    host: '127.0.0.1',
    port: 3306,
    user: 'root',
    password: '',
    database: 'copernicus',
    connectionLimit: 5,
    dateStrings: true,
});

export default pool;