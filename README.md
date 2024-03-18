### **Automated MariaDB Docker Setup with Optional CRON-based SQL Backup**

### Building and running your application

When you're ready, start your application by running:
`docker compose up --build`.

This command will start all services defined in your `compose.yaml` file, including building images if necessary.

### Creating a backup of your application data

The `compose.yaml` file defines a service for backing up your application data. This service is named `db-backup`.

To create a backup, run the backup service:

`docker compose run --rm db-backup`

### Configuring MariaDB

The `compose.yaml` file defines a MariaDB service. The configuration for MariaDB is stored in the `./mysql-conf.d` directory on your host system, and the database files are stored in the `./lib` directory.

The MariaDB service uses the `./scripts/01-grant-permissions.sh` script to initialize the database. If you need to modify the database initialization process, you can do so by editing this script.

### Setting the timezone

The `compose.yaml` file sets the timezone for the MariaDB and `db-backup` services to 'Europe/Zurich'. If you need to use a different timezone, you can do so by changing the `TZ` environment variable in the `compose.yaml` file.

### Deploying your application to the cloud

First, build your images, e.g.: `docker compose build`.
