# dockerize_laravel_using_ocally_images


# dockerize_laravel_using_ocally_images


Laravel Docker Setup (PHP 8.4 + MySQL + Redis + Node)

This project runs a Laravel application inside Docker using:

✅ PHP 8.4 (FPM)

✅ MySQL

✅ Redis

✅ phpMyAdmin

✅ Node

✅ Docker Compose

The goal is to provide a fully isolated development environment without installing PHP, MySQL, or Redis locally.

📦 Requirements

Docker

Docker Compose

Check installation:

docker -v
docker compose version

📁 Project Structure
project-root/
│
├── Dockerfile
├── docker-compose.yml
├── .env
├── app/
├── routes/
└── ...


⚠️ Dockerfile and docker-compose.yml must be in the root of the Laravel project.

🐳 Services Overview
1️⃣ App (Laravel - PHP 8.4)

Built from php:8.4-fpm

Runs php artisan serve

Installs required extensions:

pdo_mysql

redis

gd

zip

Accessible at:

http://localhost:8000

2️⃣ MySQL

Image: mysql

Port: 3306

Persistent storage using Docker volume

Default credentials:

Database: laravel_db
Username: laravel
Password: password
Root Password: root

3️⃣ phpMyAdmin

Port: 8080

Connects automatically to MySQL container

Access:

http://localhost:8080

4️⃣ Redis

Port: 6379

Used for:

Caching

Queues

Sessions

5️⃣ Node

Used for:

npm install

Vite

Frontend builds

⚙️ Environment Configuration

Inside .env:
<!-- 
APP_NAME=Laravel
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost:8000

DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=flash
DB_USERNAME=laravel
DB_PASSWORD=password

REDIS_HOST=redis
REDIS_PORT=6379 -->


⚠️ Important:

DB_HOST=db (not localhost)

REDIS_HOST=redis (not localhost)

Docker services communicate using service names.

🚀 Installation Steps
1️⃣ Clone the project
git clone <your-repository>
cd project-folder

2️⃣ Build and start containers
docker compose up -d --build

3️⃣ Install Laravel dependencies

Enter the app container:

docker exec -it laravel_app bash


Then run:

composer install
php artisan key:generate
php artisan migrate

4️⃣ Install frontend dependencies (optional)
docker exec -it node bash
npm install
npm run dev

🛑 Stop Containers
docker compose down

🗄 Reset Database (Optional)
docker compose down -v
docker compose up -d --build


⚠️ This removes all database data.

🔥 Important Notes

Make sure PHP version matches Laravel requirements.

Required PHP extensions must be installed (pdo_mysql, redis, gd, zip).

Use pull_policy: never if you want to prevent Docker from updating images.

Always use volumes for database persistence.

🎯 Why Use This Setup?

No local PHP installation

No XAMPP

No version conflicts

Same environment for all developers

Production-ready foundation

