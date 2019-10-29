#镜像
FROM golang:latest
#作者
MAINTAINER Razil "vonggene@163.com"
#设置工作目录
WORKDIR $GOPATH/src/github.com/mygohttp
#将服务器的go工程代码加入到docker容器中
ADD . $GOPATH/src/github.com/mygohttp
#COPY package $GOPATH/src/
#COPY package $GOPATH/src/github.com/
COPY package/package_golang_org $GOPATH/src
#COPY package/package_labstack $GOPATH/src/github.com
RUN go get -u github.com/labstack/echo
#go构建可执行文件
RUN go build .
#暴露端口
EXPOSE 6064
#最终运行docker的命令
ENTRYPOINT  ["./mygohttp"]


