dnf module disable redis -y
dnf module enable redis:7 -y

dnf install redis -y 

sed -i.bak -e 's/^bind 127\.0\.0\.1/bind 0.0.0.0/' /etc/redis/redis.conf
sed -i -e 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

systemctl enable redis 
systemctl start redis 