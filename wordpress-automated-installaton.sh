#!/bin/bash
       # provide the root directory path (eg:/var/www/html/ or /opt/vhost/)
       ROOT_DIRECTORY_PATH="your-root-directory-path"
       # provide the directory name i.e create a directory in root directory to copy the wordpress files 
       DIRECTORY_NAME="your-wordpress-root-directory-name"
       #provide the database name, create a database 
       DB_NAME="your-database-name"
       #provide the database user name.
       DB_USER="your-database-user-name"
       #provide the database password
       DB_PASSWORD="your-database-password"
echo
echo

       echo  "Downloading Wordpresss..." 
       #changes into tmp directory	
       cd /tmp
       
       #downloads the wordpress tar file
       curl -O -s https://wordpress.org/latest.tar.gz

       #untar the file	
       tar xzf latest.tar.gz
echo
echo
	echo " Installig php dependencies..."
	
	#installing the php dependencies
	CURRENT=$(php -v | head -n 1 | cut -d " " -f 2 | cut -f1-2 -d".")

	apt install php$CURRENT-soap  -y > /dev/null 2>&1
	apt install php$CURRENT-curl  -y > /dev/null 2>&1
	apt install php$CURRENT-gd  -y > /dev/null 2>&1
	apt install php$CURRENT-mbsting  -y > /dev/null 2>&1
	apt install php$CURRENT-xml  -y > /dev/null 2>&1
	apt install php$CURRENT-xmlprc  -y > /dev/null 2>&1
	apt install php$CURRENT-intl  -y > /dev/null 2>&1
	apt install php$CURRENT-zip  -y > /dev/null 2>&1
echo
echo
	echo "installing wordpress...";
echo
echo   

        
        #creates the htaccess file
	touch /tmp/wordpress/.htaccess

	#creates the wp-config file
	cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
	
	#creates wordpressroot directory 
	mkdir -p "$ROOT_DIRECTORY_PATH""$DIRECTORY_NAME"
	
	#creates the wordpress files in root diewctory
 	cp -a /tmp/wordpress/* "$ROOT_DIRECTORY_PATH""$DIRECTORY_NAME"
       
	#change the ownership data to www-data
 	chown -R www-data:www-data "$ROOT_DIRECTORY_PATH""$DIRECTORY_NAME"

	#changing the folder's permision to 750
	find "$ROOT_DIRECTORY_PATH""$DIRECTORY_NAME" -type d -exec chmod 750 {} \;
        
	#changing the file's permission to 640
 	find  "$ROOT_DIRECTORY_PATH""$DIRECTORY_NAME" -type f -exec chmod 640 {} \;

        #defined path for wp-config.php
        WP_CONFIG_FILE=""$ROOT_DIRECTORY_PATH""$DIRECTORY_NAME"/wp-config.php"

	#genrates salt key for wordpress
	SALT=$(curl -L -s https://api.wordpress.org/secret-key/1.1/salt/)
	STRING='put your unique phrase here'
	printf '%s\n' "g/$STRING/d" a "$SALT" . w | ed -s "$WP_CONFIG_FILE"

	#prints the database name in wp-config.php
	db=$(grep database_name_here "$WP_CONFIG_FILE" | cut -d"'" -f4)
	sed -i "s/$db/$DB_NAME/g" "$WP_CONFIG_FILE"

	#prints the database user name in wp-config.php
	user_name=$(grep username_here "$WP_CONFIG_FILE" | cut -d"'" -f4)
	sed -i "s/$user_name/$DB_USER/g" "$WP_CONFIG_FILE"

	#prints the database password in wp-config,php
	password=$(grep password_here "$WP_CONFIG_FILE" | cut -d"'" -f4)
	sed -i "s/$password/$DB_PASSWORD/g" "$WP_CONFIG_FILE"

	cd  /tmp
	#removes the downloaded wordpress tar
	rm -rf latest.tar.gz
	#removes the temporary wordpress file
	rm -rf wordpress

	echo "sucessfully installed wordpress";
	
echo
echo
	echo "check in your browser by: or by: https://yourdomain or  https://yourdomain/$DIRECTORY_NAME  or by:http://your-ip/$DIRECTORY_NAME";
