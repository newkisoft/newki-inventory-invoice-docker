sudo docker stop $(sudo docker ps -aq -f name=inventory-invoice)
sudo docker rm $(sudo docker ps -aq -f name=inventory-invoice) 
#sudo docker rmi newki/inventory-invoice:1.1 
sudo docker run --name inventory-invoice --network host -i -d newki/inventory-features:1.1 
sudo docker exec -w / inventory-invoice git clone https://github.com/newkisoft/newki-inventory-invoice-publish.git
sudo docker exec -d -w /newki-inventory-invoice-publish/ inventory-invoice cp appsettings.live.json appsettings.json
sudo docker exec -d -w /newki-inventory-invoice-publish/ inventory-invoice dotnet newki-inventory-invoice.dll 


