FROM alpine:edge
COPY . /home/install
RUN apk add --update redis nodejs curl nodejs-npm git && \
	curl https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt > /home/gfwrules.list && \
	git clone https://github.com/billtt/dnskeeper.git /home/dnskeeper && \
	mv /home/install/default.json /home/dnskeeper/config/default.json && \
	mv /home/install/redis.conf /home/redis.conf && \
	mv /home/install/run.sh /home/run.sh && rm -rf /home/dnskeeper/.git && \
	chmod +x /home/run.sh && rm -rf /home/install && rm -rf /var/cache/apk/* && \
	cd /home/dnskeeper && npm install
WORKDIR /home/dnskeeper
CMD "/home/run.sh"
