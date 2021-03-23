# QuakeMigrate Live Demonstration - Student Seismology Workshop 2021
This repository contains the source code and notebooks for the QuakeMigrate live demo given at the Student Seismology Workshop 2021. This workshop demo is distributed and given using Docker, which allows us to provide a ready-to-use QuakeMigrate environment. No compiler hassle, no dependency faff, and future-proof. To get started, download and install a copy of [Docker](https://www.docker.com).

The image itself is hosted on DockerHub - once you have downloaded and installed Docker, open a new terminal (MacOS/Linux) or PowerShell (Windows), navigate to the demo directory and run:

```
docker pull hemmelig/quakemigrate-ssw
```

to download the image, followed by:

```
docker run -p 8888:8888 quakemigrate-ssw
```

Then copy the URL output to terminal into any browser to load the Jupyter Lab session. The key example is in the `volcano-tectonic_example` directory.

License
-------
This live demo is written and maintained by the QuakeMigrate developers, Copyright QuakeMigrate developers 2020-2021. It is distributed under the GPLv3 License. Please see the [LICENSE](LICENSE) file for a complete description of the rights and freedoms that this provides the user.

What is Docker?
---------------
Docker is a set of platform as a service products that use OS-level virtualisation to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels. (From Wikipedia)

Contact
-------
Any additional comments/questions can be directed to:
* **Conor Bacon** - conor.bacon@esc.cam.ac.uk
* **Tom Winder** - tom.winder@esc.cam.ac.uk
