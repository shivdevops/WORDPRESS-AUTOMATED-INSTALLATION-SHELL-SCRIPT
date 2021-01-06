# WORDPRESS AUTOMATED INSTALLATION SHELL SCRIPT

  **Just run the script.A Wordpress automated insatlation shell script for Ubuntu OS's.**
 
 * Download the script.

 * change the file permission with 777

  ` ` ` sudo chmod 777 wordpress-automated-installaton.sh ` ` `

 * Run the script with sudo.

  ` ` ` sudo ./wordpress-automated-installaton.sh ` ` `

## Prerequistes:

 * Ubuntu OS's.
 * Web Server(apache2 or nginx etc).
     * Apache2-LAMP installation link: https://github.com/shivdevops/LAMP-INSTALLATION-SHELL-SCRIPT
     * Nginx-LEMP installation link:  https://github.com/shivdevops/LEMP-INSTALLATION-SHELL-SCRIPT
 * Database(mysql or mariadb etc).
 * PHP.
 
 
 ## Note:
 
 **Install the above prereqistes before running the script and add the following changes in the shell script.**
 
 * Provide your root directory path by replacing the default value **"your-root-directory-path"** i.e eg: /var/www/html or /opt/vhost.(line no:3 in shell script)
 * Provide your directory name for wordpress files stored in root directory by replacing the default value **"your-wordpress-instance-name"**.(line no:5 in shell script)
 * Create database, Provide your database name by replacing the the default value **"your-database-name"**.(line no:7 in shell script)
 * Provide  your database user name by replacing the the default value **"your-database-user-name"**.(line no:9 in shell script)
 * Provide your database password name by replacing the default value **"your-database-password"**.(line no:11 in shell script)
 * Create the virtual host.
 
 **Check twice.If any installation error occures need to remove in the root directory and to install it again from the beginning.Save the edited changes.Run the script.**
