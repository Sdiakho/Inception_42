all :
	mkdir -p "/home/sdiakho/data/wordpress"
	mkdir -p "/home/sdiakho/data/mariadb"
	docker-compose -f docker-compose.yml up -d

clean :
	docker-compose -f docker-compose.yml down

fclean :
	docker-compose -f docker-compose.yml down -v --rmi all
	docker network prune -f
	sudo rm -rf "/home/sdiakho/data/wordpress"
	sudo rm -rf "/home/sdiakho/data/mariadb"
	
re : fclean all

.PHONY: all clean fclean re 
