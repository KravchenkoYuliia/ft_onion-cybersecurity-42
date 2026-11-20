# ft_onion

ft_onion is a part of cybersecurity bootcam made by 42 school.
The goal of this project is to create a web page and make it accessible from the Tor network by creating a hidden service.

## Usage

Clone the Repository:  
``` bash
git clone git@github.com:KravchenkoYuliia/ft_onion-cybersecurity-42.git
```

Inside the Repository Build Docker Image:  
```bash
docker build -t onion_image .
```

Run the Image:  
``` bash
docker run -d --name onion_container --env-file .env -p 4242:4242 onion_image
```

Enter the Container:
``` bash
docker exec -it onion_container sh
```

Check the Page is Accessible with port 80:
``` bash
docker exec onion_container curl -I http://localhost:80
```

Get the Hostname:  
``` bash
cat /var/lib/tor/hidden_service/hostname
```

Open TOR Browser and Write the Hostname

Connect with SSH:  
``` bash
ssh -p 4242 user@localhost
```