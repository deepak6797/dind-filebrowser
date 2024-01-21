Docker inside docker with web file browser  
Default user and password for file browser is admin admin
Steps
1. docker build -t image_name:version .    
2. docker run -dit --privileged -p 8080:8080 -p 8081:8081 --name user-define-name image_name:version  
![Screenshot from 2024-01-21 13-56-42](https://github.com/deepak6797/dind-filebrowser/assets/73154390/cff3596f-69b4-48f2-8c8f-0bfbe2e9f607)
localhost:8081 for accessing filebrowser
