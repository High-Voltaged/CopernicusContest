import MariaDB from "mariadb";

const pool = MariaDB.createPool({
    host: '127.0.0.1',
    port: 3308,
    user: 'default',
    password: 'compl_pass_190',
    database: 'copernicus',
    connectionLimit: 5,
    dateStrings: true,
});

export default pool;