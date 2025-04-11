FROM alpine:3.20.6

RUN apk update && apk upgrade && \
    apk add --no-cache \
    curl vim vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN adduser -D -h /home/ajuliao -s /sbin/nologin ajuliao && \
    echo "ajuliao:senha123" | chpasswd

RUN chmod 755 /home/ajuliao

EXPOSE 20 21 40000-50000

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]

# FROM alpine:3.20.6

# RUN apk update && apk upgrade && \
#     apk add --no-cache \
#     curl vim vsftpd

# COPY        ./conf/vsftpd.conf /usr/local/bin/
# # COPY        ./tools/init.sh /usr/local/bin/
# # RUN         chmod 755 /usr/local/bin/init.sh

# # RUN sed -i "s|#write_enable=YES|write_enable=YES|g" /etc/vsftpd/vsftpd.conf && \
# #     sed -i "s|#local_enable=YES|local_enable=YES|g" /etc/vsftpd/vsftpd.conf && \
# #     sed -i "s|#chroot_local_user=YES|chroot_local_user=YES|g" /etc/vsftpd/vsftpd.conf
# COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

# RUN adduser -D -h /home/ajuliao -s /sbin/nologin ajuliao && \
#     echo "ajuliao:senha123" | chpasswd



# RUN chmod 777 /home/ajuliao

# EXPOSE 21 

# CMD ["sh", "-c"]
