# Sử dụng Ubuntu làm image cơ bản
FROM ubuntu:latest

# Thông tin tác giả
MAINTAINER Nguyen Phuc "phucm3724014@gstudent.ctu.edu.vn"

# Cập nhật hệ thống và cài đặt các gói cần thiết
RUN apt update -y && apt install -y \
    python3-pip \
    python3-venv \
    python3-dev \
    build-essential

# Thêm mã nguồn ứng dụng Flask vào container
ADD . /flask_app

# Chuyển vào thư mục ứng dụng
WORKDIR /flask_app

# Tạo và kích hoạt môi trường ảo
RUN python3 -m venv venv
RUN venv/bin/pip install --upgrade pip

# Cài đặt các dependency từ requirements.txt
RUN venv/bin/pip install -r requirements.txt

# Lệnh để khởi chạy ứng dụng Flask
ENTRYPOINT ["venv/bin/python"]
CMD ["flask_docker.py"]

