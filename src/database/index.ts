import { createConnection } from 'typeorm'

createConnection({
  type: 'mysql',
  host: 'localhost',
  port: 3306,
  username: 'root',
  password: 'root',
  database: 'gta5',
  migrations: ['./src/database/migrations/*ts'],
  cli: {
    migrationsDir: './src/database/migrations',
  },
}).catch(error => {
  console.log(error)
})
