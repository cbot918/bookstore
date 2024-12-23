# bookstore

## 安裝
### 1. 安裝 dotnet cli
### 2. 安裝 mysql server / mysql workbench

## 起空專案
```bash
1. dotnet new webapi -n bookstore
2. dotnet build
3. dotnet run 
```

此時會有兩個 port, 可以直接連連看, 可能會有 https 不受信任的問題, 需要下載憑證加到 windows 憑證管理員裡面

```bash
1. 去瀏覽器左上角鎖頭那邊
2. 點 Connection is not secure
3. 右上角 X 左邊有個 小卡片圖案(download certificate)
4. 下載隨便存個名字 例如 localhost.crt
```
這時候搜尋 windows 控制台(control panel) > 憑證管理員(certificate manager)
點進去然後可以參考[這邊的步驟](https://www.ibm.com/docs/zh-tw/cognos-tm1/10.2.2?topic=SS9RXT_10.2.2/com.ibm.swg.ba.cognos.tm1_inst.10.2.2.doc/t_addyourcertificatetothecertificatestore_n1207e1.htm), 如果覺得不太懂, 網路上也滿多教學, 或是直接找我一起做xDD

加完憑證後, 重啟一下server, 應該就不會有網站不被信任了

### Controllers
看一下 Controllers 資料夾, 裡面有個做好的路由

可以訪問 `http://localhost:5202/GetWeatherForecast` 應該會有資料跳出來 ( 可能打開 console 看一下)


### 靜態網頁
在 Program.cs 裡面加入以下
```bash
app.UseStaticFiles();
app.MapFallbackToFile("index.html");
```
如果沒信心加入的位置, 可以參考一下專案的 Program.cs

先開一個 wwwroot 資料夾這邊來放 html + js 檔案
index.html
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Static Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Hello, .NET Core!</h1>
    <script src="script.js"></script>
</body>
</html>
```

script.js
```js
const log = console.log

const url = "https://localhost:7189/WeatherForecast";

fetch(url)
  .then(res=>res.json())
  .then(data=>log(data))
  .catch(e=>{
    log(e)
  })
```

都準備好了 重新啟動 server, 點開 https://localhost:7189 網頁應該會看到 hello world 的字, 然後 F12 看 console 應該會看到 json 資料進來, 這邊只是幫 WeatherForecast 加一個前端頁面而已