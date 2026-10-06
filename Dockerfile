# 1. Chọn Image nền nhẹ có sẵn Node.js v18 (alpine là bản Linux siêu nhẹ)
FROM node:18-alpine

# 2. Tạo một thư mục làm việc tên là /app bên trong Container
WORKDIR /app

# 3. Copy file định nghĩa thư viện (package.json và package-lock.json) vào Container
COPY package*.json ./

# 4. Chạy lệnh cài đặt các thư viện (node_modules) bên trong Container
RUN npm install

# 5. Copy toàn bộ code còn lại từ máy thật vào thư mục làm việc /app trong Container
COPY . .

# 6. Mở/Khai báo cổng 3000 để Container có thể nhận dữ liệu từ ngoài
EXPOSE 3000

# 7. Lệnh mặc định sẽ chạy khi Container khởi động (tương đương gõ 'node index.js')
# Đảm bảo dòng CMD cuối cùng gọi đúng file server.js
CMD ["node", "server.js"]