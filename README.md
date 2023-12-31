# Readme

## Air BnBangy - Real Estate Marketplace


Air BnBangy is a full-stack web application that serves as a real estate marketplace, enabling users to buy and sell houses seamlessly. The project is built using Spring Boot in the backend and Angular in the frontend, providing a modern and efficient solution for real estate transactions.

# Technologies Used

## Frontend

- **Angular 16**: The frontend is developed using Angular, a powerful and widely-used web application framework;
- **Angular Material**: Angular Material components are employed for a consistent and visually appealing user interface.;
- **Prime NG**: Prime NG is used for additional UI components and features, enhancing the overall user experience;
- **TypeScript**: The application logic is written in TypeScript, providing a statically typed and scalable codebase;
- **Leaflet**: Leaflet is utilized for interactive maps, allowing users to explore property locations;
- **Imgbb API**: The Imgbb API is integrated for efficient image uploading and hosting;
- **Bootstrap**: Bootstrap is employed for responsive and mobile-friendly design elements.

## Backend

- **Java 21**: The backend is powered by Java 21, leveraging the latest features and improvements;
- **Spring Boot**: Spring Boot is used to simplify the development of the backend, providing a robust and scalable server;
- **Tomcat**: The application is deployed on the Tomcat server, ensuring reliable performance;
- **Thymeleaf and Servlet**: Thymeleaf and Servlet are used for server-side templating, enhancing dynamic content generation;
- **Postgres**: Postgres is employed as the relational database for storing and managing property data;
- **Lombok**: Lombok is used to reduce boilerplate code, promoting clean and concise development;
- **JPA**: Java Persistence API is utilized for seamless integration with the database.

## Features

- **Property Listings**: Users can browse and search for available properties with detailed information.
- **User Authentication**: User authentication ensures a personalized experience.
- **Image Upload**: Sellers can easily upload property images using the Imgbb API.
- **Interactive Maps**: Property locations are visualized using interactive maps powered by Leaflet.
- **Responsive Design**: The application is designed to work seamlessly across various devices and screen sizes.

# Getting Started

## Prerequisites

- [**JDK 21**](https://www.oracle.com/it/java/technologies/downloads/#jdk21-windows)
- **Node.js**
- **Angular CLI**
- **PostgreSQL**
- **Maven**

# Setup

## Backend:

Clone the repository:
```bash
git clone https://github.com/imbngy/air-BnBangy.git
```

### Database 

There are 2 methods to restore the database:

1. The first one is via DBeaver using the files in the folder `air-bnbangy/Back End/DB_DUMP/DBeaver/`;

2. The second one is by using the dump generated via pg_dump:

Create database airimmobiliare via Dbeaver or CLI:
```bash
psql -U postgres
```

It will ask for a password, log in, then prompt:
```bash
CREATE DATABASE airimmobiliare;
```

Check if the database exists with:
```bash
\l
```

And then exit psql using:
```bash
\q
```

Navigate to DB_DUMP:
```bash
cd air-BnBangy/Back\ End/DB_DUMP
```

Restore the database through the dump:
```bash
pg_restore -U postgres -c  -Ft -C -d airimmobiliare < postgres_localhost-2023_10_13_23_18_49-dump.sql
```

Configure the PostgreSQL database settings in the application.properties file;

Run the Spring Boot application;

> [!IMPORTANT]
> You will need [JDK 21.0.1](https://www.oracle.com/it/java/technologies/downloads/#jdk21-windows) to run the project, please install it and set it as default option for this project


## Frontend:
Navigate to the frontend directory;

Install dependencies:

```bash
cd Front\ End
npm install
```

Start the Angular development server using:

```bash
npm start
```

Open the application in your browser at http://localhost:4200.

# Contributing

Contributions are welcome! Feel free to open issues, submit pull requests, or provide feedback to help improve Air BnBangy.


Happy real estate shopping on Air BnBangy! 🏡
