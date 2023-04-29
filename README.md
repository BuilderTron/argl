# Andrea Garza Lopez Learning & Content Specialist Portfolio

## Description

Welcome to the repository of the professional portfolio for Andrea Garza Lopez - Learning Specialist / Content Specialist, designed and developed using Python, Django, and the Wagtail CMS framework. This portfolio showcases the expertise, skills, and accomplishments in the field of learning and content development, offering potential clients or employers a comprehensive look at the specialist's work.

### Technologies & Frameworks

- Python 3.11
- Poetry 1.4.2
- Django 4.1.8
- Wagtail CMS 4.2.2
- Amazon Web Services (AWS)
- PostgreSQL 13
- Docker Engine 20.10.24

### Prerequisites
- Python 3.11
- Docker 20.10.24
- Docker Compose 2.17.2

---

## Instructions

### Environment variable install

* In order for all of this to work, a `.env` file must be created in the `src/portfolio/` directory next to the Docker files.
* Fill in the sensitive data:
    ```
    POSTGRES_DB=portfolio
    POSTGRES_USER=postgres
    POSTGRES_PASSWORD=xxxxxxxx

    SECRET_KEY=django-insecure-xxxxxxxxxxxxxxxxxxxxxxxxxx

    DJANGO_SUPERUSER_USERNAME=admin
    DJANGO_SUPERUSER_PASSWORD=xxxxxxxx
    DJANGO_SUPERUSER_EMAIL=xxxxxxxxxxxxxxxxxxx
    ```

### Run

To spin up the webapp, you must run the `start_services.sh` script. This will run the `migrate` service first. The migrate service will build and run the `db` service. Once it's fully running, migrate service will run python manage.py migrate command followed by the `web` service.

* cd into scripts and run the start_services.sh
    ```./start_services.sh```

### Migrate

* If you made changes to the Django code, such as modifying models, views, or templates, run the refresh.sh script. 
    ```./refresh.sh```

The script will run the makemigrations and migrate commands to reflect your changes without having to rebuild any images. It will restart the `web` service but that is optional. 

### Create Super User

This script is meant to be ran one time only.
It creates the wagtail admin user from the secret information that's in the .env file.

* Run the create_superuser.sh script.
    ```./create_superuser.sh```

---
# Release Notes

<div style="height: 200px; overflow-y: scroll; border: 1px solid #ccc; padding: 10px;">


## Version Released: v0.2.0
### Date: Apr-29-2023

_New Features:_

-   N/A

_Enhancements:_

-   Added Poetry package manager and replaced requirements.txt.
-   Added bash scripts to make dev easier.

_Fixes:_

-   N/A

---
## Version Released: v0.1.0
### Date: Apr-23-2023

_New Features:_

-   Created Wagtail app in a docker container. 
    

_Enhancements:_

-   N/A 

_Fixes:_

-   N/A

---
## Version Released: v0.0.0
### Date: Apr-22-2023

_New Features:_

-   Initial commit & project setup. 
    

_Enhancements:_

-   N/A 

_Fixes:_

-   N/A

---

</div>

