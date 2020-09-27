#1. Database Setup (MySQL 8)

## Create new DB user and give permission
```
CREATE USER 'movieadmin'@'%' IDENTIFIED BY 'Movie@dm1n';
GRANT ALL ON movie.* TO 'movieadmin'@'%';
FLUSH PRIVILEGES;
```

## Run sql script
##### Run movie.sql (stored in database directory) to generate atabase, tables and data.




#2. API (.NET Core 3.1)
##### Install Visual Studio 2019 with .NET Core 3.1 support. Open the project sln file with Visual studio, stored inside 'movieapi' directory.
##### Run or compile the project.



# 3. movie (Vue UI)

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm run dev-serve
```

### Compiles and hot-reloads for production
```
npm run serve
```

### Compiles and minifies for development
```
npm run dev-build
```

### Compiles and minifies for production
```
npm run build
```

### Run your unit tests
```
npm run test:unit
```

### Lints and fixes files
```
npm run lint
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).






# Live Demo (Hosted)
### MySQL Instance
```
Server: 116.193.133.143
Username: movieadmin
Password: Movie@dm1n
Port: 3306
```

### .NET Core API Instance
```
https://116.193.133.143/api/Movie/GetAll
https://116.193.133.143/api/Movie/GetOne?id=8
https://116.193.133.143/api/Movie/Languages
https://116.193.133.143/api/Movie/Locations
```

### Vue UI Instance
```
http://116.193.133.143:5120/
```
