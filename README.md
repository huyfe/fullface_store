# Dự án web bán hàng nón fullface
## Các bước khởi chạy project
### Bước 1. Clone project này về và mở terminal lên copy & paste đoạn code phía dưới
```
git clone https://github.com/huyfe/fullface_store.git && 
cd fullface_store && 
npm install
```
### Bước 2. Tạo database tên là fullface_shop trong **phpmyadmin** 
#### Click vào chữ Mới
![image](https://user-images.githubusercontent.com/80065830/204582168-5a587e84-1e9b-4ab1-9a1e-478e7d146851.png)

#### Nhập tên database (fullface_shop)
![image](https://user-images.githubusercontent.com/80065830/204582773-2b03f21d-3632-4677-ad24-d72520569757.png)

#### Sau khi nhập tên database thì -> click vào chữ Tạo
![image](https://user-images.githubusercontent.com/80065830/204583022-4908222f-e434-4ebe-aa0a-ca950c25e925.png)

### Bước 3. Insert database mẫu trong source code có tên là fullface_shop.sql
#### Sau khi tạo database xong thì tiến hành insert mẫu database mà mình đã export sẵn cho các bạn.
#### Click vào nút Nhập/Insert
![image](https://user-images.githubusercontent.com/80065830/204584209-14f8f96b-427e-4995-be56-6e32183c4a7a.png)

#### Click vào Choose File
![image](https://user-images.githubusercontent.com/80065830/204584743-0ccb2be4-de3f-4ce5-9d91-178afebcecb3.png)

#### Lúc này sẽ hiện lên pop up cho bạn chọn file. Vào trong source code mà bạn đã clone ở bước 1 tìm đến file tên là fullface_shop.sql nhé!
![image](https://user-images.githubusercontent.com/80065830/204584947-7186adc1-092e-402d-9787-a76e9c650bea.png)

#### Sau khi chọn xong -> scroll xuống cuối màn hình click vào nút Thực hiện
![image](https://user-images.githubusercontent.com/80065830/204585406-9fa3f38c-a767-4d75-a5a2-3846dfe9a69b.png)

#### Đợi phpmyadmin insert xong database của chúng ta là hoàn tất quá trình chuẩn bị database. Bây giờ tiến hành start dự án NodeJS thôi nào!!!

### Bước 4. Quay trở lại project mở terminal hoặc git bash lên cd vào project mình đã clone nhé. Sau đó gõ lệnh 
```
nodemon
```
Nếu như terminal in ra đoạn text này tức là đã start thành công

> Database is connected successfully

> Server is running on port localhost:3000


### Bước 5. Mở trình duyệt lên truy cập domain: localhost:3000 và thưởng thức thành quả thôi nào!.

## Xin cảm ơn và chúc các bạn thành công :clap:
*Dev Author: Huy FE*
