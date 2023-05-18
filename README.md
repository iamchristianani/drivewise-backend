<a name="readme-top"></a>

<div align="center">

  <h3><b>DriveWise Backend</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 [DriveWise Backend] <a name="about-project"></a>

**[DriveWise Backend]** is a Ruby on Rails API that serves data to the [DriveWise Frontend](https://github.com/iamchristianani/drivewise-frontend) application. It is a RESTful API that allows users to create, read, update, and delete data from the database.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Framework</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **User** - Create, read, update, and delete users
- **Car** - Create, read, update, and delete cars
- **Reaservation** - Create, read, update, and delete reservations.

The API endpoints are:
<details>
  <summary>Users</summary>
  <ul>
    <li>GET /users</li>
    <li>GET /users/:id</li>
    <li>POST /users</li>
    <li>PATCH /users/:id</li>
    <li>DELETE /users/:id</li>
  </ul>
</details>
<details>
  <summary>Cars</summary>
  <ul>
    <li>GET /cars</li>
    <li>GET /cars/:id</li>
    <li>POST /cars</li>
    <li>PATCH /cars/:id</li>
    <li>DELETE /cars/:id</li>
  </ul>
</details>
<details>
  <summary>Reservations</summary>
  <ul>
    <li>GET /reservations</li>
    <li>GET /reservations/:id</li>
    <li>GET /users/:user_id/reservations</li>
    <li>GET /cars/:car_id/reservations</li>
    <li>POST /users/:user_id/reservations</li>
    <li>PATCH /users/:user_id/reservations/:id</li>
    <li>DELETE /users/:user_id/reservations/:id</li>
  </ul>
</details>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](https://drivewise.up.railway.app/api/v1/api-docs)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Ruby
- Rails
- PostgreSQL

### Setup

Clone this repository to your desired folder:


```sh
  cd my-folder
  git clone git@github.com:iamchristianani/drivewise-backend.git
```

### Install

Install this project with:

```sh
  cd drivewise-backend
  bundle install
```

### Setup database

Setup database with:

```sh
  rails db:create
  rails db:migrate
  rails db:seed
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

To test the endpoints with swagger, visit:

```sh
  http://localhost:3000/api-docs
```
### Run tests

To run tests locally, run the following command:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Yuvenal Njoroge**

- GitHub: [@yuvenalmash](https://github.com/yuvenalmash)
- Twitter: [@YuvenalNjoroge](https://twitter.com/YuvenalNjoroge)
- LinkedIn: [Yuvenal Njoroge](https://linkedin.com/in/yuvenal-njoroge)

👤 **Roy Jumah**

- GitHub: [@RoyJumah](https://github.com/RoyJumah)
- Twitter: [@roy_issues](https://twitter.com/roy_issues)
- LinkedIn: [Roy Jumah](https://www.linkedin.com/in/roy-jumah/)

👤 **Christian Ani**

- GitHub: [@iamschristian](https://github.com/iamchristianani)
- Twitter: [@Kriznode](https://twitter.com/kriznode)
- LinkedIn: [Christian Ani](https://www.linkedin.com/in/anikriz/)

👤 **Ahmed Abas**

- GitHub: [@boo-shehab](https://github.com/boo-shehab)
- Twitter: [@boo-shehab2000](https://twitter.com/boo_shehab2000)
- LinkedIn: [@ahmed-al-ali-77b6a0246](https://linkedin.com/in/ahmed-al-ali-77b6a0246)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[Authentication]** - Add authentication to the API endpoints to allow only authorized users to access the data.
- [ ] **[Authorization]** - Add authorization for admin users to access the data.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/iamchristianani/drivewise-backend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, give it a ⭐️!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank all the contributors to this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
